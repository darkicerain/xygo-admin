// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminChatMessage is the golang structure for table admin_chat_message.
type AdminChatMessage struct {
	Id        uint64 `json:"id"        orm:"id"         description:"消息ID"`                  // 消息ID
	SessionId uint64 `json:"sessionId" orm:"session_id" description:"会话ID"`                  // 会话ID
	SenderId  uint64 `json:"senderId"  orm:"sender_id"  description:"发送者ID"`                 // 发送者ID
	Type      int    `json:"type"      orm:"type"       description:"消息类型:1=文字,2=图片,3=系统消息"` // 消息类型:1=文字,2=图片,3=系统消息
	Content   string `json:"content"   orm:"content"    description:"消息内容(图片时存URL)"`         // 消息内容(图片时存URL)
	CreatedAt int    `json:"createdAt" orm:"created_at" description:"发送时间"`                  // 发送时间
}
