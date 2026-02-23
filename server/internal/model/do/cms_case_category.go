// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// CmsCaseCategory is the golang structure of table xy_cms_case_category for DAO operations like Where/Data.
type CmsCaseCategory struct {
	g.Meta    `orm:"table:xy_cms_case_category, do:true"`
	Id        any // 分类ID
	Pid       any // 父分类ID(0=顶级)
	Title     any // 分类名称
	Icon      any // 图标
	Sort      any // 排序(越大越靠前)
	Status    any // 状态:1=正常,2=禁用
	Remark    any // 备注
	CreatedAt any // 创建时间
	UpdatedAt any // 更新时间
}
