// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminMenu is the golang structure for table admin_menu.
type AdminMenu struct {
	Id         uint64 `json:"id"         orm:"id"           description:"菜单ID"`                              // 菜单ID
	ParentId   uint64 `json:"parentId"   orm:"parent_id"    description:"上级菜单ID"`                            // 上级菜单ID
	Type       int    `json:"type"       orm:"type"         description:"类型:1=目录,2=菜单,3=按钮"`                 // 类型:1=目录,2=菜单,3=按钮
	Title      string `json:"title"      orm:"title"        description:"标题(菜单名称)"`                          // 标题(菜单名称)
	Name       string `json:"name"       orm:"name"         description:"前端路由name"`                          // 前端路由name
	Path       string `json:"path"       orm:"path"         description:"路由路径"`                              // 路由路径
	Component  string `json:"component"  orm:"component"    description:"前端组件路径"`                            // 前端组件路径
	Resource   string `json:"resource"   orm:"resource"     description:"关联的数据资源（表名，用于字段权限）"`                // 关联的数据资源（表名，用于字段权限）
	Icon       string `json:"icon"       orm:"icon"         description:"图标"`                                // 图标
	Hidden     int    `json:"hidden"     orm:"hidden"       description:"是否隐藏:0=否,1=是"`                      // 是否隐藏:0=否,1=是
	KeepAlive  int    `json:"keepAlive"  orm:"keep_alive"   description:"是否缓存:0=否,1=是"`                      // 是否缓存:0=否,1=是
	Redirect   string `json:"redirect"   orm:"redirect"     description:"重定向地址"`                             // 重定向地址
	FrameSrc   string `json:"frameSrc"   orm:"frame_src"    description:"内嵌iframe地址"`                        // 内嵌iframe地址
	Perms      string `json:"perms"      orm:"perms"        description:"权限点列表(JSON数组,内容为 METHOD+PATH 字符串)"` // 权限点列表(JSON数组,内容为 METHOD+PATH 字符串)
	IsFrame    int    `json:"isFrame"    orm:"is_frame"     description:"是否内嵌:0=否,1=是"`                      // 是否内嵌:0=否,1=是
	Affix      int    `json:"affix"      orm:"affix"        description:"是否固定标签:0=否,1=是"`                    // 是否固定标签:0=否,1=是
	ShowBadge  int    `json:"showBadge"  orm:"show_badge"   description:"是否显示徽章:0=否,1=是"`                    // 是否显示徽章:0=否,1=是
	BadgeText  string `json:"badgeText"  orm:"badge_text"   description:"徽章文本"`                              // 徽章文本
	ActivePath string `json:"activePath" orm:"active_path"  description:"激活高亮路径"`                            // 激活高亮路径
	HideTab    int    `json:"hideTab"    orm:"hide_tab"     description:"是否隐藏标签:0=否,1=是"`                    // 是否隐藏标签:0=否,1=是
	IsFullPage int    `json:"isFullPage" orm:"is_full_page" description:"是否全屏页面:0=否,1=是"`                    // 是否全屏页面:0=否,1=是
	Sort       int    `json:"sort"       orm:"sort"         description:"排序(越大越靠后)"`                         // 排序(越大越靠后)
	Status     int    `json:"status"     orm:"status"       description:"状态:0=禁用,1=启用"`                      // 状态:0=禁用,1=启用
	Remark     string `json:"remark"     orm:"remark"       description:"备注"`                                // 备注
	CreatedBy  uint64 `json:"createdBy"  orm:"created_by"   description:"创建人ID"`                             // 创建人ID
	UpdatedBy  uint64 `json:"updatedBy"  orm:"updated_by"   description:"更新人ID"`                             // 更新人ID
	CreateTime int    `json:"createTime" orm:"create_time"  description:"创建时间"`                              // 创建时间
	UpdateTime int    `json:"updateTime" orm:"update_time"  description:"更新时间"`                              // 更新时间
}
