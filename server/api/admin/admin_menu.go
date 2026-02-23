package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 菜单树 =====================

type MenuTreeReq struct {
	g.Meta `path:"/admin/menu/tree" method:"get" tags:"AdminMenu" summary:"菜单树"`
}

type MenuTreeRes struct {
	*adminin.MenuTreeModel
}

// ===================== 菜单路由 =====================

type MenuRoutesReq struct {
	g.Meta `path:"/admin/menu/routes" method:"get" tags:"AdminMenu" summary:"菜单路由（前端）"`
	adminin.MenuRoutesInp
}

type MenuRoutesRes struct {
	*adminin.MenuTreeModel
}

// ===================== 菜单详情 =====================

type MenuDetailReq struct {
	g.Meta `path:"/admin/menu/detail" method:"get" tags:"AdminMenu" summary:"菜单详情"`
	adminin.MenuDetailInp
}

type MenuDetailRes struct {
	*adminin.MenuTreeItem
}

// ===================== 菜单保存 =====================

type MenuSaveReq struct {
	g.Meta `path:"/admin/menu/save" method:"post" tags:"AdminMenu" summary:"菜单保存"`
	adminin.MenuSaveInp
}

type MenuSaveRes struct {
	Id uint `json:"id" dc:"菜单ID"`
}

// ===================== 菜单删除 =====================

type MenuDeleteReq struct {
	g.Meta `path:"/admin/menu/delete" method:"post" tags:"AdminMenu" summary:"菜单删除"`
	adminin.MenuDeleteInp
}

type MenuDeleteRes struct{}
