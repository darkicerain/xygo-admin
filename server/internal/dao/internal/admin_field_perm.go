// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminFieldPermDao is the data access object for the table xy_admin_field_perm.
type AdminFieldPermDao struct {
	table    string                // table is the underlying table name of the DAO.
	group    string                // group is the database configuration group name of the current DAO.
	columns  AdminFieldPermColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler    // handlers for customized model modification.
}

// AdminFieldPermColumns defines and stores column names for the table xy_admin_field_perm.
type AdminFieldPermColumns struct {
	Id         string // 主键
	RoleId     string // 角色ID
	Module     string // 模块名称（如：system、org）
	Resource   string // 资源标识（表名或页面标识，如：admin_user、user_list）
	FieldName  string // 字段名称（如：mobile、salary）
	FieldLabel string // 字段显示名称（用于界面展示）
	PermType   string // 权限类型：0=不可见，1=只读，2=可编辑
	Status     string // 状态：0=禁用，1=启用
	Remark     string // 备注
	CreateTime string // 创建时间
	UpdateTime string // 更新时间
}

// adminFieldPermColumns holds the columns for the table xy_admin_field_perm.
var adminFieldPermColumns = AdminFieldPermColumns{
	Id:         "id",
	RoleId:     "role_id",
	Module:     "module",
	Resource:   "resource",
	FieldName:  "field_name",
	FieldLabel: "field_label",
	PermType:   "perm_type",
	Status:     "status",
	Remark:     "remark",
	CreateTime: "create_time",
	UpdateTime: "update_time",
}

// NewAdminFieldPermDao creates and returns a new DAO object for table data access.
func NewAdminFieldPermDao(handlers ...gdb.ModelHandler) *AdminFieldPermDao {
	return &AdminFieldPermDao{
		group:    "default",
		table:    "xy_admin_field_perm",
		columns:  adminFieldPermColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminFieldPermDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminFieldPermDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminFieldPermDao) Columns() AdminFieldPermColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminFieldPermDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminFieldPermDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminFieldPermDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
