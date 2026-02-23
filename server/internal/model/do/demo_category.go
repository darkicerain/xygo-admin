// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// DemoCategory is the golang structure of table xy_demo_category for DAO operations like Where/Data.
type DemoCategory struct {
	g.Meta    `orm:"table:xy_demo_category, do:true"`
	Id        any // 主键
	ParentId  any // 父级ID
	Name      any // 分类名称
	Icon      any // 图标
	Sort      any // 排序
	Status    any // 状态:1=启用,0=禁用
	Remark    any // 备注
	CreatedAt any // 创建时间
	UpdatedAt any // 更新时间
}
