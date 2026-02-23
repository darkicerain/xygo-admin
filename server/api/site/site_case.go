package site

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 前台案例接口 =====================

// CaseCategoryTreeReq 前台案例分类树
type CaseCategoryTreeReq struct {
	g.Meta `path:"/site/case/categoryTree" method:"get" tags:"SiteCase" summary:"案例分类树"`
}
type CaseCategoryTreeRes struct {
	*adminin.CaseCategoryListModel
}

// CaseListReq 前台案例列表
type CaseListReq struct {
	g.Meta     `path:"/site/case/list" method:"get" tags:"SiteCase" summary:"案例列表"`
	CategoryId uint64 `p:"categoryId" json:"categoryId" dc:"分类ID"`
	Page       int    `p:"page"  d:"1"  json:"page"`
	PageSize   int    `p:"pageSize" d:"12" json:"pageSize"`
}
type CaseListRes struct {
	*adminin.CaseListModel
}

// CaseDetailReq 前台案例详情
type CaseDetailReq struct {
	g.Meta `path:"/site/case/detail" method:"get" tags:"SiteCase" summary:"案例详情"`
	Id     uint64 `p:"id" v:"required#案例ID不能为空" json:"id" dc:"案例ID"`
}
type CaseDetailRes struct {
	*adminin.CaseDetailModel
}
