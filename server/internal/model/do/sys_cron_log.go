// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// SysCronLog is the golang structure of table xy_sys_cron_log for DAO operations like Where/Data.
type SysCronLog struct {
	g.Meta    `orm:"table:xy_sys_cron_log, do:true"`
	Id        any // 日志ID
	CronId    any // 任务ID
	Name      any // 任务标识
	Title     any // 任务标题
	Params    any // 执行参数
	Status    any // 状态:1成功,2失败
	Output    any // 执行输出
	ErrMsg    any // 错误信息
	TakeMs    any // 耗时(毫秒)
	CreatedAt any // 执行时间
}
