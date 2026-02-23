// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// CommunityPostDao is the data access object for the table xy_community_post.
type CommunityPostDao struct {
	table    string               // table is the underlying table name of the DAO.
	group    string               // group is the database configuration group name of the current DAO.
	columns  CommunityPostColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler   // handlers for customized model modification.
}

// CommunityPostColumns defines and stores column names for the table xy_community_post.
type CommunityPostColumns struct {
	Id                string // 帖子ID
	MemberId          string // 发帖会员ID
	CategoryId        string // 分类ID
	Title             string // 标题
	Content           string // 内容(Markdown)
	Tags              string // 标签(JSON数组)
	Views             string // 浏览量
	ReplyCount        string // 回复数
	LikeCount         string // 点赞数
	IsTop             string // 是否置顶:0=否,1=是
	IsEssence         string // 是否精华:0=否,1=是
	Status            string // 状态:1=正常,2=待审核,3=隐藏
	LastReplyAt       string // 最后回复时间
	LastReplyMemberId string // 最后回复人ID
	CreatedAt         string // 创建时间
	UpdatedAt         string // 更新时间
	DeletedAt         string // 删除时间(软删除)
	RewardScore       string //
}

// communityPostColumns holds the columns for the table xy_community_post.
var communityPostColumns = CommunityPostColumns{
	Id:                "id",
	MemberId:          "member_id",
	CategoryId:        "category_id",
	Title:             "title",
	Content:           "content",
	Tags:              "tags",
	Views:             "views",
	ReplyCount:        "reply_count",
	LikeCount:         "like_count",
	IsTop:             "is_top",
	IsEssence:         "is_essence",
	Status:            "status",
	LastReplyAt:       "last_reply_at",
	LastReplyMemberId: "last_reply_member_id",
	CreatedAt:         "created_at",
	UpdatedAt:         "updated_at",
	DeletedAt:         "deleted_at",
	RewardScore:       "reward_score",
}

// NewCommunityPostDao creates and returns a new DAO object for table data access.
func NewCommunityPostDao(handlers ...gdb.ModelHandler) *CommunityPostDao {
	return &CommunityPostDao{
		group:    "default",
		table:    "xy_community_post",
		columns:  communityPostColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *CommunityPostDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *CommunityPostDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *CommunityPostDao) Columns() CommunityPostColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *CommunityPostDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *CommunityPostDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *CommunityPostDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
