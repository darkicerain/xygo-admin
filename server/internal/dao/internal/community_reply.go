// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// CommunityReplyDao is the data access object for the table xy_community_reply.
type CommunityReplyDao struct {
	table    string                // table is the underlying table name of the DAO.
	group    string                // group is the database configuration group name of the current DAO.
	columns  CommunityReplyColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler    // handlers for customized model modification.
}

// CommunityReplyColumns defines and stores column names for the table xy_community_reply.
type CommunityReplyColumns struct {
	Id         string // 回复ID
	PostId     string // 帖子ID
	MemberId   string // 回复会员ID
	ParentId   string // 父回复ID(0=直接回复帖子)
	Content    string // 回复内容(Markdown)
	LikeCount  string // 点赞数
	IsAccepted string // 是否被采纳:0=否,1=是
	Status     string // 状态:1=正常,2=待审核,3=隐藏
	CreatedAt  string // 创建时间
	UpdatedAt  string // 更新时间
	DeletedAt  string // 删除时间(软删除)
}

// communityReplyColumns holds the columns for the table xy_community_reply.
var communityReplyColumns = CommunityReplyColumns{
	Id:         "id",
	PostId:     "post_id",
	MemberId:   "member_id",
	ParentId:   "parent_id",
	Content:    "content",
	LikeCount:  "like_count",
	IsAccepted: "is_accepted",
	Status:     "status",
	CreatedAt:  "created_at",
	UpdatedAt:  "updated_at",
	DeletedAt:  "deleted_at",
}

// NewCommunityReplyDao creates and returns a new DAO object for table data access.
func NewCommunityReplyDao(handlers ...gdb.ModelHandler) *CommunityReplyDao {
	return &CommunityReplyDao{
		group:    "default",
		table:    "xy_community_reply",
		columns:  communityReplyColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *CommunityReplyDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *CommunityReplyDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *CommunityReplyDao) Columns() CommunityReplyColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *CommunityReplyDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *CommunityReplyDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *CommunityReplyDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
