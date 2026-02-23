// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminChatSessionDao is the data access object for the table xy_admin_chat_session.
type AdminChatSessionDao struct {
	table    string                  // table is the underlying table name of the DAO.
	group    string                  // group is the database configuration group name of the current DAO.
	columns  AdminChatSessionColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler      // handlers for customized model modification.
}

// AdminChatSessionColumns defines and stores column names for the table xy_admin_chat_session.
type AdminChatSessionColumns struct {
	Id              string // 会话ID
	Type            string // 类型:1=单聊,2=群聊
	Name            string // 群名称(单聊为空)
	Avatar          string // 群头像
	CreatorId       string // 创建者ID
	LastMessage     string // 最后消息预览
	LastMessageTime string // 最后消息时间戳
	MemberCount     string // 成员数
	CreatedAt       string // 创建时间
	UpdatedAt       string // 更新时间
}

// adminChatSessionColumns holds the columns for the table xy_admin_chat_session.
var adminChatSessionColumns = AdminChatSessionColumns{
	Id:              "id",
	Type:            "type",
	Name:            "name",
	Avatar:          "avatar",
	CreatorId:       "creator_id",
	LastMessage:     "last_message",
	LastMessageTime: "last_message_time",
	MemberCount:     "member_count",
	CreatedAt:       "created_at",
	UpdatedAt:       "updated_at",
}

// NewAdminChatSessionDao creates and returns a new DAO object for table data access.
func NewAdminChatSessionDao(handlers ...gdb.ModelHandler) *AdminChatSessionDao {
	return &AdminChatSessionDao{
		group:    "default",
		table:    "xy_admin_chat_session",
		columns:  adminChatSessionColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminChatSessionDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminChatSessionDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminChatSessionDao) Columns() AdminChatSessionColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminChatSessionDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminChatSessionDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminChatSessionDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
