// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// MemberCheckinDao is the data access object for the table xy_member_checkin.
type MemberCheckinDao struct {
	table    string               // table is the underlying table name of the DAO.
	group    string               // group is the database configuration group name of the current DAO.
	columns  MemberCheckinColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler   // handlers for customized model modification.
}

// MemberCheckinColumns defines and stores column names for the table xy_member_checkin.
type MemberCheckinColumns struct {
	Id             string //
	MemberId       string // 会员ID
	CheckinDate    string // 签到日期
	Score          string // 本次获得积分
	ContinuousDays string // 连续签到天数
	CreatedAt      string // 签到时间
}

// memberCheckinColumns holds the columns for the table xy_member_checkin.
var memberCheckinColumns = MemberCheckinColumns{
	Id:             "id",
	MemberId:       "member_id",
	CheckinDate:    "checkin_date",
	Score:          "score",
	ContinuousDays: "continuous_days",
	CreatedAt:      "created_at",
}

// NewMemberCheckinDao creates and returns a new DAO object for table data access.
func NewMemberCheckinDao(handlers ...gdb.ModelHandler) *MemberCheckinDao {
	return &MemberCheckinDao{
		group:    "default",
		table:    "xy_member_checkin",
		columns:  memberCheckinColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *MemberCheckinDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *MemberCheckinDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *MemberCheckinDao) Columns() MemberCheckinColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *MemberCheckinDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *MemberCheckinDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *MemberCheckinDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
