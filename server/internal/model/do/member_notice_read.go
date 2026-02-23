// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// MemberNoticeRead is the golang structure of table xy_member_notice_read for DAO operations like Where/Data.
type MemberNoticeRead struct {
	g.Meta   `orm:"table:xy_member_notice_read, do:true"`
	Id       any //
	NoticeId any // 通知ID
	MemberId any // 会员ID
	ReadAt   any // 阅读时间
}
