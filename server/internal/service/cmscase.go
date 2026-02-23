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
	ICmsCase interface {
		// CategoryList 案例分类列表（树形）
		CategoryList(ctx context.Context, in *adminin.CaseCategoryListInp) (*adminin.CaseCategoryListModel, error)
		// CategorySave 新增/编辑案例分类
		CategorySave(ctx context.Context, in *adminin.CaseCategorySaveInp) (uint64, error)
		// CategoryDelete 删除案例分类
		CategoryDelete(ctx context.Context, id uint64) error
		// List 案例列表（分页）
		List(ctx context.Context, in *adminin.CaseListInp) (*adminin.CaseListModel, error)
		// Detail 案例详情
		Detail(ctx context.Context, id uint64) (*adminin.CaseDetailModel, error)
		// SiteDetail 前台案例详情（浏览量+1）
		SiteDetail(ctx context.Context, id uint64) (*adminin.CaseDetailModel, error)
		// Save 新增/编辑案例
		Save(ctx context.Context, in *adminin.CaseSaveInp, operatorId uint64) (uint64, error)
		// Delete 删除案例（软删除）
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localCmsCase ICmsCase
)

func CmsCase() ICmsCase {
	if localCmsCase == nil {
		panic("implement not found for interface ICmsCase, forgot register?")
	}
	return localCmsCase
}

func RegisterCmsCase(i ICmsCase) {
	localCmsCase = i
}
