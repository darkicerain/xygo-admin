// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminOperationLog is the golang structure of table xy_admin_operation_log for DAO operations like Where/Data.
type AdminOperationLog struct {
	g.Meta       `orm:"table:xy_admin_operation_log, do:true"`
	Id           any // 日志ID
	UserId       any // 操作人ID
	Username     any // 操作人账号
	Module       any // 模块名称（如：用户管理、角色管理）
	Title        any // 操作标题/接口描述
	Method       any // HTTP方法（GET/POST/PUT/DELETE）
	Url          any // 请求URL
	Ip           any // 操作IP
	Location     any // 操作地点
	UserAgent    any // User-Agent
	RequestBody  any // 请求参数（JSON）
	ResponseBody any // 响应结果（JSON，可选截断存储）
	ErrorMessage any // 错误信息
	Status       any // 状态：0=失败 1=成功
	Elapsed      any // 耗时（毫秒）
	CreatedAt    any // 创建时间
}
