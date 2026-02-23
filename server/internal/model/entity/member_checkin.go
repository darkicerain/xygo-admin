// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// MemberCheckin is the golang structure for table member_checkin.
type MemberCheckin struct {
	Id             uint64 `json:"id"             orm:"id"              description:""`       //
	MemberId       uint64 `json:"memberId"       orm:"member_id"       description:"会员ID"`   // 会员ID
	CheckinDate    uint64 `json:"checkinDate"    orm:"checkin_date"    description:"签到日期"`   // 签到日期
	Score          int    `json:"score"          orm:"score"           description:"本次获得积分"` // 本次获得积分
	ContinuousDays int    `json:"continuousDays" orm:"continuous_days" description:"连续签到天数"` // 连续签到天数
	CreatedAt      uint64 `json:"createdAt"      orm:"created_at"      description:"签到时间"`   // 签到时间
}
