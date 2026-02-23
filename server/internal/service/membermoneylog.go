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
	IMemberMoneyLog interface {
		// List 余额变动日志列表
		List(ctx context.Context, in *adminin.MemberMoneyLogListInp) (*adminin.MemberMoneyLogListModel, error)
		// View 余额变动日志详情
		View(ctx context.Context, id uint64) (*adminin.MemberMoneyLogViewModel, error)
		// Edit 保存余额变动日志
		Edit(ctx context.Context, in *adminin.MemberMoneyLogEditInp) error
		// Delete 删除余额变动日志
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localMemberMoneyLog IMemberMoneyLog
)

func MemberMoneyLog() IMemberMoneyLog {
	if localMemberMoneyLog == nil {
		panic("implement not found for interface IMemberMoneyLog, forgot register?")
	}
	return localMemberMoneyLog
}

func RegisterMemberMoneyLog(i IMemberMoneyLog) {
	localMemberMoneyLog = i
}
