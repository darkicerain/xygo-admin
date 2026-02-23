// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminFieldPerm is the golang structure of table xy_admin_field_perm for DAO operations like Where/Data.
type AdminFieldPerm struct {
	g.Meta     `orm:"table:xy_admin_field_perm, do:true"`
	Id         any // 主键
	RoleId     any // 角色ID
	Module     any // 模块名称（如：system、org）
	Resource   any // 资源标识（表名或页面标识，如：admin_user、user_list）
	FieldName  any // 字段名称（如：mobile、salary）
	FieldLabel any // 字段显示名称（用于界面展示）
	PermType   any // 权限类型：0=不可见，1=只读，2=可编辑
	Status     any // 状态：0=禁用，1=启用
	Remark     any // 备注
	CreateTime any // 创建时间
	UpdateTime any // 更新时间
}
