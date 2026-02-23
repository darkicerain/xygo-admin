// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// MemberNoticeRead is the golang structure for table member_notice_read.
type MemberNoticeRead struct {
	Id       uint64 `json:"id"       orm:"id"        description:""`     //
	NoticeId uint64 `json:"noticeId" orm:"notice_id" description:"通知ID"` // 通知ID
	MemberId uint64 `json:"memberId" orm:"member_id" description:"会员ID"` // 会员ID
	ReadAt   uint64 `json:"readAt"   orm:"read_at"   description:"阅读时间"` // 阅读时间
}
