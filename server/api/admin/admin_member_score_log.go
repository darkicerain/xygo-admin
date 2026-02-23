package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"xygo/internal/model/input/adminin"
)

// MemberScoreLogListReq 积分变动日志列表请求
type MemberScoreLogListReq struct {
	g.Meta `path:"/admin/member-score-log/list" method:"get" tags:"MemberScoreLog" summary:"积分变动日志列表"`
	adminin.MemberScoreLogListInp
}

type MemberScoreLogListRes struct {
	*adminin.MemberScoreLogListModel
}

// MemberScoreLogViewReq 积分变动日志详情请求
type MemberScoreLogViewReq struct {
	g.Meta `path:"/admin/member-score-log/view" method:"get" tags:"MemberScoreLog" summary:"积分变动日志详情"`
	Id uint64 `json:"id" v:"required#ID不能为空" dc:"ID"`
}

type MemberScoreLogViewRes struct {
	*adminin.MemberScoreLogViewModel
}

// MemberScoreLogEditReq 积分变动日志保存请求
type MemberScoreLogEditReq struct {
	g.Meta `path:"/admin/member-score-log/edit" method:"post" tags:"MemberScoreLog" summary:"保存积分变动日志"`
	adminin.MemberScoreLogEditInp
}

type MemberScoreLogEditRes struct{}

// MemberScoreLogDeleteReq 积分变动日志删除请求
type MemberScoreLogDeleteReq struct {
	g.Meta `path:"/admin/member-score-log/delete" method:"post" tags:"MemberScoreLog" summary:"删除积分变动日志"`
	Id uint64 `json:"id" v:"required#ID不能为空" dc:"ID"`
}

type MemberScoreLogDeleteRes struct{}
