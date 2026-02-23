// ================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// You can delete these comments if you wish manually maintain this interface file.
// ================================================================================

package service

import (
	"context"
	"xygo/internal/model/input/adminin"
)

type (
	IMemberLoginLog interface {
		// List 登录日志列表
		List(ctx context.Context, in *adminin.MemberLoginLogListInp) (*adminin.MemberLoginLogListModel, error)
		// View 登录日志详情
		View(ctx context.Context, id uint64) (*adminin.MemberLoginLogViewModel, error)
		// Delete 删除登录日志
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localMemberLoginLog IMemberLoginLog
)

func MemberLoginLog() IMemberLoginLog {
	if localMemberLoginLog == nil {
		panic("implement not found for interface IMemberLoginLog, forgot register?")
	}
	return localMemberLoginLog
}

func RegisterMemberLoginLog(i IMemberLoginLog) {
	localMemberLoginLog = i
}
