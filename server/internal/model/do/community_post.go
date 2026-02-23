// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// CommunityPost is the golang structure of table xy_community_post for DAO operations like Where/Data.
type CommunityPost struct {
	g.Meta            `orm:"table:xy_community_post, do:true"`
	Id                any // 帖子ID
	MemberId          any // 发帖会员ID
	CategoryId        any // 分类ID
	Title             any // 标题
	Content           any // 内容(Markdown)
	Tags              any // 标签(JSON数组)
	Views             any // 浏览量
	ReplyCount        any // 回复数
	LikeCount         any // 点赞数
	IsTop             any // 是否置顶:0=否,1=是
	IsEssence         any // 是否精华:0=否,1=是
	Status            any // 状态:1=正常,2=待审核,3=隐藏
	LastReplyAt       any // 最后回复时间
	LastReplyMemberId any // 最后回复人ID
	CreatedAt         any // 创建时间
	UpdatedAt         any // 更新时间
	DeletedAt         any // 删除时间(软删除)
	RewardScore       any //
}
