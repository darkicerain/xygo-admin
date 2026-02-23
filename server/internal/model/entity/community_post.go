// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// CommunityPost is the golang structure for table community_post.
type CommunityPost struct {
	Id                uint64 `json:"id"                orm:"id"                   description:"帖子ID"`               // 帖子ID
	MemberId          uint64 `json:"memberId"          orm:"member_id"            description:"发帖会员ID"`             // 发帖会员ID
	CategoryId        uint64 `json:"categoryId"        orm:"category_id"          description:"分类ID"`               // 分类ID
	Title             string `json:"title"             orm:"title"                description:"标题"`                 // 标题
	Content           string `json:"content"           orm:"content"              description:"内容(Markdown)"`       // 内容(Markdown)
	Tags              string `json:"tags"              orm:"tags"                 description:"标签(JSON数组)"`         // 标签(JSON数组)
	Views             int    `json:"views"             orm:"views"                description:"浏览量"`                // 浏览量
	ReplyCount        int    `json:"replyCount"        orm:"reply_count"          description:"回复数"`                // 回复数
	LikeCount         int    `json:"likeCount"         orm:"like_count"           description:"点赞数"`                // 点赞数
	IsTop             int    `json:"isTop"             orm:"is_top"               description:"是否置顶:0=否,1=是"`       // 是否置顶:0=否,1=是
	IsEssence         int    `json:"isEssence"         orm:"is_essence"           description:"是否精华:0=否,1=是"`       // 是否精华:0=否,1=是
	Status            int    `json:"status"            orm:"status"               description:"状态:1=正常,2=待审核,3=隐藏"` // 状态:1=正常,2=待审核,3=隐藏
	LastReplyAt       uint64 `json:"lastReplyAt"       orm:"last_reply_at"        description:"最后回复时间"`             // 最后回复时间
	LastReplyMemberId uint64 `json:"lastReplyMemberId" orm:"last_reply_member_id" description:"最后回复人ID"`            // 最后回复人ID
	CreatedAt         uint64 `json:"createdAt"         orm:"created_at"           description:"创建时间"`               // 创建时间
	UpdatedAt         uint64 `json:"updatedAt"         orm:"updated_at"           description:"更新时间"`               // 更新时间
	DeletedAt         uint64 `json:"deletedAt"         orm:"deleted_at"           description:"删除时间(软删除)"`          // 删除时间(软删除)
	RewardScore       int    `json:"rewardScore"       orm:"reward_score"         description:""`                   //
}
