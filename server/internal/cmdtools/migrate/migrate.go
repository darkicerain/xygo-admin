// +----------------------------------------------------------------------
// | XYGo Admin 数据库迁移逻辑
// +----------------------------------------------------------------------
// | 用途：供 gcmd 子命令调用的迁移执行逻辑
// | 支持 up / status / history 三个操作
// +----------------------------------------------------------------------

package migrate

import (
	"bufio"
	"context"
	"crypto/sha256"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"sort"
	"strings"
	"time"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gcfg"
	"github.com/gogf/gf/v2/os/gfile"
)

const migrationTable = "xy_migration"

type Migration struct {
	Version string
	Name    string
	File    string
	Content string
}

func RunUp(ctx context.Context, interactive ...bool) error {
	db, migrations, err := prepare(ctx)
	if err != nil {
		return err
	}

	done := getExecutedVersions(ctx, db)
	var pendingList []Migration
	for _, m := range migrations {
		if !done[m.Version] {
			pendingList = append(pendingList, m)
		}
	}

	fmt.Println("========================================")
	fmt.Println("  XYGo Admin 数据库迁移工具")
	fmt.Println("========================================")
	fmt.Println()

	if len(pendingList) == 0 {
		fmt.Println("  数据库已是最新版本，无需升级。")
		fmt.Println()
		fmt.Println("========================================")
		return nil
	}

	fmt.Printf("  发现 %d 个待执行的升级：\n\n", len(pendingList))

	for i, m := range pendingList {
		desc := strings.ReplaceAll(m.Name, "_", " ")
		fmt.Printf("  [%d/%d] v%s %s ... ", i+1, len(pendingList), m.Version, desc)

		checksum := fmt.Sprintf("%x", sha256.Sum256([]byte(m.Content)))
		stmts := splitStatements(m.Content)
		var execErr error

		for _, stmt := range stmts {
			stmt = strings.TrimSpace(stmt)
			if stmt == "" || isCommentOnly(stmt) {
				continue
			}
			if _, err = db.Exec(ctx, stmt); err != nil {
				execErr = err
				break
			}
		}

		success := 1
		if execErr != nil {
			success = 0
			fmt.Printf("FAILED\n")
			fmt.Printf("    错误: %v\n", execErr)
		} else {
			fmt.Println("OK")
		}

		_, _ = db.Exec(ctx, "DELETE FROM "+migrationTable+" WHERE version = ?", m.Version)
		_, _ = db.Exec(
			ctx,
			"INSERT INTO "+migrationTable+" (version, name, executed_at, checksum, success) VALUES (?, ?, ?, ?, ?)",
			m.Version, m.Name, time.Now().Unix(), checksum, success,
		)

		if execErr != nil {
			fmt.Println()
			fmt.Println("  升级中断！请修复上述错误后重新运行。")
			fmt.Println("========================================")
			return execErr
		}
	}

	lastVersion := pendingList[len(pendingList)-1].Version
	fmt.Println()
	fmt.Println("========================================")
	fmt.Printf("  升级完成！共执行 %d 个版本\n", len(pendingList))
	fmt.Printf("  当前数据库版本: v%s\n", lastVersion)
	fmt.Println("========================================")
	fmt.Println()

	if len(interactive) == 0 || interactive[0] {
		askRunGenDao()
	}
	return nil
}

func RunStatus(ctx context.Context) error {
	db, migrations, err := prepare(ctx)
	if err != nil {
		return err
	}
	done := getExecutedVersions(ctx, db)
	fmt.Printf("%-12s %-30s %s\n", "VERSION", "NAME", "STATUS")
	fmt.Println(strings.Repeat("-", 60))
	for _, m := range migrations {
		status := "PENDING"
		if done[m.Version] {
			status = "DONE"
		}
		fmt.Printf("%-12s %-30s %s\n", m.Version, m.Name, status)
	}
	return nil
}

func RunHistory(ctx context.Context) error {
	db, _, err := prepare(ctx)
	if err != nil {
		return err
	}
	rows, err := db.GetAll(ctx, "SELECT version, name, executed_at, success FROM "+migrationTable+" ORDER BY id")
	if err != nil {
		return err
	}
	fmt.Printf("%-12s %-30s %-20s %s\n", "VERSION", "NAME", "EXECUTED AT", "SUCCESS")
	fmt.Println(strings.Repeat("-", 75))
	for _, row := range rows {
		ts := row["executed_at"].Int64()
		t := time.Unix(ts, 0).Format("2006-01-02 15:04:05")
		ok := "YES"
		if row["success"].Int() != 1 {
			ok = "FAILED"
		}
		fmt.Printf("%-12s %-30s %-20s %s\n", row["version"].String(), row["name"].String(), t, ok)
	}
	return nil
}

func prepare(ctx context.Context) (gdb.DB, []Migration, error) {
	configPath := findConfigPath()
	if configPath != "" {
		g.Cfg().GetAdapter().(*gcfg.AdapterFile).SetPath(filepath.Dir(configPath))
	}

	db := g.DB()
	dbType := detectDBType(ctx)
	if err := ensureMigrationTable(ctx, db, dbType); err != nil {
		return nil, nil, err
	}
	sqlDir := getSQLDir()
	migrations := scanMigrations(sqlDir, dbType)
	return db, migrations, nil
}

func findConfigPath() string {
	candidates := []string{
		"manifest/config/config.yaml",
		"../manifest/config/config.yaml",
	}
	for _, c := range candidates {
		if gfile.Exists(c) {
			abs, _ := filepath.Abs(c)
			return abs
		}
	}
	return ""
}

func detectDBType(ctx context.Context) string {
	cfg := g.Cfg().MustGet(ctx, "database.default.0.link", "").String()
	if cfg == "" {
		cfg = g.Cfg().MustGet(ctx, "database.default.link", "").String()
	}
	cfg = strings.ToLower(cfg)
	if strings.HasPrefix(cfg, "pgsql:") || strings.HasPrefix(cfg, "postgres:") {
		return "pgsql"
	}
	return "mysql"
}

func getSQLDir() string {
	candidates := []string{
		"cmd_tools/migrate",
		"../cmd_tools/migrate",
	}
	for _, c := range candidates {
		if gfile.Exists(c) {
			abs, _ := filepath.Abs(c)
			return abs
		}
	}
	return "cmd_tools/migrate"
}

func ensureMigrationTable(ctx context.Context, db gdb.DB, dbType string) error {
	var sql string
	if dbType == "pgsql" {
		sql = `CREATE TABLE IF NOT EXISTS xy_migration (
			id bigserial PRIMARY KEY,
			version varchar(32) NOT NULL UNIQUE,
			name varchar(128) NOT NULL DEFAULT '',
			executed_at bigint NOT NULL DEFAULT 0,
			checksum varchar(64) NOT NULL DEFAULT '',
			success smallint NOT NULL DEFAULT 1
		)`
	} else {
		sql = "CREATE TABLE IF NOT EXISTS `xy_migration` (" +
			"`id` bigint UNSIGNED NOT NULL AUTO_INCREMENT," +
			"`version` varchar(32) NOT NULL," +
			"`name` varchar(128) NOT NULL DEFAULT ''," +
			"`executed_at` bigint NOT NULL DEFAULT 0," +
			"`checksum` varchar(64) NOT NULL DEFAULT ''," +
			"`success` tinyint NOT NULL DEFAULT 1," +
			"PRIMARY KEY (`id`)," +
			"UNIQUE KEY `uk_version` (`version`)" +
			") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4"
	}
	_, err := db.Exec(ctx, sql)
	return err
}

func scanMigrations(dir string, dbType string) []Migration {
	entries, err := os.ReadDir(dir)
	if err != nil {
		fmt.Printf("WARNING: cannot read migrations dir %s: %v\n", dir, err)
		return nil
	}

	var migrations []Migration
	for _, e := range entries {
		if e.IsDir() || !strings.HasSuffix(e.Name(), ".sql") {
			continue
		}
		name := e.Name()

		isSpecific := strings.HasSuffix(name, ".mysql.sql") || strings.HasSuffix(name, ".pgsql.sql")
		if isSpecific {
			if dbType == "mysql" && !strings.HasSuffix(name, ".mysql.sql") {
				continue
			}
			if dbType == "pgsql" && !strings.HasSuffix(name, ".pgsql.sql") {
				continue
			}
		}

		parts := strings.SplitN(strings.TrimSuffix(strings.TrimSuffix(strings.TrimSuffix(name, ".sql"), ".mysql"), ".pgsql"), "_", 2)
		version := parts[0]
		desc := ""
		if len(parts) > 1 {
			desc = parts[1]
		}

		content, err := os.ReadFile(filepath.Join(dir, name))
		if err != nil {
			fmt.Printf("WARNING: cannot read %s: %v\n", name, err)
			continue
		}

		migrations = append(migrations, Migration{
			Version: version,
			Name:    desc,
			File:    name,
			Content: string(content),
		})
	}

	sort.Slice(migrations, func(i, j int) bool {
		return compareVersion(migrations[i].Version, migrations[j].Version) < 0
	})

	filtered := make([]Migration, 0, len(migrations))
	seen := make(map[string]bool)
	for _, m := range migrations {
		if !seen[m.Version] {
			seen[m.Version] = true
			filtered = append(filtered, m)
		}
	}
	return filtered
}

func getExecutedVersions(ctx context.Context, db gdb.DB) map[string]bool {
	rows, err := db.GetAll(ctx, "SELECT version FROM "+migrationTable+" WHERE success=1")
	if err != nil {
		return map[string]bool{}
	}
	m := make(map[string]bool, len(rows))
	for _, row := range rows {
		m[row["version"].String()] = true
	}
	return m
}

func splitStatements(sql string) []string {
	var stmts []string
	var current strings.Builder
	inDelimiter := false
	lines := strings.Split(sql, "\n")

	for _, line := range lines {
		trimmed := strings.TrimSpace(line)
		upper := strings.ToUpper(trimmed)

		if upper == "DELIMITER $$" {
			inDelimiter = true
			continue
		}
		if upper == "DELIMITER ;" {
			inDelimiter = false
			if s := strings.TrimSpace(current.String()); s != "" {
				stmts = append(stmts, s)
				current.Reset()
			}
			continue
		}

		if inDelimiter {
			if strings.HasSuffix(trimmed, "$$") {
				current.WriteString(strings.TrimSuffix(trimmed, "$$"))
				stmts = append(stmts, strings.TrimSpace(current.String()))
				current.Reset()
			} else {
				current.WriteString(line + "\n")
			}
		} else {
			if strings.HasSuffix(trimmed, ";") && !strings.HasPrefix(upper, "--") {
				current.WriteString(line + "\n")
				s := strings.TrimSpace(current.String())
				s = strings.TrimSuffix(s, ";")
				if s != "" {
					stmts = append(stmts, s)
				}
				current.Reset()
			} else {
				current.WriteString(line + "\n")
			}
		}
	}
	if s := strings.TrimSpace(current.String()); s != "" {
		s = strings.TrimSuffix(s, ";")
		if s != "" {
			stmts = append(stmts, s)
		}
	}
	return stmts
}

func isCommentOnly(stmt string) bool {
	for _, line := range strings.Split(stmt, "\n") {
		line = strings.TrimSpace(line)
		if line != "" && !strings.HasPrefix(line, "--") {
			return false
		}
	}
	return true
}

func askRunGenDao() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("  是否立即执行 gf gen dao 重新生成数据模型？[Y/n] ")
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(strings.ToLower(input))

	if input == "" || input == "y" || input == "yes" {
		fmt.Println()
		fmt.Println("  正在执行 gf gen dao ...")
		fmt.Println()
		cmd := exec.Command("gf", "gen", "dao")
		cmd.Stdout = os.Stdout
		cmd.Stderr = os.Stderr
		if err := cmd.Run(); err != nil {
			fmt.Printf("\n  gf gen dao 执行失败: %v\n", err)
			fmt.Println("  请手动执行: gf gen dao")
		} else {
			fmt.Println()
			fmt.Println("  gf gen dao 执行完成！")
		}
	} else {
		fmt.Println()
		fmt.Println("  跳过。如有表结构变更，请记得手动执行: gf gen dao")
	}
}

func compareVersion(a, b string) int {
	ap := strings.Split(a, ".")
	bp := strings.Split(b, ".")
	maxLen := len(ap)
	if len(bp) > maxLen {
		maxLen = len(bp)
	}
	for i := 0; i < maxLen; i++ {
		av, bv := 0, 0
		if i < len(ap) {
			fmt.Sscanf(ap[i], "%d", &av)
		}
		if i < len(bp) {
			fmt.Sscanf(bp[i], "%d", &bv)
		}
		if av != bv {
			return av - bv
		}
	}
	return 0
}
