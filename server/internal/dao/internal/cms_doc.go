// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// CmsDocDao is the data access object for the table xy_cms_doc.
type CmsDocDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  CmsDocColumns      // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// CmsDocColumns defines and stores column names for the table xy_cms_doc.
type CmsDocColumns struct {
	Id         string // 文档ID
	CategoryId string // 分类ID
	Title      string // 文档标题
	Slug       string // URL标识(唯一)
	Cover      string // 封面图
	Summary    string // 摘要
	Content    string // 文档内容(Markdown)
	Author     string // 作者
	Views      string // 浏览量
	Sort       string // 排序(越大越靠前)
	Status     string // 状态:1=已发布,2=草稿,3=下架
	IsTop      string // 是否置顶:0=否,1=是
	Tags       string // 标签(JSON数组)
	CreatedBy  string // 创建人ID
	UpdatedBy  string // 更新人ID
	CreatedAt  string // 创建时间
	UpdatedAt  string // 更新时间
	DeletedAt  string // 删除时间(软删除)
}

// cmsDocColumns holds the columns for the table xy_cms_doc.
var cmsDocColumns = CmsDocColumns{
	Id:         "id",
	CategoryId: "category_id",
	Title:      "title",
	Slug:       "slug",
	Cover:      "cover",
	Summary:    "summary",
	Content:    "content",
	Author:     "author",
	Views:      "views",
	Sort:       "sort",
	Status:     "status",
	IsTop:      "is_top",
	Tags:       "tags",
	CreatedBy:  "created_by",
	UpdatedBy:  "updated_by",
	CreatedAt:  "created_at",
	UpdatedAt:  "updated_at",
	DeletedAt:  "deleted_at",
}

// NewCmsDocDao creates and returns a new DAO object for table data access.
func NewCmsDocDao(handlers ...gdb.ModelHandler) *CmsDocDao {
	return &CmsDocDao{
		group:    "default",
		table:    "xy_cms_doc",
		columns:  cmsDocColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *CmsDocDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *CmsDocDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *CmsDocDao) Columns() CmsDocColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *CmsDocDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *CmsDocDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *CmsDocDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
