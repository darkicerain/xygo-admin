// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// TestOrderDao is the data access object for the table xy_test_order.
type TestOrderDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  TestOrderColumns   // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// TestOrderColumns defines and stores column names for the table xy_test_order.
type TestOrderColumns struct {
	Id        string //
	MemberId  string // 卖家ID
	ApplyId   string // 买家ID
	Amount    string // 订单金额
	Status    string // 状态:0=待处理,1=已完成,2=已取消
	Memo      string // 备注
	CreatedAt string // 创建时间
	UpdatedAt string // 更新时间
}

// testOrderColumns holds the columns for the table xy_test_order.
var testOrderColumns = TestOrderColumns{
	Id:        "id",
	MemberId:  "member_id",
	ApplyId:   "apply_id",
	Amount:    "amount",
	Status:    "status",
	Memo:      "memo",
	CreatedAt: "created_at",
	UpdatedAt: "updated_at",
}

// NewTestOrderDao creates and returns a new DAO object for table data access.
func NewTestOrderDao(handlers ...gdb.ModelHandler) *TestOrderDao {
	return &TestOrderDao{
		group:    "default",
		table:    "xy_test_order",
		columns:  testOrderColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *TestOrderDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *TestOrderDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *TestOrderDao) Columns() TestOrderColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *TestOrderDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *TestOrderDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *TestOrderDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
