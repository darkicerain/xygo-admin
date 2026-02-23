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
	IAdminDept interface {
		// List 获取部门列表（树形结构）
		List(ctx context.Context, in *adminin.DeptListInp) ([]*adminin.DeptListItem, error)
		// Detail 获取部门详情
		Detail(ctx context.Context, id uint64) (*adminin.DeptListItem, error)
		// Save 保存部门（新增/编辑）
		Save(ctx context.Context, in *adminin.DeptSaveInp) (uint, error)
		// Delete 删除部门
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localAdminDept IAdminDept
)

func AdminDept() IAdminDept {
	if localAdminDept == nil {
		panic("implement not found for interface IAdminDept, forgot register?")
	}
	return localAdminDept
}

func RegisterAdminDept(i IAdminDept) {
	localAdminDept = i
}
