// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminChatSessionMember is the golang structure for table admin_chat_session_member.
type AdminChatSessionMember struct {
	Id            uint64 `json:"id"            orm:"id"               description:"主键"`                 // 主键
	SessionId     uint64 `json:"sessionId"     orm:"session_id"       description:"会话ID"`               // 会话ID
	UserId        uint64 `json:"userId"        orm:"user_id"          description:"用户ID"`               // 用户ID
	Role          int    `json:"role"          orm:"role"             description:"角色:1=成员,2=管理员,3=群主"` // 角色:1=成员,2=管理员,3=群主
	UnreadCount   int    `json:"unreadCount"   orm:"unread_count"     description:"未读消息数"`              // 未读消息数
	LastReadMsgId uint64 `json:"lastReadMsgId" orm:"last_read_msg_id" description:"最后已读消息ID"`           // 最后已读消息ID
	IsMuted       int    `json:"isMuted"       orm:"is_muted"         description:"是否免打扰:0=否,1=是"`      // 是否免打扰:0=否,1=是
	IsDeleted     int    `json:"isDeleted"     orm:"is_deleted"       description:"是否删除会话:0=否,1=是"`     // 是否删除会话:0=否,1=是
	JoinedAt      int    `json:"joinedAt"      orm:"joined_at"        description:"加入时间"`               // 加入时间
}
