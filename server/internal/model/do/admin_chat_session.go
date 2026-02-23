// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminChatSession is the golang structure of table xy_admin_chat_session for DAO operations like Where/Data.
type AdminChatSession struct {
	g.Meta          `orm:"table:xy_admin_chat_session, do:true"`
	Id              any // 会话ID
	Type            any // 类型:1=单聊,2=群聊
	Name            any // 群名称(单聊为空)
	Avatar          any // 群头像
	CreatorId       any // 创建者ID
	LastMessage     any // 最后消息预览
	LastMessageTime any // 最后消息时间戳
	MemberCount     any // 成员数
	CreatedAt       any // 创建时间
	UpdatedAt       any // 更新时间
}
