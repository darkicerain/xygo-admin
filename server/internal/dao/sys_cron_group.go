package dao

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

var SysCronGroup = &sysCronGroupDao{
	table: "xy_sys_cron_group",
}

type sysCronGroupDao struct {
	table string
}

func (d *sysCronGroupDao) Table() string { return d.table }

func (d *sysCronGroupDao) Ctx(ctx context.Context) *gdb.Model {
	return g.DB().Model(d.table).Safe().Ctx(ctx)
}

func (d *sysCronGroupDao) Columns() *sysCronGroupColumns { return &sysCronGroupCols }

type sysCronGroupColumns struct {
	Id, Name, Sort, Remark, Status string
	CreatedAt, UpdatedAt           string
}

var sysCronGroupCols = sysCronGroupColumns{
	Id: "id", Name: "name", Sort: "sort", Remark: "remark", Status: "status",
	CreatedAt: "created_at", UpdatedAt: "updated_at",
}
