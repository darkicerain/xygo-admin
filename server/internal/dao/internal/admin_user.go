// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminUserDao is the data access object for the table xy_admin_user.
type AdminUserDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  AdminUserColumns   // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// AdminUserColumns defines and stores column names for the table xy_admin_user.
type AdminUserColumns struct {
	Id          string // 管理员ID
	Username    string // 登录账号
	Nickname    string // 昵称
	RealName    string // 真实姓名
	Password    string // 密码哈希
	Gender      string // 性别0保密 1男 2女
	Salt        string // 密码盐
	Mobile      string // 手机号
	Address     string // 地址
	Remark      string // 个人简介
	Email       string // 邮箱
	Avatar      string // 头像
	DeptId      string // 部门ID
	Pid         string // 上级用户ID（直属上级）
	IsSuper     string // 是否超管:0=否,1=是
	Status      string // 状态:0=禁用,1=启用
	LastLoginAt string // last login time
	LastLoginIp string // 最后登录IP
	CreatedBy   string // 创建人ID
	UpdatedBy   string // 更新人ID
	CreateTime  string // 创建时间
	UpdateTime  string // 更新时间
}

// adminUserColumns holds the columns for the table xy_admin_user.
var adminUserColumns = AdminUserColumns{
	Id:          "id",
	Username:    "username",
	Nickname:    "nickname",
	RealName:    "real_name",
	Password:    "password",
	Gender:      "gender",
	Salt:        "salt",
	Mobile:      "mobile",
	Address:     "address",
	Remark:      "remark",
	Email:       "email",
	Avatar:      "avatar",
	DeptId:      "dept_id",
	Pid:         "pid",
	IsSuper:     "is_super",
	Status:      "status",
	LastLoginAt: "last_login_at",
	LastLoginIp: "last_login_ip",
	CreatedBy:   "created_by",
	UpdatedBy:   "updated_by",
	CreateTime:  "create_time",
	UpdateTime:  "update_time",
}

// NewAdminUserDao creates and returns a new DAO object for table data access.
func NewAdminUserDao(handlers ...gdb.ModelHandler) *AdminUserDao {
	return &AdminUserDao{
		group:    "default",
		table:    "xy_admin_user",
		columns:  adminUserColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminUserDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminUserDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminUserDao) Columns() AdminUserColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminUserDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminUserDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminUserDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
