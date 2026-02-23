package global

import (
	"context"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"

	"xygo/internal/service"
)

// Init 全局初始化入口，类似 HotGo 的 global.Init，但当前只做最基础的环境设置。
// 后续可以在这里逐步增加：
// - 运行模式(gmode)设置
// - 链路追踪初始化
// - 缓存/Redis 适配器
// - 系统配置预加载
// - 超级管理员/基础数据校验
func Init(ctx context.Context) {
	// 时区：从配置读取，默认 Asia/Shanghai
	tz := g.Cfg().MustGet(ctx, "server.timezone", "Asia/Shanghai").String()
	if err := gtime.SetTimeZone(tz); err != nil {
		g.Log().Fatalf(ctx, "failed to set timezone: %+v", err)
		return
	}

	g.Log().Infof(ctx, "xygo server starting with timezone: %s", tz)

	// 初始化系统配置（SysConfig 已由 logic/sysconfig 包 init() 自动注册）
	service.SysConfig().InitConfig(ctx)
}
