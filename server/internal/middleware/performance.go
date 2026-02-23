package middleware

import (
	"time"

	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/net/ghttp"
	"github.com/gogf/gf/v2/os/gctx"
)

// SlowApiMonitor 慢接口监控中间件
// 记录接口耗时，超过阈值时输出 WARNING 日志
func SlowApiMonitor(r *ghttp.Request) {
	start := time.Now()

	r.Middleware.Next()

	elapsed := time.Since(start).Milliseconds()
	ctx := r.GetCtx()

	enabled := g.Cfg().MustGet(ctx, "performance.slowApi.enabled").Bool()
	if !enabled {
		return
	}

	threshold := g.Cfg().MustGet(ctx, "performance.slowApi.threshold").Int64()
	if threshold <= 0 {
		threshold = 1000
	}

	if elapsed >= threshold {
		traceId := gctx.CtxId(ctx)
		g.Log().Warningf(ctx,
			"[慢接口] %s %s | 耗时: %dms | 阈值: %dms | TraceId: %s",
			r.Method, r.URL.Path, elapsed, threshold, traceId,
		)
	}
}
