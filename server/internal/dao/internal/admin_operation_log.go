// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminOperationLogDao is the data access object for the table xy_admin_operation_log.
type AdminOperationLogDao struct {
	table    string                   // table is the underlying table name of the DAO.
	group    string                   // group is the database configuration group name of the current DAO.
	columns  AdminOperationLogColumns // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler       // handlers for customized model modification.
}

// AdminOperationLogColumns defines and stores column names for the table xy_admin_operation_log.
type AdminOperationLogColumns struct {
	Id           string // 日志ID
	UserId       string // 操作人ID
	Username     string // 操作人账号
	Module       string // 模块名称（如：用户管理、角色管理）
	Title        string // 操作标题/接口描述
	Method       string // HTTP方法（GET/POST/PUT/DELETE）
	Url          string // 请求URL
	Ip           string // 操作IP
	Location     string // 操作地点
	UserAgent    string // User-Agent
	RequestBody  string // 请求参数（JSON）
	ResponseBody string // 响应结果（JSON，可选截断存储）
	ErrorMessage string // 错误信息
	Status       string // 状态：0=失败 1=成功
	Elapsed      string // 耗时（毫秒）
	CreatedAt    string // 创建时间
}

// adminOperationLogColumns holds the columns for the table xy_admin_operation_log.
var adminOperationLogColumns = AdminOperationLogColumns{
	Id:           "id",
	UserId:       "user_id",
	Username:     "username",
	Module:       "module",
	Title:        "title",
	Method:       "method",
	Url:          "url",
	Ip:           "ip",
	Location:     "location",
	UserAgent:    "user_agent",
	RequestBody:  "request_body",
	ResponseBody: "response_body",
	ErrorMessage: "error_message",
	Status:       "status",
	Elapsed:      "elapsed",
	CreatedAt:    "created_at",
}

// NewAdminOperationLogDao creates and returns a new DAO object for table data access.
func NewAdminOperationLogDao(handlers ...gdb.ModelHandler) *AdminOperationLogDao {
	return &AdminOperationLogDao{
		group:    "default",
		table:    "xy_admin_operation_log",
		columns:  adminOperationLogColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminOperationLogDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminOperationLogDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminOperationLogDao) Columns() AdminOperationLogColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminOperationLogDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminOperationLogDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminOperationLogDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
