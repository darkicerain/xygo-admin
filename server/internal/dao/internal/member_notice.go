// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// MemberNoticeDao is the data access object for the table xy_member_notice.
type MemberNoticeDao struct {
	table    string              // table is the underlying table name of the DAO.
	group    string              // group is the database configuration group name of the current DAO.
	columns  MemberNoticeColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler  // handlers for customized model modification.
}

// MemberNoticeColumns defines and stores column names for the table xy_member_notice.
type MemberNoticeColumns struct {
	Id        string //
	Title     string // 通知标题
	Content   string // 通知内容
	Type      string // 通知类型:system=系统通知,announce=公告,feature=功能更新,maintain=维护通知
	Target    string // 目标:all=全部会员,group=指定分组
	TargetId  string // 目标分组ID（target=group时有效）
	Sender    string // 发送者
	Status    string // 状态:0=草稿,1=已发布
	CreatedAt string // 创建时间
}

// memberNoticeColumns holds the columns for the table xy_member_notice.
var memberNoticeColumns = MemberNoticeColumns{
	Id:        "id",
	Title:     "title",
	Content:   "content",
	Type:      "type",
	Target:    "target",
	TargetId:  "target_id",
	Sender:    "sender",
	Status:    "status",
	CreatedAt: "created_at",
}

// NewMemberNoticeDao creates and returns a new DAO object for table data access.
func NewMemberNoticeDao(handlers ...gdb.ModelHandler) *MemberNoticeDao {
	return &MemberNoticeDao{
		group:    "default",
		table:    "xy_member_notice",
		columns:  memberNoticeColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *MemberNoticeDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *MemberNoticeDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *MemberNoticeDao) Columns() MemberNoticeColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *MemberNoticeDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *MemberNoticeDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *MemberNoticeDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
