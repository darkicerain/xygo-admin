// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// MemberMoneyLog is the golang structure of table xy_member_money_log for DAO operations like Where/Data.
type MemberMoneyLog struct {
	g.Meta    `orm:"table:xy_member_money_log, do:true"`
	Id        any //
	MemberId  any // 会员ID
	Money     any // 变动金额（分，正数=增加，负数=减少）
	Before    any // 变动前余额（分）
	After     any // 变动后余额（分）
	Memo      any // 变动说明
	CreatedAt any // 创建时间
}
