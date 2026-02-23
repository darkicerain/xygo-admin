// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminRole is the golang structure of table xy_admin_role for DAO operations like Where/Data.
type AdminRole struct {
	g.Meta      `orm:"table:xy_admin_role, do:true"`
	Id          any // 角色ID
	Name        any // 角色名称
	Key         any // 角色标识(英文唯一)
	DataScope   any // 数据范围:0=全部,1=本部门,2=本部门及子,3=仅本人,4=自定义部门
	CustomDepts any // 自定义数据范围部门ID列表(JSON数组)
	Pid         any // 上级角色ID
	Level       any // 关系树等级（根为1）
	Tree        any // 关系树路径，如 0,1,3
	Sort        any // 排序（越小越靠前）
	Status      any // 状态:0=禁用,1=启用
	Remark      any // 备注
	CreatedBy   any // 创建人ID
	UpdatedBy   any // 更新人ID
	CreateTime  any // 创建时间
	UpdateTime  any // 更新时间
}
