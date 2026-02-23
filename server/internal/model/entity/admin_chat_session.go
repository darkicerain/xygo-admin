// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminChatSession is the golang structure for table admin_chat_session.
type AdminChatSession struct {
	Id              uint64 `json:"id"              orm:"id"                description:"会话ID"`         // 会话ID
	Type            int    `json:"type"            orm:"type"              description:"类型:1=单聊,2=群聊"` // 类型:1=单聊,2=群聊
	Name            string `json:"name"            orm:"name"              description:"群名称(单聊为空)"`    // 群名称(单聊为空)
	Avatar          string `json:"avatar"          orm:"avatar"            description:"群头像"`          // 群头像
	CreatorId       uint64 `json:"creatorId"       orm:"creator_id"        description:"创建者ID"`        // 创建者ID
	LastMessage     string `json:"lastMessage"     orm:"last_message"      description:"最后消息预览"`       // 最后消息预览
	LastMessageTime int    `json:"lastMessageTime" orm:"last_message_time" description:"最后消息时间戳"`      // 最后消息时间戳
	MemberCount     int    `json:"memberCount"     orm:"member_count"      description:"成员数"`          // 成员数
	CreatedAt       int    `json:"createdAt"       orm:"created_at"        description:"创建时间"`         // 创建时间
	UpdatedAt       int    `json:"updatedAt"       orm:"updated_at"        description:"更新时间"`         // 更新时间
}
