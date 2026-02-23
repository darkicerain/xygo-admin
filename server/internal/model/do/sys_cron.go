// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// SysCron is the golang structure of table xy_sys_cron for DAO operations like Where/Data.
type SysCron struct {
	g.Meta    `orm:"table:xy_sys_cron, do:true"`
	Id        any // 任务ID
	GroupId   any // 分组ID
	Title     any // 任务标题
	Name      any // 任务标识（唯一，对应代码注册名）
	Params    any // 任务参数（逗号分隔）
	Pattern   any // Cron表达式
	Policy    any // 策略:1并行,2单例,3单次,4固定次数
	Count     any // 固定次数（policy=4时有效）
	Sort      any // 排序
	Remark    any // 备注
	Status    any // 状态:0禁用,1启用
	CreatedAt any // 创建时间
	UpdatedAt any // 更新时间
}
