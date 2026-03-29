//go:build ignore

// +----------------------------------------------------------------------
// | XYGo Admin 工具命令入口
// +----------------------------------------------------------------------
// | 用途：提供交互式工具菜单，支持数据库迁移、模板检查等开发辅助命令
// |
// | 使用方式：
// |   gf run tools.go                 -- 交互式选择命令
// |   gf run tools.go migrate up      -- 直接执行迁移
// |   gf run tools.go migrate status  -- 查看迁移状态
// |   gf run tools.go migrate history -- 查看迁移历史
// |   gf run tools.go check-tpl       -- 检查模板语法
// +----------------------------------------------------------------------

package main

import (
	"fmt"
	"os"
	"strings"

	_ "github.com/gogf/gf/contrib/drivers/mysql/v2"
	_ "github.com/gogf/gf/contrib/drivers/pgsql/v2"
	"github.com/gogf/gf/v2/os/gcmd"
	"github.com/gogf/gf/v2/os/gctx"

	"xygo/internal/cmdtools/addon"
	"xygo/internal/cmdtools/checktpl"
	"xygo/internal/cmdtools/migrate"
)

func main() {
	ctx := gctx.New()

	// 如果有命令行参数，直接执行对应命令
	if len(os.Args) > 1 {
		cmd := os.Args[1]
		sub := ""
		if len(os.Args) > 2 {
			sub = os.Args[2]
		}
		runCommand(cmd, sub)
		return
	}

	// 无参数，进入交互式菜单
	for {
		fmt.Println()
		fmt.Println("  ╔════════════════════════════════════════════════════════════╗")
		fmt.Println("  ║                                                            ║")
		fmt.Println("  ║              XYGo Admin Tools v1.2.6                       ║")
		fmt.Println("  ║        Vue3 + GoFrame 企业级中后台管理系统                 ║")
		fmt.Println("  ║                                                            ║")
		fmt.Println("  ╠════════════════════════════════════════════════════════════╣")
		fmt.Println("  ║                                                            ║")
		fmt.Println("  ║  官网:   https://www.xygoadmin.com                         ║")
		fmt.Println("  ║  Gitee:  https://gitee.com/a751300685a/xygo-admin          ║")
		fmt.Println("  ║  GitHub: https://github.com/z312193608/xygo-admin          ║")
		fmt.Println("  ║                                                            ║")
		fmt.Println("  ╠════════════════════════════════════════════════════════════╣")
		fmt.Println("  ║                                                            ║")
		fmt.Println("  ║  [1] migrate up        执行数据库迁移                      ║")
		fmt.Println("  ║  [2] migrate status    查看迁移状态                        ║")
		fmt.Println("  ║  [3] migrate history   查看迁移历史                        ║")
		fmt.Println("  ║  [4] check-tpl         检查模板语法                        ║")
		fmt.Println("  ║  [5] addon install     安装扩展                            ║")
		fmt.Println("  ║  [6] addon uninstall   卸载扩展                            ║")
		fmt.Println("  ║  [0] exit              退出                                ║")
		fmt.Println("  ║                                                            ║")
		fmt.Println("  ╚════════════════════════════════════════════════════════════╝")
		fmt.Println()

		choice := gcmd.Scan("  请选择命令 [0-6]: ")
		choice = strings.TrimSpace(choice)

		switch choice {
		case "1":
			_ = migrate.RunUp(ctx)
		case "2":
			_ = migrate.RunStatus(ctx)
		case "3":
			_ = migrate.RunHistory(ctx)
		case "4":
			_ = checktpl.Run(ctx)
		case "5":
			_ = addon.Install(ctx, "")
		case "6":
			_ = addon.Uninstall(ctx, "")
		case "0", "exit", "quit", "q":
			fmt.Println("  Bye!")
			fmt.Println("  提示：按 Ctrl+C 或关闭终端退出 gf run 监控进程")
			os.Exit(0)
		default:
			fmt.Println("  无效选项，请重新选择")
		}
	}
}

func runCommand(cmd, sub string) {
	ctx := gctx.New()
	switch cmd {
	case "migrate":
		switch sub {
		case "up":
			_ = migrate.RunUp(ctx)
		case "status":
			_ = migrate.RunStatus(ctx)
		case "history":
			_ = migrate.RunHistory(ctx)
		default:
			fmt.Printf("  未知的 migrate 子命令: %s\n", sub)
			fmt.Println("  可用: up / status / history")
		}
	case "check-tpl":
		_ = checktpl.Run(ctx)
	case "addon":
		switch sub {
		case "install":
			addonName := ""
			if len(os.Args) > 3 {
				addonName = os.Args[3]
			}
			_ = addon.Install(ctx, addonName)
		case "uninstall":
			addonName := ""
			if len(os.Args) > 3 {
				addonName = os.Args[3]
			}
			_ = addon.Uninstall(ctx, addonName)
		default:
			fmt.Printf("  未知的 addon 子命令: %s\n", sub)
			fmt.Println("  可用: install / uninstall")
		}
	default:
		fmt.Printf("  未知命令: %s\n", cmd)
		fmt.Println("  可用: migrate / check-tpl / addon")
	}
}
