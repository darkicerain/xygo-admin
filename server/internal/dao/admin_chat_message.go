package dao

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

var AdminChatMessage = &adminChatMessageDao{
	table: "xy_admin_chat_message",
}

type adminChatMessageDao struct {
	table string
}

func (d *adminChatMessageDao) Table() string { return d.table }

func (d *adminChatMessageDao) Ctx(ctx context.Context) *gdb.Model {
	return g.DB().Model(d.table).Safe().Ctx(ctx)
}

// Columns 字段名常量
func (d *adminChatMessageDao) Columns() *adminChatMessageColumns { return &adminChatMessageCols }

type adminChatMessageColumns struct {
	Id, SessionId, SenderId, Type, Content, CreatedAt string
}

var adminChatMessageCols = adminChatMessageColumns{
	Id: "id", SessionId: "session_id", SenderId: "sender_id",
	Type: "type", Content: "content", CreatedAt: "created_at",
}
