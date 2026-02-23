// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminRoleDao is the data access object for the table xy_admin_role.
type AdminRoleDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  AdminRoleColumns   // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// AdminRoleColumns defines and stores column names for the table xy_admin_role.
type AdminRoleColumns struct {
	Id          string // 角色ID
	Name        string // 角色名称
	Key         string // 角色标识(英文唯一)
	DataScope   string // 数据范围:0=全部,1=本部门,2=本部门及子,3=仅本人,4=自定义部门
	CustomDepts string // 自定义数据范围部门ID列表(JSON数组)
	Pid         string // 上级角色ID
	Level       string // 关系树等级（根为1）
	Tree        string // 关系树路径，如 0,1,3
	Sort        string // 排序（越小越靠前）
	Status      string // 状态:0=禁用,1=启用
	Remark      string // 备注
	CreatedBy   string // 创建人ID
	UpdatedBy   string // 更新人ID
	CreateTime  string // 创建时间
	UpdateTime  string // 更新时间
}

// adminRoleColumns holds the columns for the table xy_admin_role.
var adminRoleColumns = AdminRoleColumns{
	Id:          "id",
	Name:        "name",
	Key:         "key",
	DataScope:   "data_scope",
	CustomDepts: "custom_depts",
	Pid:         "pid",
	Level:       "level",
	Tree:        "tree",
	Sort:        "sort",
	Status:      "status",
	Remark:      "remark",
	CreatedBy:   "created_by",
	UpdatedBy:   "updated_by",
	CreateTime:  "create_time",
	UpdateTime:  "update_time",
}

// NewAdminRoleDao creates and returns a new DAO object for table data access.
func NewAdminRoleDao(handlers ...gdb.ModelHandler) *AdminRoleDao {
	return &AdminRoleDao{
		group:    "default",
		table:    "xy_admin_role",
		columns:  adminRoleColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminRoleDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminRoleDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminRoleDao) Columns() AdminRoleColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminRoleDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminRoleDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminRoleDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
