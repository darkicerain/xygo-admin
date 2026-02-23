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
	ICmsDoc interface {
		// CategoryList 文档分类列表（树形）
		CategoryList(ctx context.Context, in *adminin.DocCategoryListInp) (*adminin.DocCategoryListModel, error)
		// CategorySave 新增/编辑文档分类
		CategorySave(ctx context.Context, in *adminin.DocCategorySaveInp) (uint64, error)
		// CategoryDelete 删除文档分类
		CategoryDelete(ctx context.Context, id uint64) error
		// List 文档列表（分页）
		List(ctx context.Context, in *adminin.DocListInp) (*adminin.DocListModel, error)
		// Detail 文档详情（按ID）
		Detail(ctx context.Context, id uint64) (*adminin.DocDetailModel, error)
		// DetailBySlug 文档详情（按slug，前台用）
		DetailBySlug(ctx context.Context, slug string) (*adminin.DocDetailModel, error)
		// Search 全文搜索文档（标题 + 内容，前台用）
		Search(ctx context.Context, keyword string) ([]adminin.DocSearchItem, error)
		// Save 新增/编辑文档
		Save(ctx context.Context, in *adminin.DocSaveInp, operatorId uint64) (uint64, error)
		// Delete 删除文档（软删除）
		Delete(ctx context.Context, id uint64) error
	}
)

var (
	localCmsDoc ICmsDoc
)

func CmsDoc() ICmsDoc {
	if localCmsDoc == nil {
		panic("implement not found for interface ICmsDoc, forgot register?")
	}
	return localCmsDoc
}

func RegisterCmsDoc(i ICmsDoc) {
	localCmsDoc = i
}
