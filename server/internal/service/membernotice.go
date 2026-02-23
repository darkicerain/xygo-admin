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
	IMemberNotice interface {
		// List 会员通知列表
		List(ctx context.Context, in *adminin.MemberNoticeListInp) (*adminin.MemberNoticeListModel, error)
		// View 会员通知详情
		View(ctx context.Context, id uint64) (*adminin.MemberNoticeViewModel, error)
		// Edit 保存会员通知
		Edit(ctx context.Context, in *adminin.MemberNoticeEditInp) error
		// Delete 删除会员通知
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localMemberNotice IMemberNotice
)

func MemberNotice() IMemberNotice {
	if localMemberNotice == nil {
		panic("implement not found for interface IMemberNotice, forgot register?")
	}
	return localMemberNotice
}

func RegisterMemberNotice(i IMemberNotice) {
	localMemberNotice = i
}
