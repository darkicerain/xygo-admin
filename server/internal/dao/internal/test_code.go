// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// TestCodeDao is the data access object for the table xy_test_code.
type TestCodeDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  TestCodeColumns    // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// TestCodeColumns defines and stores column names for the table xy_test_code.
type TestCodeColumns struct {
	Id       string // 主键
	Name     string // 名称
	MemberId string // 关联ID
}

// testCodeColumns holds the columns for the table xy_test_code.
var testCodeColumns = TestCodeColumns{
	Id:       "id",
	Name:     "name",
	MemberId: "member_id",
}

// NewTestCodeDao creates and returns a new DAO object for table data access.
func NewTestCodeDao(handlers ...gdb.ModelHandler) *TestCodeDao {
	return &TestCodeDao{
		group:    "default",
		table:    "xy_test_code",
		columns:  testCodeColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *TestCodeDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *TestCodeDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *TestCodeDao) Columns() TestCodeColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *TestCodeDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *TestCodeDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *TestCodeDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
