// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// MemberMoneyLog is the golang structure for table member_money_log.
type MemberMoneyLog struct {
	Id        uint64 `json:"id"        orm:"id"         description:""`                    //
	MemberId  uint64 `json:"memberId"  orm:"member_id"  description:"会员ID"`                // 会员ID
	Money     int    `json:"money"     orm:"money"      description:"变动金额（分，正数=增加，负数=减少）"` // 变动金额（分，正数=增加，负数=减少）
	Before    int    `json:"before"    orm:"before"     description:"变动前余额（分）"`            // 变动前余额（分）
	After     int    `json:"after"     orm:"after"      description:"变动后余额（分）"`            // 变动后余额（分）
	Memo      string `json:"memo"      orm:"memo"       description:"变动说明"`                // 变动说明
	CreatedAt uint64 `json:"createdAt" orm:"created_at" description:"创建时间"`                // 创建时间
}
