// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// CommunitySearchLogDao is the data access object for the table xy_community_search_log.
type CommunitySearchLogDao struct {
	table    string                    // table is the underlying table name of the DAO.
	group    string                    // group is the database configuration group name of the current DAO.
	columns  CommunitySearchLogColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler        // handlers for customized model modification.
}

// CommunitySearchLogColumns defines and stores column names for the table xy_community_search_log.
type CommunitySearchLogColumns struct {
	Id        string //
	Keyword   string //
	MemberId  string //
	CreatedAt string //
}

// communitySearchLogColumns holds the columns for the table xy_community_search_log.
var communitySearchLogColumns = CommunitySearchLogColumns{
	Id:        "id",
	Keyword:   "keyword",
	MemberId:  "member_id",
	CreatedAt: "created_at",
}

// NewCommunitySearchLogDao creates and returns a new DAO object for table data access.
func NewCommunitySearchLogDao(handlers ...gdb.ModelHandler) *CommunitySearchLogDao {
	return &CommunitySearchLogDao{
		group:    "default",
		table:    "xy_community_search_log",
		columns:  communitySearchLogColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *CommunitySearchLogDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *CommunitySearchLogDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *CommunitySearchLogDao) Columns() CommunitySearchLogColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *CommunitySearchLogDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *CommunitySearchLogDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *CommunitySearchLogDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
