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
	IMemberScoreLog interface {
		// List 积分变动日志列表
		List(ctx context.Context, in *adminin.MemberScoreLogListInp) (*adminin.MemberScoreLogListModel, error)
		// View 积分变动日志详情
		View(ctx context.Context, id uint64) (*adminin.MemberScoreLogViewModel, error)
		// Edit 保存积分变动日志
		Edit(ctx context.Context, in *adminin.MemberScoreLogEditInp) error
		// Delete 删除积分变动日志
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localMemberScoreLog IMemberScoreLog
)

func MemberScoreLog() IMemberScoreLog {
	if localMemberScoreLog == nil {
		panic("implement not found for interface IMemberScoreLog, forgot register?")
	}
	return localMemberScoreLog
}

func RegisterMemberScoreLog(i IMemberScoreLog) {
	localMemberScoreLog = i
}
