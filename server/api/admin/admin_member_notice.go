package admin

import (
	"github.com/gogf/gf/v2/frame/g"
	"xygo/internal/model/input/adminin"
)

// MemberNoticeListReq 会员通知列表请求
type MemberNoticeListReq struct {
	g.Meta `path:"/admin/member-notice/list" method:"get" tags:"MemberNotice" summary:"会员通知列表"`
	adminin.MemberNoticeListInp
}

type MemberNoticeListRes struct {
	*adminin.MemberNoticeListModel
}

// MemberNoticeViewReq 会员通知详情请求
type MemberNoticeViewReq struct {
	g.Meta `path:"/admin/member-notice/view" method:"get" tags:"MemberNotice" summary:"会员通知详情"`
	Id uint64 `json:"id" v:"required#ID不能为空" dc:"ID"`
}

type MemberNoticeViewRes struct {
	*adminin.MemberNoticeViewModel
}

// MemberNoticeEditReq 会员通知保存请求
type MemberNoticeEditReq struct {
	g.Meta `path:"/admin/member-notice/edit" method:"post" tags:"MemberNotice" summary:"保存会员通知"`
	adminin.MemberNoticeEditInp
}

type MemberNoticeEditRes struct{}

// MemberNoticeDeleteReq 会员通知删除请求
type MemberNoticeDeleteReq struct {
	g.Meta `path:"/admin/member-notice/delete" method:"post" tags:"MemberNotice" summary:"删除会员通知"`
	Id uint64 `json:"id" v:"required#ID不能为空" dc:"ID"`
}

type MemberNoticeDeleteRes struct{}
