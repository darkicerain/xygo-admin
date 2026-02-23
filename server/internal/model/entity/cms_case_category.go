// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// CmsCaseCategory is the golang structure for table cms_case_category.
type CmsCaseCategory struct {
	Id        uint64 `json:"id"        orm:"id"         description:"分类ID"`         // 分类ID
	Pid       uint64 `json:"pid"       orm:"pid"        description:"父分类ID(0=顶级)"`  // 父分类ID(0=顶级)
	Title     string `json:"title"     orm:"title"      description:"分类名称"`         // 分类名称
	Icon      string `json:"icon"      orm:"icon"       description:"图标"`           // 图标
	Sort      int    `json:"sort"      orm:"sort"       description:"排序(越大越靠前)"`    // 排序(越大越靠前)
	Status    int    `json:"status"    orm:"status"     description:"状态:1=正常,2=禁用"` // 状态:1=正常,2=禁用
	Remark    string `json:"remark"    orm:"remark"     description:"备注"`           // 备注
	CreatedAt uint64 `json:"createdAt" orm:"created_at" description:"创建时间"`         // 创建时间
	UpdatedAt uint64 `json:"updatedAt" orm:"updated_at" description:"更新时间"`         // 更新时间
}
