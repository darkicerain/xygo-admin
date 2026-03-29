package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"xygo/internal/model/input/adminin"
)

// MemberLoginLogListReq 登录日志列表请求
type MemberLoginLogListReq struct {
	g.Meta `path:"/admin/member-login-log/list" method:"get" tags:"MemberLoginLog" summary:"登录日志列表"`
	adminin.MemberLoginLogListInp
}

type MemberLoginLogListRes struct {
	*adminin.MemberLoginLogListModel
}

// MemberLoginLogViewReq 登录日志详情请求
type MemberLoginLogViewReq struct {
	g.Meta `path:"/admin/member-login-log/view" method:"get" tags:"MemberLoginLog" summary:"登录日志详情"`
	Id uint64 `json:"id" v:"required#ID不能为空" dc:"ID"`
}

type MemberLoginLogViewRes struct {
	*adminin.MemberLoginLogViewModel
}

// MemberLoginLogDeleteReq 登录日志删除请求
type MemberLoginLogDeleteReq struct {
	g.Meta `path:"/admin/member-login-log/delete" method:"post" tags:"MemberLoginLog" summary:"删除登录日志"`
	Id uint64 `json:"id" v:"required#ID不能为空" dc:"ID"`
}

type MemberLoginLogDeleteRes struct{}
