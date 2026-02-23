// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminLoginLog is the golang structure of table xy_admin_login_log for DAO operations like Where/Data.
type AdminLoginLog struct {
	g.Meta    `orm:"table:xy_admin_login_log, do:true"`
	Id        any // 日志ID
	UserId    any // 管理员ID（0=未知用户）
	Username  any // 登录账号
	Ip        any // 登录IP
	Location  any // 登录地点
	UserAgent any // User-Agent
	Browser   any // 浏览器
	Os        any // 操作系统
	Status    any // 状态：0=失败 1=成功
	Message   any // 提示消息
	CreatedAt any // 创建时间
}
