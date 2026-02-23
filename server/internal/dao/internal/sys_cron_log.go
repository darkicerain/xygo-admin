// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// SysCronLogDao is the data access object for the table xy_sys_cron_log.
type SysCronLogDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  SysCronLogColumns  // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// SysCronLogColumns defines and stores column names for the table xy_sys_cron_log.
type SysCronLogColumns struct {
	Id        string // 日志ID
	CronId    string // 任务ID
	Name      string // 任务标识
	Title     string // 任务标题
	Params    string // 执行参数
	Status    string // 状态:1成功,2失败
	Output    string // 执行输出
	ErrMsg    string // 错误信息
	TakeMs    string // 耗时(毫秒)
	CreatedAt string // 执行时间
}

// sysCronLogColumns holds the columns for the table xy_sys_cron_log.
var sysCronLogColumns = SysCronLogColumns{
	Id:        "id",
	CronId:    "cron_id",
	Name:      "name",
	Title:     "title",
	Params:    "params",
	Status:    "status",
	Output:    "output",
	ErrMsg:    "err_msg",
	TakeMs:    "take_ms",
	CreatedAt: "created_at",
}

// NewSysCronLogDao creates and returns a new DAO object for table data access.
func NewSysCronLogDao(handlers ...gdb.ModelHandler) *SysCronLogDao {
	return &SysCronLogDao{
		group:    "default",
		table:    "xy_sys_cron_log",
		columns:  sysCronLogColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *SysCronLogDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *SysCronLogDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *SysCronLogDao) Columns() SysCronLogColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *SysCronLogDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *SysCronLogDao) Ctx(ctx context.Context) *gdb.Model {
	model := dao.DB().Model(dao.table)
	for _, handler := range dao.handlers {
		model = handler(model)
	}
	return model.Safe().Ctx(ctx)
}

// Transaction wraps the transaction logic using function f.
// It rolls back the transaction and returns the error if function f returns a non-nil error.
// It commits the transaction and returns nil if function f returns nil.
//
// Note: Do not commit or roll back the transaction in function f,
// as it is automatically handled by this function.
func (dao *SysCronLogDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
