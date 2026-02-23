package adminin

import "xygo/internal/model/input/form"

// ==================== 案例分类（树形） ====================

// CaseCategoryListInp 案例分类列表入参
type CaseCategoryListInp struct {
	Title  string `p:"title"  json:"title"  dc:"按分类名称模糊搜索"`
	Status int    `p:"status" d:"-1" json:"status" dc:"状态过滤:1正常,2禁用,-1全部"`
}

// CaseCategoryListItem 案例分类列表项（树形）
type CaseCategoryListItem struct {
	Id        uint64                  `json:"id"        dc:"分类ID"`
	Pid       uint64                  `json:"pid"       dc:"父分类ID"`
	Title     string                  `json:"title"     dc:"分类名称"`
	Icon      string                  `json:"icon"      dc:"图标"`
	Sort      int                     `json:"sort"      dc:"排序"`
	Status    int                     `json:"status"    dc:"状态"`
	Remark    string                  `json:"remark"    dc:"备注"`
	CreatedAt uint64                  `json:"createdAt" dc:"创建时间"`
	UpdatedAt uint64                  `json:"updatedAt" dc:"更新时间"`
	Children  []*CaseCategoryListItem `json:"children,omitempty" dc:"子分类"`
}

// CaseCategoryListModel 案例分类列表响应
type CaseCategoryListModel struct {
	List []*CaseCategoryListItem `json:"list" dc:"数据列表"`
}

// CaseCategorySaveInp 案例分类新增/编辑入参
type CaseCategorySaveInp struct {
	Id     uint64 `p:"id"     json:"id"     dc:"分类ID（为空表示新增）"`
	Pid    uint64 `p:"pid"    d:"0"         json:"pid"    dc:"父分类ID，0表示顶级"`
	Title  string `p:"title"  v:"required#分类名称不能为空" json:"title"  dc:"分类名称"`
	Icon   string `p:"icon"                 json:"icon"   dc:"图标"`
	Sort   int    `p:"sort"   d:"0"         json:"sort"   dc:"排序"`
	Status int    `p:"status" d:"1"         json:"status" dc:"状态:1正常,2禁用"`
	Remark string `p:"remark"               json:"remark" dc:"备注"`
}

// CaseCategoryDeleteInp 案例分类删除入参
type CaseCategoryDeleteInp struct {
	Id uint64 `p:"id" v:"required#分类ID不能为空" json:"id" dc:"分类ID"`
}

// ==================== 案例内容 ====================

// CaseListInp 案例列表入参
type CaseListInp struct {
	form.PageReq
	CategoryId uint64 `p:"categoryId" json:"categoryId" dc:"分类ID"`
	Title      string `p:"title"      json:"title"      dc:"标题模糊搜索"`
	Status     int    `p:"status" d:"-1" json:"status"  dc:"状态:1已发布,2草稿,3下架,-1全部"`
}

// CaseListItem 案例列表项
type CaseListItem struct {
	Id           uint64 `json:"id"`
	CategoryId   uint64 `json:"categoryId"`
	CategoryName string `json:"categoryName"`
	Title        string `json:"title"`
	Cover        string `json:"cover"`
	Summary      string `json:"summary"`
	Link         string `json:"link"`
	Views        int    `json:"views"`
	Sort         int    `json:"sort"`
	Status       int    `json:"status"`
	IsTop        int    `json:"isTop"`
	Tags         string `json:"tags"`
	CreatedBy    uint64 `json:"createdBy"`
	CreatedAt    uint64 `json:"createdAt"`
	UpdatedAt    uint64 `json:"updatedAt"`
}

// CaseListModel 案例列表响应
type CaseListModel struct {
	List []CaseListItem `json:"list"`
	form.PageRes
}

// CaseDetailInp 案例详情入参
type CaseDetailInp struct {
	Id uint64 `p:"id" v:"required#案例ID不能为空" json:"id" dc:"案例ID"`
}

// CaseDetailModel 案例详情响应
type CaseDetailModel struct {
	Id           uint64 `json:"id"`
	CategoryId   uint64 `json:"categoryId"`
	CategoryName string `json:"categoryName"`
	Title        string `json:"title"`
	Cover        string `json:"cover"`
	Summary      string `json:"summary"`
	Content      string `json:"content"`
	Link         string `json:"link"`
	Views        int    `json:"views"`
	Sort         int    `json:"sort"`
	Status       int    `json:"status"`
	IsTop        int    `json:"isTop"`
	Tags         string `json:"tags"`
	CreatedBy    uint64 `json:"createdBy"`
	UpdatedBy    uint64 `json:"updatedBy"`
	CreatedAt    uint64 `json:"createdAt"`
	UpdatedAt    uint64 `json:"updatedAt"`
}

// CaseSaveInp 案例新增/编辑入参
type CaseSaveInp struct {
	Id         uint64 `p:"id"         json:"id"         dc:"案例ID（为空表示新增）"`
	CategoryId uint64 `p:"categoryId" v:"required#分类不能为空" json:"categoryId" dc:"分类ID"`
	Title      string `p:"title"      v:"required#标题不能为空" json:"title"      dc:"案例标题"`
	Cover      string `p:"cover"      json:"cover"      dc:"封面图"`
	Summary    string `p:"summary"    json:"summary"    dc:"摘要"`
	Content    string `p:"content"    json:"content"    dc:"案例详情(Markdown)"`
	Link       string `p:"link"       json:"link"       dc:"外部链接"`
	Sort       int    `p:"sort"       d:"0"             json:"sort"       dc:"排序"`
	Status     int    `p:"status"     d:"1"             json:"status"     dc:"状态:1已发布,2草稿,3下架"`
	IsTop      int    `p:"isTop"      d:"0"             json:"isTop"      dc:"是否置顶"`
	Tags       string `p:"tags"       json:"tags"       dc:"标签(JSON数组)"`
}

// CaseDeleteInp 案例删除入参
type CaseDeleteInp struct {
	Id uint64 `p:"id" v:"required#案例ID不能为空" json:"id" dc:"案例ID"`
}
