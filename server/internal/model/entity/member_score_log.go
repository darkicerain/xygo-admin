// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// MemberScoreLog is the golang structure for table member_score_log.
type MemberScoreLog struct {
	Id        uint64 `json:"id"        orm:"id"         description:""`                  //
	MemberId  uint64 `json:"memberId"  orm:"member_id"  description:"会员ID"`              // 会员ID
	Score     int    `json:"score"     orm:"score"      description:"变动积分（正数=增加，负数=减少）"` // 变动积分（正数=增加，负数=减少）
	Before    int    `json:"before"    orm:"before"     description:"变动前积分"`             // 变动前积分
	After     int    `json:"after"     orm:"after"      description:"变动后积分"`             // 变动后积分
	Memo      string `json:"memo"      orm:"memo"       description:"变动说明"`              // 变动说明
	CreatedAt uint64 `json:"createdAt" orm:"created_at" description:"创建时间"`              // 创建时间
}
