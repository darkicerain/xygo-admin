// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// MemberGroupDao is the data access object for the table xy_member_group.
type MemberGroupDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  MemberGroupColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// MemberGroupColumns defines and stores column names for the table xy_member_group.
type MemberGroupColumns struct {
	Id        string // 分组ID
	Name      string // 分组名称
	Rules     string // 权限规则（菜单ID列表，逗号分隔）
	Status    string // 状态：0=禁用 1=正常
	Sort      string // 排序
	Remark    string // 备注
	CreatedAt string // 创建时间
	UpdatedAt string // 更新时间
}

// memberGroupColumns holds the columns for the table xy_member_group.
var memberGroupColumns = MemberGroupColumns{
	Id:        "id",
	Name:      "name",
	Rules:     "rules",
	Status:    "status",
	Sort:      "sort",
	Remark:    "remark",
	CreatedAt: "created_at",
	UpdatedAt: "updated_at",
}

// NewMemberGroupDao creates and returns a new DAO object for table data access.
func NewMemberGroupDao(handlers ...gdb.ModelHandler) *MemberGroupDao {
	return &MemberGroupDao{
		group:    "default",
		table:    "xy_member_group",
		columns:  memberGroupColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *MemberGroupDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *MemberGroupDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *MemberGroupDao) Columns() MemberGroupColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *MemberGroupDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *MemberGroupDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *MemberGroupDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
