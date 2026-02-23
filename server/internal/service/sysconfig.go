// ================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
)

type (
	ISysConfig interface {
		// InitConfig 启动初始化
		InitConfig(ctx context.Context)
		// LoadConfig 预加载配置（预留：可在此将部分分组注入业务组件）
		LoadConfig(ctx context.Context) error
		// GetConfigByGroup 获取指定分组配置
		GetConfigByGroup(ctx context.Context, group string) (map[string]string, error)
	}
)

var (
	localSysConfig ISysConfig
)

func SysConfig() ISysConfig {
	if localSysConfig == nil {
		panic("implement not found for interface ISysConfig, forgot register?")
	}
	return localSysConfig
}

func RegisterSysConfig(i ISysConfig) {
	localSysConfig = i
}
