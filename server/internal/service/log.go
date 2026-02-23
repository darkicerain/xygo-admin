// ================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"xygo/internal/model/entity"
	"xygo/internal/model/input/adminin"
)

type (
	IAdminLog interface {
		// RecordLoginLog 记录登录日志
		RecordLoginLog(ctx context.Context, log *entity.AdminLoginLog)
		// LoginLogList 登录日志列表
		LoginLogList(ctx context.Context, in *adminin.LoginLogListInp) (list []adminin.LoginLogItem, total int, err error)
		// LoginLogDelete 删除登录日志
		LoginLogDelete(ctx context.Context, in *adminin.LoginLogDeleteInp) (err error)
		// LoginLogClear 清空登录日志
		LoginLogClear(ctx context.Context) (err error)
		// RecordOperationLog 记录操作日志
		RecordOperationLog(ctx context.Context, log *entity.AdminOperationLog)
		// OperationLogList 操作日志列表
		OperationLogList(ctx context.Context, in *adminin.OperationLogListInp) (list []adminin.OperationLogItem, total int, err error)
		// OperationLogDetail 操作日志详情
		OperationLogDetail(ctx context.Context, in *adminin.OperationLogDetailInp) (out *adminin.OperationLogItem, err error)
		// OperationLogDelete 删除操作日志
		OperationLogDelete(ctx context.Context, in *adminin.OperationLogDeleteInp) (err error)
		// OperationLogClear 清空操作日志
		OperationLogClear(ctx context.Context) (err error)
	}
)

var (
	localAdminLog IAdminLog
)

func AdminLog() IAdminLog {
	if localAdminLog == nil {
		panic("implement not found for interface IAdminLog, forgot register?")
	}
	return localAdminLog
}

func RegisterAdminLog(i IAdminLog) {
	localAdminLog = i
}
