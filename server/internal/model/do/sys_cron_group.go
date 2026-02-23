// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// SysCronGroup is the golang structure of table xy_sys_cron_group for DAO operations like Where/Data.
type SysCronGroup struct {
	g.Meta    `orm:"table:xy_sys_cron_group, do:true"`
	Id        any // 分组ID
	Name      any // 分组名称
	Sort      any // 排序（越小越靠前）
	Remark    any // 备注
	Status    any // 状态:0禁用,1启用
	CreatedAt any // 创建时间
	UpdatedAt any // 更新时间
}
