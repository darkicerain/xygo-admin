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
	IAdminPost interface {
		// List 获取岗位列表
		List(ctx context.Context, in *adminin.PostListInp) (list []adminin.PostListItem, total int, err error)
		// Detail 获取岗位详情
		Detail(ctx context.Context, id uint64) (*adminin.PostListItem, error)
		// Save 保存岗位（新增/编辑）
		Save(ctx context.Context, in *adminin.PostSaveInp) (uint, error)
		// Delete 删除岗位
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localAdminPost IAdminPost
)

func AdminPost() IAdminPost {
	if localAdminPost == nil {
		panic("implement not found for interface IAdminPost, forgot register?")
	}
	return localAdminPost
}

func RegisterAdminPost(i IAdminPost) {
	localAdminPost = i
}
