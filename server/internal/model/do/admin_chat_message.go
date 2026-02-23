// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminChatMessage is the golang structure of table xy_admin_chat_message for DAO operations like Where/Data.
type AdminChatMessage struct {
	g.Meta    `orm:"table:xy_admin_chat_message, do:true"`
	Id        any // 消息ID
	SessionId any // 会话ID
	SenderId  any // 发送者ID
	Type      any // 消息类型:1=文字,2=图片,3=系统消息
	Content   any // 消息内容(图片时存URL)
	CreatedAt any // 发送时间
}
