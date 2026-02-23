package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 案例分类管理 =====================

type CaseCategoryListReq struct {
	g.Meta `path:"/admin/cms/caseCategory/list" method:"post" tags:"CmsCaseCategory" summary:"案例分类列表"`
	adminin.CaseCategoryListInp
}
type CaseCategoryListRes struct {
	*adminin.CaseCategoryListModel
}

type CaseCategorySaveReq struct {
	g.Meta `path:"/admin/cms/caseCategory/save" method:"post" tags:"CmsCaseCategory" summary:"新增/编辑案例分类"`
	adminin.CaseCategorySaveInp
}
type CaseCategorySaveRes struct {
	Id uint64 `json:"id"`
}

type CaseCategoryDeleteReq struct {
	g.Meta `path:"/admin/cms/caseCategory/delete" method:"post" tags:"CmsCaseCategory" summary:"删除案例分类"`
	adminin.CaseCategoryDeleteInp
}
type CaseCategoryDeleteRes struct{}

// ===================== 案例内容管理 =====================

type CaseListReq struct {
	g.Meta `path:"/admin/cms/case/list" method:"post" tags:"CmsCase" summary:"案例列表"`
	adminin.CaseListInp
}
type CaseListRes struct {
	*adminin.CaseListModel
}

type CaseDetailReq struct {
	g.Meta `path:"/admin/cms/case/detail" method:"get" tags:"CmsCase" summary:"案例详情"`
	adminin.CaseDetailInp
}
type CaseDetailRes struct {
	*adminin.CaseDetailModel
}

type CaseSaveReq struct {
	g.Meta `path:"/admin/cms/case/save" method:"post" tags:"CmsCase" summary:"新增/编辑案例"`
	adminin.CaseSaveInp
}
type CaseSaveRes struct {
	Id uint64 `json:"id"`
}

type CaseDeleteReq struct {
	g.Meta `path:"/admin/cms/case/delete" method:"post" tags:"CmsCase" summary:"删除案例"`
	adminin.CaseDeleteInp
}
type CaseDeleteRes struct{}
