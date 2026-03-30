// +----------------------------------------------------------------------
// | XYGo Admin 扩展安装/卸载逻辑
// +----------------------------------------------------------------------
// | 用途：从 addons/ 目录读取 ZIP 扩展包，执行安装或卸载
// |
// | 扩展包结构：
// |   addons/{name}.zip 解压后包含：
// |     addon.yaml           -- 扩展元信息
// |     install/mysql.sql    -- MySQL 安装 SQL
// |     install/pgsql.sql    -- PgSQL 安装 SQL
// |     uninstall/mysql.sql  -- MySQL 卸载 SQL
// |     uninstall/pgsql.sql  -- PgSQL 卸载 SQL
// |     files/               -- 需要复制到项目的文件（保持目录结构）
// +----------------------------------------------------------------------

package addon

import (
	"archive/zip"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gcfg"
	"github.com/gogf/gf/v2/os/gcmd"
	"github.com/gogf/gf/v2/os/gfile"

	"gopkg.in/yaml.v3"
)

const addonTable = "xy_addon"

type AddonMeta struct {
	Name           string `yaml:"name"`
	Version        string `yaml:"version"`
	Title          string `yaml:"title"`
	Description    string `yaml:"description"`
	Author         string `yaml:"author"`
	MinUpgradeFrom string `yaml:"min_upgrade_from"`
}

func Install(ctx context.Context, name string) error {
	if name == "" {
		name = gcmd.Scan("  请输入扩展包名称（如 tenant）: ")
		name = strings.TrimSpace(name)
		if name == "" {
			fmt.Println("  取消安装")
			return nil
		}
	}

	zipPath := filepath.Join("addons", name+".zip")
	if !gfile.Exists(zipPath) {
		return fmt.Errorf("扩展包不存在: %s", zipPath)
	}

	fmt.Println()
	fmt.Printf("  正在安装扩展: %s\n", name)
	fmt.Println("  ────────────────────────────────")

	// 1. 解压到临时目录
	tmpDir := filepath.Join("addons", ".tmp", name)
	os.RemoveAll(tmpDir)
	fmt.Print("  [1/6] 解压扩展包 ... ")
	if err := unzip(zipPath, tmpDir); err != nil {
		fmt.Println("FAILED")
		return fmt.Errorf("解压失败: %v", err)
	}
	fmt.Println("OK")
	defer os.RemoveAll(filepath.Join("addons", ".tmp"))

	// 2. 读取 addon.yaml
	fmt.Print("  [2/6] 读取扩展信息 ... ")
	metaPath := filepath.Join(tmpDir, name, "addon.yaml")
	if !gfile.Exists(metaPath) {
		metaPath = filepath.Join(tmpDir, "addon.yaml")
	}
	if !gfile.Exists(metaPath) {
		fmt.Println("FAILED")
		return fmt.Errorf("addon.yaml 不存在")
	}
	metaData, _ := os.ReadFile(metaPath)
	var meta AddonMeta
	if err := yaml.Unmarshal(metaData, &meta); err != nil {
		fmt.Println("FAILED")
		return fmt.Errorf("addon.yaml 解析失败: %v", err)
	}
	fmt.Printf("OK (%s v%s)\n", meta.Title, meta.Version)

	// 3. 检查是否已安装，判断安装/升级/覆盖
	db := initDB(ctx)
	ensureAddonTable(ctx, db)
	installed, _ := db.GetOne(ctx, "SELECT * FROM "+addonTable+" WHERE name=? AND status=1", name)

	isUpgrade := false
	if installed != nil {
		installedVer := installed["version"].String()
		cmp := compareVersion(meta.Version, installedVer)
		if cmp > 0 {
			fmt.Printf("  检测到已安装 v%s，新版本 v%s\n", installedVer, meta.Version)
			confirm := gcmd.Scan(fmt.Sprintf("  确认升级 v%s → v%s？[Y/n] ", installedVer, meta.Version))
			if strings.ToLower(strings.TrimSpace(confirm)) == "n" {
				fmt.Println("  取消升级")
				return nil
			}
			isUpgrade = true
		} else if cmp == 0 {
			confirm := gcmd.Scan(fmt.Sprintf("  扩展 %s 已是 v%s，是否覆盖重装？[y/N] ", name, installedVer))
			if strings.ToLower(strings.TrimSpace(confirm)) != "y" {
				fmt.Println("  取消安装")
				return nil
			}
		} else {
			fmt.Printf("  当前已安装 v%s，包版本 v%s 更低，不支持降级\n", installedVer, meta.Version)
			return nil
		}
	}

	// 4. 执行数据库变更
	dbType := detectDBType(ctx)
	var sqlDir string
	if isUpgrade {
		fmt.Print("  [3/6] 执行增量升级 SQL ... ")
		sqlDir = filepath.Join(tmpDir, name, "upgrade")
		if !gfile.Exists(sqlDir) {
			sqlDir = filepath.Join(tmpDir, "upgrade")
		}
	} else {
		fmt.Print("  [3/6] 执行数据库变更 ... ")
		sqlDir = filepath.Join(tmpDir, name, "install")
		if !gfile.Exists(sqlDir) {
			sqlDir = filepath.Join(tmpDir, "install")
		}
	}
	sqlFile := filepath.Join(sqlDir, dbType+".sql")
	if gfile.Exists(sqlFile) {
		if err := execSQLFile(ctx, db, sqlFile); err != nil {
			fmt.Println("FAILED")
			return err
		}
		fmt.Println("OK")
	} else {
		if isUpgrade {
			fmt.Println("SKIP (无升级 SQL)")
		} else {
			fmt.Println("SKIP (无安装 SQL)")
		}
	}

	// 5. 复制文件
	fmt.Print("  [4/6] 复制扩展文件 ... ")
	filesDir := filepath.Join(tmpDir, name, "files")
	if !gfile.Exists(filesDir) {
		filesDir = filepath.Join(tmpDir, "files")
	}
	var copiedFiles []string
	if gfile.Exists(filesDir) {
		projectRoot := getProjectRoot()
		backupDir := filepath.Join("addons", ".backup", name)
		os.MkdirAll(backupDir, 0755)

		err := filepath.Walk(filesDir, func(path string, info os.FileInfo, err error) error {
			if err != nil || info.IsDir() {
				return err
			}
			relPath, _ := filepath.Rel(filesDir, path)
			destPath := filepath.Join(projectRoot, relPath)

			// 备份已存在的文件
			if gfile.Exists(destPath) {
				backupPath := filepath.Join(backupDir, relPath)
				os.MkdirAll(filepath.Dir(backupPath), 0755)
				copyFile(destPath, backupPath)
			}

			os.MkdirAll(filepath.Dir(destPath), 0755)
			if err := copyFile(path, destPath); err != nil {
				return fmt.Errorf("复制 %s 失败: %v", relPath, err)
			}
			copiedFiles = append(copiedFiles, relPath)
			return nil
		})
		if err != nil {
			fmt.Println("FAILED")
			return err
		}
		fmt.Printf("OK (%d 个文件)\n", len(copiedFiles))
	} else {
		fmt.Println("SKIP (无扩展文件)")
	}

	// 6. 记录安装信息
	fmt.Print("  [5/6] 记录安装信息 ... ")
	var finalFileList []string
	if isUpgrade && installed != nil {
		_ = json.Unmarshal([]byte(installed["file_list"].String()), &finalFileList)
		existing := make(map[string]bool)
		for _, f := range finalFileList {
			existing[f] = true
		}
		for _, f := range copiedFiles {
			if !existing[f] {
				finalFileList = append(finalFileList, f)
			}
		}
	} else {
		finalFileList = copiedFiles
	}
	fileListJSON, _ := json.Marshal(finalFileList)
	_, _ = db.Exec(ctx, "DELETE FROM "+addonTable+" WHERE name=?", name)
	_, err := db.Exec(ctx,
		"INSERT INTO "+addonTable+" (name, version, title, status, installed_at, file_list) VALUES (?, ?, ?, 1, ?, ?)",
		name, meta.Version, meta.Title, time.Now().Unix(), string(fileListJSON),
	)
	if err != nil {
		fmt.Println("FAILED")
		return err
	}
	fmt.Println("OK")

	// 7. 提示后续操作
	fmt.Print("  [6/6] 后续操作 ... ")
	fmt.Println()
	fmt.Println()
	fmt.Println("  ════════════════════════════════════════")
	action := "安装"
	if isUpgrade {
		action = "升级"
	}
	fmt.Printf("  扩展 %s v%s %s完成！\n", meta.Title, meta.Version, action)
	fmt.Println("  ════════════════════════════════════════")
	fmt.Println()
	fmt.Println("  请依次执行以下操作：")
	fmt.Println("    1. gf gen dao        (重新生成数据模型)")
	fmt.Println("    2. gf gen service    (重新生成服务接口)")
	fmt.Println("    3. 重启后端服务")
	fmt.Println("    4. 前端: cd web && pnpm install && pnpm run build (如有前端变更)")
	fmt.Println()

	return nil
}

func Uninstall(ctx context.Context, name string) error {
	if name == "" {
		name = gcmd.Scan("  请输入要卸载的扩展名称（如 tenant）: ")
		name = strings.TrimSpace(name)
		if name == "" {
			fmt.Println("  取消卸载")
			return nil
		}
	}

	db := initDB(ctx)
	ensureAddonTable(ctx, db)

	// 1. 检查是否已安装
	record, _ := db.GetOne(ctx, "SELECT * FROM "+addonTable+" WHERE name=? AND status=1", name)
	if record == nil {
		return fmt.Errorf("扩展 %s 未安装", name)
	}

	fmt.Println()
	fmt.Printf("  准备卸载扩展: %s (v%s)\n", record["title"].String(), record["version"].String())
	fmt.Println("  ────────────────────────────────")
	confirm := gcmd.Scan("  警告：卸载将删除扩展表和数据，此操作不可恢复！确认卸载？[y/N] ")
	if strings.ToLower(strings.TrimSpace(confirm)) != "y" {
		fmt.Println("  取消卸载")
		return nil
	}

	// 2. 执行卸载 SQL
	fmt.Print("  [1/4] 执行数据库回滚 ... ")
	dbType := detectDBType(ctx)

	// 先尝试从 ZIP 包读取卸载 SQL
	zipPath := filepath.Join("addons", name+".zip")
	uninstallSQL := ""
	if gfile.Exists(zipPath) {
		tmpDir := filepath.Join("addons", ".tmp", name+"_uninstall")
		os.RemoveAll(tmpDir)
		if err := unzip(zipPath, tmpDir); err == nil {
			sqlFile := filepath.Join(tmpDir, name, "uninstall", dbType+".sql")
			if !gfile.Exists(sqlFile) {
				sqlFile = filepath.Join(tmpDir, "uninstall", dbType+".sql")
			}
			if gfile.Exists(sqlFile) {
				data, _ := os.ReadFile(sqlFile)
				uninstallSQL = string(data)
			}
		}
		defer os.RemoveAll(tmpDir)
	}

	if uninstallSQL != "" {
		stmts := splitStatements(uninstallSQL)
		for _, stmt := range stmts {
			stmt = strings.TrimSpace(stmt)
			if stmt == "" || isCommentOnly(stmt) {
				continue
			}
			if _, err := db.Exec(ctx, stmt); err != nil {
				fmt.Printf("WARNING: %v\n", err)
			}
		}
		fmt.Println("OK")
	} else {
		fmt.Println("SKIP (无卸载 SQL)")
	}

	// 3. 删除安装的文件
	fmt.Print("  [2/4] 删除扩展文件 ... ")
	var fileList []string
	_ = json.Unmarshal([]byte(record["file_list"].String()), &fileList)
	projectRoot := getProjectRoot()
	backupDir := filepath.Join("addons", ".backup", name)
	deleted := 0
	for _, f := range fileList {
		destPath := filepath.Join(projectRoot, f)
		if gfile.Exists(destPath) {
			os.Remove(destPath)
			deleted++
		}
		// 恢复备份
		backupPath := filepath.Join(backupDir, f)
		if gfile.Exists(backupPath) {
			os.MkdirAll(filepath.Dir(destPath), 0755)
			copyFile(backupPath, destPath)
		}
	}
	os.RemoveAll(backupDir)
	fmt.Printf("OK (删除 %d 个，已恢复备份)\n", deleted)

	// 4. 更新安装记录
	fmt.Print("  [3/4] 更新安装记录 ... ")
	_, _ = db.Exec(ctx,
		"UPDATE "+addonTable+" SET status=0, uninstalled_at=? WHERE name=?",
		time.Now().Unix(), name,
	)
	fmt.Println("OK")

	fmt.Println("  [4/4] 后续操作")
	fmt.Println()
	fmt.Println("  ════════════════════════════════════════")
	fmt.Printf("  扩展 %s 已卸载\n", name)
	fmt.Println("  ════════════════════════════════════════")
	fmt.Println()
	fmt.Println("  请依次执行以下操作：")
	fmt.Println("    1. gf gen dao        (重新生成数据模型)")
	fmt.Println("    2. gf gen service    (重新生成服务接口)")
	fmt.Println("    3. 重启后端服务")
	fmt.Println()

	return nil
}

// ==================== 工具函数 ====================

func initDB(ctx context.Context) gdb.DB {
	configPath := findConfigPath()
	if configPath != "" {
		g.Cfg().GetAdapter().(*gcfg.AdapterFile).SetPath(filepath.Dir(configPath))
	}
	return g.DB()
}

func findConfigPath() string {
	for _, c := range []string{"manifest/config/config.yaml", "../manifest/config/config.yaml"} {
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
	if strings.HasPrefix(strings.ToLower(cfg), "pgsql:") || strings.HasPrefix(strings.ToLower(cfg), "postgres:") {
		return "pgsql"
	}
	return "mysql"
}

func getProjectRoot() string {
	if gfile.Exists("main.go") {
		abs, _ := filepath.Abs("..")
		return abs
	}
	abs, _ := filepath.Abs(".")
	return abs
}

func ensureAddonTable(ctx context.Context, db gdb.DB) {
	dbType := detectDBType(ctx)
	var sql string
	if dbType == "pgsql" {
		sql = `CREATE TABLE IF NOT EXISTS xy_addon (
			id bigserial PRIMARY KEY,
			name varchar(64) NOT NULL UNIQUE,
			version varchar(32) NOT NULL DEFAULT '',
			title varchar(128) NOT NULL DEFAULT '',
			status smallint NOT NULL DEFAULT 1,
			installed_at bigint NOT NULL DEFAULT 0,
			uninstalled_at bigint NOT NULL DEFAULT 0,
			file_list text
		)`
	} else {
		sql = "CREATE TABLE IF NOT EXISTS `xy_addon` (" +
			"`id` bigint UNSIGNED NOT NULL AUTO_INCREMENT," +
			"`name` varchar(64) NOT NULL," +
			"`version` varchar(32) NOT NULL DEFAULT ''," +
			"`title` varchar(128) NOT NULL DEFAULT ''," +
			"`status` tinyint NOT NULL DEFAULT 1," +
			"`installed_at` bigint NOT NULL DEFAULT 0," +
			"`uninstalled_at` bigint NOT NULL DEFAULT 0," +
			"`file_list` text," +
			"PRIMARY KEY (`id`)," +
			"UNIQUE KEY `uk_name` (`name`)" +
			") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4"
	}
	db.Exec(ctx, sql)
}

func unzip(src, dest string) error {
	r, err := zip.OpenReader(src)
	if err != nil {
		return err
	}
	defer r.Close()

	for _, f := range r.File {
		fpath := filepath.Join(dest, f.Name)
		if !strings.HasPrefix(filepath.Clean(fpath), filepath.Clean(dest)+string(os.PathSeparator)) {
			return fmt.Errorf("非法路径: %s", f.Name)
		}
		if f.FileInfo().IsDir() || f.UncompressedSize64 == 0 && strings.HasSuffix(f.Name, "/") {
			os.MkdirAll(fpath, 0755)
			continue
		}
		os.MkdirAll(filepath.Dir(fpath), 0755)
		if f.UncompressedSize64 == 0 {
			os.MkdirAll(fpath, 0755)
			continue
		}
		outFile, err := os.OpenFile(fpath, os.O_WRONLY|os.O_CREATE|os.O_TRUNC, f.Mode())
		if err != nil {
			return err
		}
		rc, err := f.Open()
		if err != nil {
			outFile.Close()
			return err
		}
		_, err = io.Copy(outFile, rc)
		rc.Close()
		outFile.Close()
		if err != nil {
			return err
		}
	}
	return nil
}

func copyFile(src, dst string) error {
	in, err := os.Open(src)
	if err != nil {
		return err
	}
	defer in.Close()
	out, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer out.Close()
	_, err = io.Copy(out, in)
	return err
}

func splitStatements(sql string) []string {
	var stmts []string
	var current strings.Builder
	inDelimiter := false
	for _, line := range strings.Split(sql, "\n") {
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
			if trimmed == "" {
				if s := strings.TrimSpace(current.String()); s != "" && isCommentOnly(s) {
					current.Reset()
				}
				current.WriteString(line + "\n")
			} else if strings.HasSuffix(trimmed, ";") && !strings.HasPrefix(upper, "--") {
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

func truncate(s string, maxLen int) string {
	if len(s) <= maxLen {
		return s
	}
	return s[:maxLen] + "..."
}

func execSQLFile(ctx context.Context, db gdb.DB, sqlFile string) error {
	sqlContent, _ := os.ReadFile(sqlFile)
	stmts := splitStatements(string(sqlContent))
	for _, stmt := range stmts {
		stmt = strings.TrimSpace(stmt)
		if stmt == "" || isCommentOnly(stmt) {
			continue
		}
		if _, err := db.Exec(ctx, stmt); err != nil {
			errMsg := err.Error()
			if strings.Contains(errMsg, "already exists") ||
				strings.Contains(errMsg, "已存在") ||
				strings.Contains(errMsg, "多个主键") ||
				strings.Contains(errMsg, "duplicate key") ||
				strings.Contains(errMsg, "重复键") {
				continue
			}
			return fmt.Errorf("SQL 执行失败: %v\n  语句: %s", err, truncate(stmt, 200))
		}
	}
	return nil
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
