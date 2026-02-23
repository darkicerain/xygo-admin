package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 资源列表 =====================

type ResourceListReq struct {
	g.Meta `path:"/admin/field/resourceList" method:"get" tags:"AdminField" summary:"获取所有资源列表"`
}

type ResourceListRes struct {
	*adminin.ResourceListModel
}
