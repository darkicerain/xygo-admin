package service

import (
	"context"
	api "xygo/api/admin"
)

type (
	IMonitor interface {
		// GetPerformanceStats 获取性能统计聚合数据
		GetPerformanceStats(ctx context.Context, startDate, endDate string) (*api.MonitorStatsRes, error)
		// GetSlowApiTop 获取慢接口排行
		GetSlowApiTop(ctx context.Context, startDate, endDate string, limit int) (*api.MonitorSlowTopRes, error)
	}
)

var localMonitor IMonitor

func Monitor() IMonitor {
	if localMonitor == nil {
		panic("implement not found for interface IMonitor, forgot register?")
	}
	return localMonitor
}

func RegisterMonitor(i IMonitor) {
	localMonitor = i
}
