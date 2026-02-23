// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// MemberGroup is the golang structure of table xy_member_group for DAO operations like Where/Data.
type MemberGroup struct {
	g.Meta    `orm:"table:xy_member_group, do:true"`
	Id        any // 分组ID
	Name      any // 分组名称
	Rules     any // 权限规则（菜单ID列表，逗号分隔）
	Status    any // 状态：0=禁用 1=正常
	Sort      any // 排序
	Remark    any // 备注
	CreatedAt any // 创建时间
	UpdatedAt any // 更新时间
}
