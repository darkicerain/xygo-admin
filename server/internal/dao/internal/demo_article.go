// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// DemoArticleDao is the data access object for the table xy_demo_article.
type DemoArticleDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  DemoArticleColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// DemoArticleColumns defines and stores column names for the table xy_demo_article.
type DemoArticleColumns struct {
	Id         string // 主键
	CategoryId string // 分类ID
	Title      string // 标题
	Cover      string // 封面图
	Summary    string // 摘要
	Content    string // 内容
	Author     string // 作者
	Views      string // 浏览量
	Sort       string // 排序
	Status     string // 状态:1=启用,0=禁用
	CreatedAt  string // 创建时间
	UpdatedAt  string // 更新时间
}

// demoArticleColumns holds the columns for the table xy_demo_article.
var demoArticleColumns = DemoArticleColumns{
	Id:         "id",
	CategoryId: "category_id",
	Title:      "title",
	Cover:      "cover",
	Summary:    "summary",
	Content:    "content",
	Author:     "author",
	Views:      "views",
	Sort:       "sort",
	Status:     "status",
	CreatedAt:  "created_at",
	UpdatedAt:  "updated_at",
}

// NewDemoArticleDao creates and returns a new DAO object for table data access.
func NewDemoArticleDao(handlers ...gdb.ModelHandler) *DemoArticleDao {
	return &DemoArticleDao{
		group:    "default",
		table:    "xy_demo_article",
		columns:  demoArticleColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *DemoArticleDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *DemoArticleDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *DemoArticleDao) Columns() DemoArticleColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *DemoArticleDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *DemoArticleDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *DemoArticleDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
