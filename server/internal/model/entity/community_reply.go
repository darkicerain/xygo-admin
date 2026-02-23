// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// CommunityReply is the golang structure for table community_reply.
type CommunityReply struct {
	Id         uint64 `json:"id"         orm:"id"          description:"回复ID"`               // 回复ID
	PostId     uint64 `json:"postId"     orm:"post_id"     description:"帖子ID"`               // 帖子ID
	MemberId   uint64 `json:"memberId"   orm:"member_id"   description:"回复会员ID"`             // 回复会员ID
	ParentId   uint64 `json:"parentId"   orm:"parent_id"   description:"父回复ID(0=直接回复帖子)"`    // 父回复ID(0=直接回复帖子)
	Content    string `json:"content"    orm:"content"     description:"回复内容(Markdown)"`     // 回复内容(Markdown)
	LikeCount  int    `json:"likeCount"  orm:"like_count"  description:"点赞数"`                // 点赞数
	IsAccepted int    `json:"isAccepted" orm:"is_accepted" description:"是否被采纳:0=否,1=是"`      // 是否被采纳:0=否,1=是
	Status     int    `json:"status"     orm:"status"      description:"状态:1=正常,2=待审核,3=隐藏"` // 状态:1=正常,2=待审核,3=隐藏
	CreatedAt  uint64 `json:"createdAt"  orm:"created_at"  description:"创建时间"`               // 创建时间
	UpdatedAt  uint64 `json:"updatedAt"  orm:"updated_at"  description:"更新时间"`               // 更新时间
	DeletedAt  uint64 `json:"deletedAt"  orm:"deleted_at"  description:"删除时间(软删除)"`          // 删除时间(软删除)
}
