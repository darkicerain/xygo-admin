package dao

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

var AdminNoticeRead = &adminNoticeReadDao{
	table: "xy_admin_notice_read",
}

type adminNoticeReadDao struct {
	table string
}

func (d *adminNoticeReadDao) Table() string { return d.table }

func (d *adminNoticeReadDao) Ctx(ctx context.Context) *gdb.Model {
	return g.DB().Model(d.table).Safe().Ctx(ctx)
}
