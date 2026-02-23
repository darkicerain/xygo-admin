// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// CmsCaseDao is the data access object for the table xy_cms_case.
type CmsCaseDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  CmsCaseColumns     // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// CmsCaseColumns defines and stores column names for the table xy_cms_case.
type CmsCaseColumns struct {
	Id         string // 案例ID
	CategoryId string // 分类ID
	Title      string // 案例标题
	Cover      string // 封面图
	Summary    string // 摘要
	Content    string // 案例详情(Markdown)
	Link       string // 外部链接
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

// cmsCaseColumns holds the columns for the table xy_cms_case.
var cmsCaseColumns = CmsCaseColumns{
	Id:         "id",
	CategoryId: "category_id",
	Title:      "title",
	Cover:      "cover",
	Summary:    "summary",
	Content:    "content",
	Link:       "link",
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

// NewCmsCaseDao creates and returns a new DAO object for table data access.
func NewCmsCaseDao(handlers ...gdb.ModelHandler) *CmsCaseDao {
	return &CmsCaseDao{
		group:    "default",
		table:    "xy_cms_case",
		columns:  cmsCaseColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *CmsCaseDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *CmsCaseDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *CmsCaseDao) Columns() CmsCaseColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *CmsCaseDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *CmsCaseDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *CmsCaseDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
