// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// CommunityLike is the golang structure of table xy_community_like for DAO operations like Where/Data.
type CommunityLike struct {
	g.Meta     `orm:"table:xy_community_like, do:true"`
	Id         any // 记录ID
	MemberId   any // 会员ID
	TargetType any // 目标类型:1=帖子,2=回复
	TargetId   any // 目标ID
	CreatedAt  any // 创建时间
}
