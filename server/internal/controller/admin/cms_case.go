package admin

import (
	"context"

	api "xygo/api/admin"
	"xygo/internal/library/contexts"
	"xygo/internal/service"
)

// ===================== 案例分类管理 =====================

// CaseCategoryList 案例分类列表
func (c *ControllerV1) CaseCategoryList(ctx context.Context, req *api.CaseCategoryListReq) (res *api.CaseCategoryListRes, err error) {
	result, err := service.CmsCase().CategoryList(ctx, &req.CaseCategoryListInp)
	if err != nil {
		return nil, err
	}
	return &api.CaseCategoryListRes{CaseCategoryListModel: result}, nil
}

// CaseCategorySave 新增/编辑案例分类
func (c *ControllerV1) CaseCategorySave(ctx context.Context, req *api.CaseCategorySaveReq) (res *api.CaseCategorySaveRes, err error) {
	id, err := service.CmsCase().CategorySave(ctx, &req.CaseCategorySaveInp)
	if err != nil {
		return nil, err
	}
	return &api.CaseCategorySaveRes{Id: id}, nil
}

// CaseCategoryDelete 删除案例分类
func (c *ControllerV1) CaseCategoryDelete(ctx context.Context, req *api.CaseCategoryDeleteReq) (res *api.CaseCategoryDeleteRes, err error) {
	err = service.CmsCase().CategoryDelete(ctx, req.Id)
	return &api.CaseCategoryDeleteRes{}, err
}

// ===================== 案例内容管理 =====================

// CaseList 案例列表
func (c *ControllerV1) CaseList(ctx context.Context, req *api.CaseListReq) (res *api.CaseListRes, err error) {
	result, err := service.CmsCase().List(ctx, &req.CaseListInp)
	if err != nil {
		return nil, err
	}
	return &api.CaseListRes{CaseListModel: result}, nil
}

// CaseDetail 案例详情
func (c *ControllerV1) CaseDetail(ctx context.Context, req *api.CaseDetailReq) (res *api.CaseDetailRes, err error) {
	result, err := service.CmsCase().Detail(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &api.CaseDetailRes{CaseDetailModel: result}, nil
}

// CaseSave 新增/编辑案例
func (c *ControllerV1) CaseSave(ctx context.Context, req *api.CaseSaveReq) (res *api.CaseSaveRes, err error) {
	operatorId := contexts.GetUserId(ctx)
	id, err := service.CmsCase().Save(ctx, &req.CaseSaveInp, operatorId)
	if err != nil {
		return nil, err
	}
	return &api.CaseSaveRes{Id: id}, nil
}

// CaseDelete 删除案例
func (c *ControllerV1) CaseDelete(ctx context.Context, req *api.CaseDeleteReq) (res *api.CaseDeleteRes, err error) {
	err = service.CmsCase().Delete(ctx, req.Id)
	return &api.CaseDeleteRes{}, err
}
