// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminChatSessionMember is the golang structure of table xy_admin_chat_session_member for DAO operations like Where/Data.
type AdminChatSessionMember struct {
	g.Meta        `orm:"table:xy_admin_chat_session_member, do:true"`
	Id            any // 主键
	SessionId     any // 会话ID
	UserId        any // 用户ID
	Role          any // 角色:1=成员,2=管理员,3=群主
	UnreadCount   any // 未读消息数
	LastReadMsgId any // 最后已读消息ID
	IsMuted       any // 是否免打扰:0=否,1=是
	IsDeleted     any // 是否删除会话:0=否,1=是
	JoinedAt      any // 加入时间
}
