package admin

import (
	"context"

	api "xygo/api/admin"
	"xygo/internal/library/monitor"
	"xygo/internal/service"
)

// MonitorServer 获取服务器实时信息
func (c *ControllerV1) MonitorServer(ctx context.Context, req *api.MonitorServerReq) (res *api.MonitorServerRes, err error) {
	info, err := monitor.GetServerInfo()
	if err != nil {
		return nil, err
	}
	return &api.MonitorServerRes{ServerInfo: info}, nil
}

// MonitorStats 获取性能统计数据
func (c *ControllerV1) MonitorStats(ctx context.Context, req *api.MonitorStatsReq) (res *api.MonitorStatsRes, err error) {
	return service.Monitor().GetPerformanceStats(ctx, req.StartDate, req.EndDate)
}

// MonitorSlowTop 获取慢接口排行
func (c *ControllerV1) MonitorSlowTop(ctx context.Context, req *api.MonitorSlowTopReq) (res *api.MonitorSlowTopRes, err error) {
	return service.Monitor().GetSlowApiTop(ctx, req.StartDate, req.EndDate, req.Limit)
}

// MonitorPprofTop 函数级性能分析（CPU + 内存热点 Top N）
func (c *ControllerV1) MonitorPprofTop(ctx context.Context, req *api.MonitorPprofTopReq) (res *api.MonitorPprofTopRes, err error) {
	result, err := monitor.GetPprofTop(req.Seconds, req.Limit)
	if err != nil {
		return nil, err
	}
	return &api.MonitorPprofTopRes{PprofTopResult: result}, nil
}
