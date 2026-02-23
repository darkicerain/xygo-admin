package dao

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

var AdminChatSession = &adminChatSessionDao{
	table: "xy_admin_chat_session",
}

type adminChatSessionDao struct {
	table string
}

func (d *adminChatSessionDao) Table() string { return d.table }

func (d *adminChatSessionDao) Ctx(ctx context.Context) *gdb.Model {
	return g.DB().Model(d.table).Safe().Ctx(ctx)
}

// Columns 字段名常量
func (d *adminChatSessionDao) Columns() *adminChatSessionColumns { return &adminChatSessionCols }

type adminChatSessionColumns struct {
	Id, Type, Name, Avatar, CreatorId          string
	LastMessage, LastMessageTime, MemberCount  string
	CreatedAt, UpdatedAt                       string
}

var adminChatSessionCols = adminChatSessionColumns{
	Id: "id", Type: "type", Name: "name", Avatar: "avatar",
	CreatorId: "creator_id", LastMessage: "last_message",
	LastMessageTime: "last_message_time", MemberCount: "member_count",
	CreatedAt: "created_at", UpdatedAt: "updated_at",
}
