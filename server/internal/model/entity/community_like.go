// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// CommunityLike is the golang structure for table community_like.
type CommunityLike struct {
	Id         uint64 `json:"id"         orm:"id"          description:"记录ID"`           // 记录ID
	MemberId   uint64 `json:"memberId"   orm:"member_id"   description:"会员ID"`           // 会员ID
	TargetType int    `json:"targetType" orm:"target_type" description:"目标类型:1=帖子,2=回复"` // 目标类型:1=帖子,2=回复
	TargetId   uint64 `json:"targetId"   orm:"target_id"   description:"目标ID"`           // 目标ID
	CreatedAt  uint64 `json:"createdAt"  orm:"created_at"  description:"创建时间"`           // 创建时间
}
