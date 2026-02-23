// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminNoticeRead is the golang structure for table admin_notice_read.
type AdminNoticeRead struct {
	Id       uint64 `json:"id"       orm:"id"        description:"主键"`   // 主键
	NoticeId uint64 `json:"noticeId" orm:"notice_id" description:"通知ID"` // 通知ID
	UserId   uint64 `json:"userId"   orm:"user_id"   description:"用户ID"` // 用户ID
	ReadAt   uint64 `json:"readAt"   orm:"read_at"   description:"阅读时间"` // 阅读时间
}
