package dao

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

var AdminNotice = &adminNoticeDao{
	table: "xy_admin_notice",
}

type adminNoticeDao struct {
	table string
}

func (d *adminNoticeDao) Table() string { return d.table }

func (d *adminNoticeDao) Ctx(ctx context.Context) *gdb.Model {
	return g.DB().Model(d.table).Safe().Ctx(ctx)
}

// Columns 字段名常量
func (d *adminNoticeDao) Columns() *adminNoticeColumns { return &adminNoticeCols }

type adminNoticeColumns struct {
	Id, Title, Type, Content, Tag, SenderId, ReceiverId string
	Status, Sort, Remark, ReadCount, CreatedAt, UpdatedAt string
}

var adminNoticeCols = adminNoticeColumns{
	Id: "id", Title: "title", Type: "type", Content: "content",
	Tag: "tag", SenderId: "sender_id", ReceiverId: "receiver_id",
	Status: "status", Sort: "sort", Remark: "remark",
	ReadCount: "read_count", CreatedAt: "created_at", UpdatedAt: "updated_at",
}
