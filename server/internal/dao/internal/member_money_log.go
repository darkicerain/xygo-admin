// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// MemberMoneyLogDao is the data access object for the table xy_member_money_log.
type MemberMoneyLogDao struct {
	table    string                // table is the underlying table name of the DAO.
	group    string                // group is the database configuration group name of the current DAO.
	columns  MemberMoneyLogColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler    // handlers for customized model modification.
}

// MemberMoneyLogColumns defines and stores column names for the table xy_member_money_log.
type MemberMoneyLogColumns struct {
	Id        string //
	MemberId  string // 会员ID
	Money     string // 变动金额（分，正数=增加，负数=减少）
	Before    string // 变动前余额（分）
	After     string // 变动后余额（分）
	Memo      string // 变动说明
	CreatedAt string // 创建时间
}

// memberMoneyLogColumns holds the columns for the table xy_member_money_log.
var memberMoneyLogColumns = MemberMoneyLogColumns{
	Id:        "id",
	MemberId:  "member_id",
	Money:     "money",
	Before:    "before",
	After:     "after",
	Memo:      "memo",
	CreatedAt: "created_at",
}

// NewMemberMoneyLogDao creates and returns a new DAO object for table data access.
func NewMemberMoneyLogDao(handlers ...gdb.ModelHandler) *MemberMoneyLogDao {
	return &MemberMoneyLogDao{
		group:    "default",
		table:    "xy_member_money_log",
		columns:  memberMoneyLogColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *MemberMoneyLogDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *MemberMoneyLogDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *MemberMoneyLogDao) Columns() MemberMoneyLogColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *MemberMoneyLogDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *MemberMoneyLogDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *MemberMoneyLogDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
