// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// MemberCheckin is the golang structure of table xy_member_checkin for DAO operations like Where/Data.
type MemberCheckin struct {
	g.Meta         `orm:"table:xy_member_checkin, do:true"`
	Id             any //
	MemberId       any // 会员ID
	CheckinDate    any // 签到日期
	Score          any // 本次获得积分
	ContinuousDays any // 连续签到天数
	CreatedAt      any // 签到时间
}
