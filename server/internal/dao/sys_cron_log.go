package dao

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

var SysCronLog = &sysCronLogDao{
	table: "xy_sys_cron_log",
}

type sysCronLogDao struct {
	table string
}

func (d *sysCronLogDao) Table() string { return d.table }

func (d *sysCronLogDao) Ctx(ctx context.Context) *gdb.Model {
	return g.DB().Model(d.table).Safe().Ctx(ctx)
}

func (d *sysCronLogDao) Columns() *sysCronLogColumns { return &sysCronLogCols }

type sysCronLogColumns struct {
	Id, CronId, Name, Title, Params string
	Status, Output, ErrMsg, TakeMs  string
	CreatedAt                       string
}

var sysCronLogCols = sysCronLogColumns{
	Id: "id", CronId: "cron_id", Name: "name", Title: "title",
	Params: "params", Status: "status", Output: "output",
	ErrMsg: "err_msg", TakeMs: "take_ms", CreatedAt: "created_at",
}
