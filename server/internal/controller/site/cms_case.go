package site

import (
	"context"

	api "xygo/api/site"
	"xygo/internal/model/input/adminin"
	"xygo/internal/model/input/form"
	"xygo/internal/service"
)

// CaseCategoryTree 前台案例分类树
func (c *ControllerV1) CaseCategoryTree(ctx context.Context, req *api.CaseCategoryTreeReq) (res *api.CaseCategoryTreeRes, err error) {
	result, err := service.CmsCase().CategoryList(ctx, &adminin.CaseCategoryListInp{Status: 1})
	if err != nil {
		return nil, err
	}
	return &api.CaseCategoryTreeRes{CaseCategoryListModel: result}, nil
}

// CaseList 前台案例列表
func (c *ControllerV1) CaseList(ctx context.Context, req *api.CaseListReq) (res *api.CaseListRes, err error) {
	result, err := service.CmsCase().List(ctx, &adminin.CaseListInp{
		PageReq:    form.PageReq{Page: req.Page, PageSize: req.PageSize},
		CategoryId: req.CategoryId,
		Status:     1, // 前台只看已发布
	})
	if err != nil {
		return nil, err
	}
	return &api.CaseListRes{CaseListModel: result}, nil
}

// CaseDetail 前台案例详情
func (c *ControllerV1) CaseDetail(ctx context.Context, req *api.CaseDetailReq) (res *api.CaseDetailRes, err error) {
	result, err := service.CmsCase().SiteDetail(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &api.CaseDetailRes{CaseDetailModel: result}, nil
}
