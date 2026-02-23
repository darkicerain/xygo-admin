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
	IAdminMember interface {
		// List 会员列表
		List(ctx context.Context, in *adminin.MemberListInp) (list []adminin.MemberItem, total int, err error)
		// Detail 会员详情
		Detail(ctx context.Context, in *adminin.MemberDetailInp) (out *adminin.MemberDetailModel, err error)
		// Add 添加会员
		Add(ctx context.Context, in *adminin.MemberAddInp) (out *adminin.MemberAddModel, err error)
		// Edit 编辑会员
		Edit(ctx context.Context, in *adminin.MemberEditInp) (err error)
		// Delete 删除会员（软删除）
		Delete(ctx context.Context, in *adminin.MemberDeleteInp) (err error)
		// Status 修改会员状态
		Status(ctx context.Context, in *adminin.MemberStatusInp) (err error)
		// ResetPassword 重置会员密码
		ResetPassword(ctx context.Context, in *adminin.MemberResetPasswordInp) (err error)
		// GroupOptions 会员分组选项
		GroupOptions(ctx context.Context) (out *adminin.MemberGroupOptionsModel, err error)
	}
)

var (
	localAdminMember IAdminMember
)

func AdminMember() IAdminMember {
	if localAdminMember == nil {
		panic("implement not found for interface IAdminMember, forgot register?")
	}
	return localAdminMember
}

func RegisterAdminMember(i IAdminMember) {
	localAdminMember = i
}
