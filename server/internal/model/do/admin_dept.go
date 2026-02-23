// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminDept is the golang structure of table xy_admin_dept for DAO operations like Where/Data.
type AdminDept struct {
	g.Meta     `orm:"table:xy_admin_dept, do:true"`
	Id         any // 部门ID
	ParentId   any // 上级部门ID
	Name       any // 部门名称
	Sort       any // 排序
	Status     any // 状态:0禁用,1启用
	Remark     any // 备注
	CreateBy   any // 创建人
	CreateTime any // 创建时间
	UpdateTime any // 更新时间
}
