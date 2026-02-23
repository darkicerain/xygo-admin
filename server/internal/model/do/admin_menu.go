// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminMenu is the golang structure of table xy_admin_menu for DAO operations like Where/Data.
type AdminMenu struct {
	g.Meta     `orm:"table:xy_admin_menu, do:true"`
	Id         any // 菜单ID
	ParentId   any // 上级菜单ID
	Type       any // 类型:1=目录,2=菜单,3=按钮
	Title      any // 标题(菜单名称)
	Name       any // 前端路由name
	Path       any // 路由路径
	Component  any // 前端组件路径
	Resource   any // 关联的数据资源（表名，用于字段权限）
	Icon       any // 图标
	Hidden     any // 是否隐藏:0=否,1=是
	KeepAlive  any // 是否缓存:0=否,1=是
	Redirect   any // 重定向地址
	FrameSrc   any // 内嵌iframe地址
	Perms      any // 权限点列表(JSON数组,内容为 METHOD+PATH 字符串)
	IsFrame    any // 是否内嵌:0=否,1=是
	Affix      any // 是否固定标签:0=否,1=是
	ShowBadge  any // 是否显示徽章:0=否,1=是
	BadgeText  any // 徽章文本
	ActivePath any // 激活高亮路径
	HideTab    any // 是否隐藏标签:0=否,1=是
	IsFullPage any // 是否全屏页面:0=否,1=是
	Sort       any // 排序(越大越靠后)
	Status     any // 状态:0=禁用,1=启用
	Remark     any // 备注
	CreatedBy  any // 创建人ID
	UpdatedBy  any // 更新人ID
	CreateTime any // 创建时间
	UpdateTime any // 更新时间
}
