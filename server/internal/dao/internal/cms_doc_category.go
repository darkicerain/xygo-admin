// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// CmsDocCategoryDao is the data access object for the table xy_cms_doc_category.
type CmsDocCategoryDao struct {
	table    string                // table is the underlying table name of the DAO.
	group    string                // group is the database configuration group name of the current DAO.
	columns  CmsDocCategoryColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler    // handlers for customized model modification.
}

// CmsDocCategoryColumns defines and stores column names for the table xy_cms_doc_category.
type CmsDocCategoryColumns struct {
	Id        string // 分类ID
	Pid       string // 父分类ID(0=顶级)
	Title     string // 分类名称
	Icon      string // 图标
	Sort      string // 排序(越大越靠前)
	Status    string // 状态:1=正常,2=禁用
	Remark    string // 备注
	CreatedAt string // 创建时间
	UpdatedAt string // 更新时间
}

// cmsDocCategoryColumns holds the columns for the table xy_cms_doc_category.
var cmsDocCategoryColumns = CmsDocCategoryColumns{
	Id:        "id",
	Pid:       "pid",
	Title:     "title",
	Icon:      "icon",
	Sort:      "sort",
	Status:    "status",
	Remark:    "remark",
	CreatedAt: "created_at",
	UpdatedAt: "updated_at",
}

// NewCmsDocCategoryDao creates and returns a new DAO object for table data access.
func NewCmsDocCategoryDao(handlers ...gdb.ModelHandler) *CmsDocCategoryDao {
	return &CmsDocCategoryDao{
		group:    "default",
		table:    "xy_cms_doc_category",
		columns:  cmsDocCategoryColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *CmsDocCategoryDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *CmsDocCategoryDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *CmsDocCategoryDao) Columns() CmsDocCategoryColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *CmsDocCategoryDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *CmsDocCategoryDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *CmsDocCategoryDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
