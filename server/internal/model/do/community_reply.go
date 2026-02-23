// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// CommunityReply is the golang structure of table xy_community_reply for DAO operations like Where/Data.
type CommunityReply struct {
	g.Meta     `orm:"table:xy_community_reply, do:true"`
	Id         any // 回复ID
	PostId     any // 帖子ID
	MemberId   any // 回复会员ID
	ParentId   any // 父回复ID(0=直接回复帖子)
	Content    any // 回复内容(Markdown)
	LikeCount  any // 点赞数
	IsAccepted any // 是否被采纳:0=否,1=是
	Status     any // 状态:1=正常,2=待审核,3=隐藏
	CreatedAt  any // 创建时间
	UpdatedAt  any // 更新时间
	DeletedAt  any // 删除时间(软删除)
}
