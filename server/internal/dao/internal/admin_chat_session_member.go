// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminChatSessionMemberDao is the data access object for the table xy_admin_chat_session_member.
type AdminChatSessionMemberDao struct {
	table    string                        // table is the underlying table name of the DAO.
	group    string                        // group is the database configuration group name of the current DAO.
	columns  AdminChatSessionMemberColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler            // handlers for customized model modification.
}

// AdminChatSessionMemberColumns defines and stores column names for the table xy_admin_chat_session_member.
type AdminChatSessionMemberColumns struct {
	Id            string // 主键
	SessionId     string // 会话ID
	UserId        string // 用户ID
	Role          string // 角色:1=成员,2=管理员,3=群主
	UnreadCount   string // 未读消息数
	LastReadMsgId string // 最后已读消息ID
	IsMuted       string // 是否免打扰:0=否,1=是
	IsDeleted     string // 是否删除会话:0=否,1=是
	JoinedAt      string // 加入时间
}

// adminChatSessionMemberColumns holds the columns for the table xy_admin_chat_session_member.
var adminChatSessionMemberColumns = AdminChatSessionMemberColumns{
	Id:            "id",
	SessionId:     "session_id",
	UserId:        "user_id",
	Role:          "role",
	UnreadCount:   "unread_count",
	LastReadMsgId: "last_read_msg_id",
	IsMuted:       "is_muted",
	IsDeleted:     "is_deleted",
	JoinedAt:      "joined_at",
}

// NewAdminChatSessionMemberDao creates and returns a new DAO object for table data access.
func NewAdminChatSessionMemberDao(handlers ...gdb.ModelHandler) *AdminChatSessionMemberDao {
	return &AdminChatSessionMemberDao{
		group:    "default",
		table:    "xy_admin_chat_session_member",
		columns:  adminChatSessionMemberColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminChatSessionMemberDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminChatSessionMemberDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminChatSessionMemberDao) Columns() AdminChatSessionMemberColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminChatSessionMemberDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminChatSessionMemberDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminChatSessionMemberDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
