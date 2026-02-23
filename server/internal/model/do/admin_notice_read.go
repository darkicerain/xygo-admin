// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminNoticeRead is the golang structure of table xy_admin_notice_read for DAO operations like Where/Data.
type AdminNoticeRead struct {
	g.Meta   `orm:"table:xy_admin_notice_read, do:true"`
	Id       any // 主键
	NoticeId any // 通知ID
	UserId   any // 用户ID
	ReadAt   any // 阅读时间
}
