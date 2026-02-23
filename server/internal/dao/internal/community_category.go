// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// CommunityCategoryDao is the data access object for the table xy_community_category.
type CommunityCategoryDao struct {
	table    string                   // table is the underlying table name of the DAO.
	group    string                   // group is the database configuration group name of the current DAO.
	columns  CommunityCategoryColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler       // handlers for customized model modification.
}

// CommunityCategoryColumns defines and stores column names for the table xy_community_category.
type CommunityCategoryColumns struct {
	Id        string // 分类ID
	Title     string // 分类名称
	Icon      string // 图标
	Sort      string // 排序(越大越靠前)
	Status    string // 状态:1=正常,2=禁用
	CreatedAt string // 创建时间
	UpdatedAt string // 更新时间
}

// communityCategoryColumns holds the columns for the table xy_community_category.
var communityCategoryColumns = CommunityCategoryColumns{
	Id:        "id",
	Title:     "title",
	Icon:      "icon",
	Sort:      "sort",
	Status:    "status",
	CreatedAt: "created_at",
	UpdatedAt: "updated_at",
}

// NewCommunityCategoryDao creates and returns a new DAO object for table data access.
func NewCommunityCategoryDao(handlers ...gdb.ModelHandler) *CommunityCategoryDao {
	return &CommunityCategoryDao{
		group:    "default",
		table:    "xy_community_category",
		columns:  communityCategoryColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *CommunityCategoryDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *CommunityCategoryDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *CommunityCategoryDao) Columns() CommunityCategoryColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *CommunityCategoryDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *CommunityCategoryDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *CommunityCategoryDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
