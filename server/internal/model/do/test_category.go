// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// TestCategory is the golang structure of table xy_test_category for DAO operations like Where/Data.
type TestCategory struct {
	g.Meta    `orm:"table:xy_test_category, do:true"`
	Id        any //
	ParentId  any // 鐖剁骇ID
	Name      any // 分类名称
	Icon      any // 图标
	Image     any // 分类图片
	Sort      any // 排序
	Status    any // 状态:0=禁用,1=启用
	Remark    any // 备注
	CreatedAt any // 创建时间
	UpdatedAt any // 更新时间
}
