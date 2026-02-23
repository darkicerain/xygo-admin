package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 登录日志列表 =====================

type LoginLogListReq struct {
	g.Meta `path:"/admin/log/login/list" method:"post" tags:"AdminLog" summary:"登录日志列表"`
	adminin.LoginLogListInp
}

type LoginLogListRes struct {
	*adminin.LoginLogListModel
}

// ===================== 删除登录日志 =====================

type LoginLogDeleteReq struct {
	g.Meta `path:"/admin/log/login/delete" method:"post" tags:"AdminLog" summary:"删除登录日志"`
	adminin.LoginLogDeleteInp
}

type LoginLogDeleteRes struct{}

// ===================== 清空登录日志 =====================

type LoginLogClearReq struct {
	g.Meta `path:"/admin/log/login/clear" method:"post" tags:"AdminLog" summary:"清空登录日志"`
}

type LoginLogClearRes struct{}

// ===================== 操作日志列表 =====================

type OperationLogListReq struct {
	g.Meta `path:"/admin/log/operation/list" method:"post" tags:"AdminLog" summary:"操作日志列表"`
	adminin.OperationLogListInp
}

type OperationLogListRes struct {
	*adminin.OperationLogListModel
}

// ===================== 操作日志详情 =====================

type OperationLogDetailReq struct {
	g.Meta `path:"/admin/log/operation/detail" method:"get" tags:"AdminLog" summary:"操作日志详情"`
	adminin.OperationLogDetailInp
}

type OperationLogDetailRes struct {
	*adminin.OperationLogItem
}

// ===================== 删除操作日志 =====================

type OperationLogDeleteReq struct {
	g.Meta `path:"/admin/log/operation/delete" method:"post" tags:"AdminLog" summary:"删除操作日志"`
	adminin.OperationLogDeleteInp
}

type OperationLogDeleteRes struct{}

// ===================== 清空操作日志 =====================

type OperationLogClearReq struct {
	g.Meta `path:"/admin/log/operation/clear" method:"post" tags:"AdminLog" summary:"清空操作日志"`
}

type OperationLogClearRes struct{}
