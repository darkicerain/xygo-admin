// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// TestCategoryDao is the data access object for the table xy_test_category.
type TestCategoryDao struct {
	table    string              // table is the underlying table name of the DAO.
	group    string              // group is the database configuration group name of the current DAO.
	columns  TestCategoryColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler  // handlers for customized model modification.
}

// TestCategoryColumns defines and stores column names for the table xy_test_category.
type TestCategoryColumns struct {
	Id        string //
	ParentId  string // 鐖剁骇ID
	Name      string // 分类名称
	Icon      string // 图标
	Image     string // 分类图片
	Sort      string // 排序
	Status    string // 状态:0=禁用,1=启用
	Remark    string // 备注
	CreatedAt string // 创建时间
	UpdatedAt string // 更新时间
}

// testCategoryColumns holds the columns for the table xy_test_category.
var testCategoryColumns = TestCategoryColumns{
	Id:        "id",
	ParentId:  "parent_id",
	Name:      "name",
	Icon:      "icon",
	Image:     "image",
	Sort:      "sort",
	Status:    "status",
	Remark:    "remark",
	CreatedAt: "created_at",
	UpdatedAt: "updated_at",
}

// NewTestCategoryDao creates and returns a new DAO object for table data access.
func NewTestCategoryDao(handlers ...gdb.ModelHandler) *TestCategoryDao {
	return &TestCategoryDao{
		group:    "default",
		table:    "xy_test_category",
		columns:  testCategoryColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *TestCategoryDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *TestCategoryDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *TestCategoryDao) Columns() TestCategoryColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *TestCategoryDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *TestCategoryDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *TestCategoryDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
