// ==========================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// ==========================================================================

package internal

import (
	"context"

	"github.com/gogf/gf/v2/database/gdb"
	"github.com/gogf/gf/v2/frame/g"
)

// AdminMenuDao is the data access object for the table xy_admin_menu.
type AdminMenuDao struct {
	table    string             // table is the underlying table name of the DAO.
	group    string             // group is the database configuration group name of the current DAO.
	columns  AdminMenuColumns   // columns contains all the column names of Table for convenient usage.
	handlers []gdb.ModelHandler // handlers for customized model modification.
}

// AdminMenuColumns defines and stores column names for the table xy_admin_menu.
type AdminMenuColumns struct {
	Id         string // 菜单ID
	ParentId   string // 上级菜单ID
	Type       string // 类型:1=目录,2=菜单,3=按钮
	Title      string // 标题(菜单名称)
	Name       string // 前端路由name
	Path       string // 路由路径
	Component  string // 前端组件路径
	Resource   string // 关联的数据资源（表名，用于字段权限）
	Icon       string // 图标
	Hidden     string // 是否隐藏:0=否,1=是
	KeepAlive  string // 是否缓存:0=否,1=是
	Redirect   string // 重定向地址
	FrameSrc   string // 内嵌iframe地址
	Perms      string // 权限点列表(JSON数组,内容为 METHOD+PATH 字符串)
	IsFrame    string // 是否内嵌:0=否,1=是
	Affix      string // 是否固定标签:0=否,1=是
	ShowBadge  string // 是否显示徽章:0=否,1=是
	BadgeText  string // 徽章文本
	ActivePath string // 激活高亮路径
	HideTab    string // 是否隐藏标签:0=否,1=是
	IsFullPage string // 是否全屏页面:0=否,1=是
	Sort       string // 排序(越大越靠后)
	Status     string // 状态:0=禁用,1=启用
	Remark     string // 备注
	CreatedBy  string // 创建人ID
	UpdatedBy  string // 更新人ID
	CreateTime string // 创建时间
	UpdateTime string // 更新时间
}

// adminMenuColumns holds the columns for the table xy_admin_menu.
var adminMenuColumns = AdminMenuColumns{
	Id:         "id",
	ParentId:   "parent_id",
	Type:       "type",
	Title:      "title",
	Name:       "name",
	Path:       "path",
	Component:  "component",
	Resource:   "resource",
	Icon:       "icon",
	Hidden:     "hidden",
	KeepAlive:  "keep_alive",
	Redirect:   "redirect",
	FrameSrc:   "frame_src",
	Perms:      "perms",
	IsFrame:    "is_frame",
	Affix:      "affix",
	ShowBadge:  "show_badge",
	BadgeText:  "badge_text",
	ActivePath: "active_path",
	HideTab:    "hide_tab",
	IsFullPage: "is_full_page",
	Sort:       "sort",
	Status:     "status",
	Remark:     "remark",
	CreatedBy:  "created_by",
	UpdatedBy:  "updated_by",
	CreateTime: "create_time",
	UpdateTime: "update_time",
}

// NewAdminMenuDao creates and returns a new DAO object for table data access.
func NewAdminMenuDao(handlers ...gdb.ModelHandler) *AdminMenuDao {
	return &AdminMenuDao{
		group:    "default",
		table:    "xy_admin_menu",
		columns:  adminMenuColumns,
		handlers: handlers,
	}
}

// DB retrieves and returns the underlying raw database management object of the current DAO.
func (dao *AdminMenuDao) DB() gdb.DB {
	return g.DB(dao.group)
}

// Table returns the table name of the current DAO.
func (dao *AdminMenuDao) Table() string {
	return dao.table
}

// Columns returns all column names of the current DAO.
func (dao *AdminMenuDao) Columns() AdminMenuColumns {
	return dao.columns
}

// Group returns the database configuration group name of the current DAO.
func (dao *AdminMenuDao) Group() string {
	return dao.group
}

// Ctx creates and returns a Model for the current DAO. It automatically sets the context for the current operation.
func (dao *AdminMenuDao) Ctx(ctx context.Context) *gdb.Model {
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
func (dao *AdminMenuDao) Transaction(ctx context.Context, f func(ctx context.Context, tx gdb.TX) error) (err error) {
	return dao.Ctx(ctx).Transaction(ctx, f)
}
