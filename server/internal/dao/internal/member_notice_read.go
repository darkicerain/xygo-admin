// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// MemberNoticeReadDao is the data access object for the table xy_member_notice_read.
type MemberNoticeReadDao struct {
	table    string                  // table is the underlying table name of the DAO.
	group    string                  // group is the database configuration group name of the current DAO.
	columns  MemberNoticeReadColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler      // handlers for customized model modification.
}

// MemberNoticeReadColumns defines and stores column names for the table xy_member_notice_read.
type MemberNoticeReadColumns struct {
	Id       string //
	NoticeId string // 通知ID
	MemberId string // 会员ID
	ReadAt   string // 阅读时间
}

// memberNoticeReadColumns holds the columns for the table xy_member_notice_read.
var memberNoticeReadColumns = MemberNoticeReadColumns{
	Id:       "id",
	NoticeId: "notice_id",
	MemberId: "member_id",
	ReadAt:   "read_at",
}

// NewMemberNoticeReadDao creates and returns a new DAO object for table data access.
func NewMemberNoticeReadDao(handlers ...gdb.ModelHandler) *MemberNoticeReadDao {
	return &MemberNoticeReadDao{
		group:    "default",
		table:    "xy_member_notice_read",
		columns:  memberNoticeReadColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *MemberNoticeReadDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *MemberNoticeReadDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *MemberNoticeReadDao) Columns() MemberNoticeReadColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *MemberNoticeReadDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *MemberNoticeReadDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *MemberNoticeReadDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
