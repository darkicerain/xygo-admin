// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminDeptDao is the data access object for the table xy_admin_dept.
type AdminDeptDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  AdminDeptColumns   // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// AdminDeptColumns defines and stores column names for the table xy_admin_dept.
type AdminDeptColumns struct {
	Id         string // 部门ID
	ParentId   string // 上级部门ID
	Name       string // 部门名称
	Sort       string // 排序
	Status     string // 状态:0禁用,1启用
	Remark     string // 备注
	CreateBy   string // 创建人
	CreateTime string // 创建时间
	UpdateTime string // 更新时间
}

// adminDeptColumns holds the columns for the table xy_admin_dept.
var adminDeptColumns = AdminDeptColumns{
	Id:         "id",
	ParentId:   "parent_id",
	Name:       "name",
	Sort:       "sort",
	Status:     "status",
	Remark:     "remark",
	CreateBy:   "create_by",
	CreateTime: "create_time",
	UpdateTime: "update_time",
}

// NewAdminDeptDao creates and returns a new DAO object for table data access.
func NewAdminDeptDao(handlers ...gdb.ModelHandler) *AdminDeptDao {
	return &AdminDeptDao{
		group:    "default",
		table:    "xy_admin_dept",
		columns:  adminDeptColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminDeptDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminDeptDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminDeptDao) Columns() AdminDeptColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminDeptDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminDeptDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminDeptDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
