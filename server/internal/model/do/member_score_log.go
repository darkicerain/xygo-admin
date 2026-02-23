// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// MemberScoreLog is the golang structure of table xy_member_score_log for DAO operations like Where/Data.
type MemberScoreLog struct {
	g.Meta    `orm:"table:xy_member_score_log, do:true"`
	Id        any //
	MemberId  any // 会员ID
	Score     any // 变动积分（正数=增加，负数=减少）
	Before    any // 变动前积分
	After     any // 变动后积分
	Memo      any // 变动说明
	CreatedAt any // 创建时间
}
