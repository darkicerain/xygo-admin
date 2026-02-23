// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminChatMessageDao is the data access object for the table xy_admin_chat_message.
type AdminChatMessageDao struct {
	table    string                  // table is the underlying table name of the DAO.
	group    string                  // group is the database configuration group name of the current DAO.
	columns  AdminChatMessageColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler      // handlers for customized model modification.
}

// AdminChatMessageColumns defines and stores column names for the table xy_admin_chat_message.
type AdminChatMessageColumns struct {
	Id        string // 消息ID
	SessionId string // 会话ID
	SenderId  string // 发送者ID
	Type      string // 消息类型:1=文字,2=图片,3=系统消息
	Content   string // 消息内容(图片时存URL)
	CreatedAt string // 发送时间
}

// adminChatMessageColumns holds the columns for the table xy_admin_chat_message.
var adminChatMessageColumns = AdminChatMessageColumns{
	Id:        "id",
	SessionId: "session_id",
	SenderId:  "sender_id",
	Type:      "type",
	Content:   "content",
	CreatedAt: "created_at",
}

// NewAdminChatMessageDao creates and returns a new DAO object for table data access.
func NewAdminChatMessageDao(handlers ...gdb.ModelHandler) *AdminChatMessageDao {
	return &AdminChatMessageDao{
		group:    "default",
		table:    "xy_admin_chat_message",
		columns:  adminChatMessageColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminChatMessageDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminChatMessageDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminChatMessageDao) Columns() AdminChatMessageColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminChatMessageDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminChatMessageDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminChatMessageDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
