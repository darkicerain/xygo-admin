package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 后台社区管理 =====================

// 分类
type CommunityCategoryListReq struct {
	g.Meta `path:"/admin/cms/community/categoryList" method:"post" tags:"CmsCommunity" summary:"社区分类列表"`
	adminin.CommunityCategoryListInp
}
type CommunityCategoryListRes struct {
	*adminin.CommunityCategoryListModel
}

type CommunityCategorySaveReq struct {
	g.Meta `path:"/admin/cms/community/categorySave" method:"post" tags:"CmsCommunity" summary:"新增/编辑社区分类"`
	adminin.CommunityCategorySaveInp
}
type CommunityCategorySaveRes struct {
	Id uint64 `json:"id"`
}

type CommunityCategoryDeleteReq struct {
	g.Meta `path:"/admin/cms/community/categoryDelete" method:"post" tags:"CmsCommunity" summary:"删除社区分类"`
	adminin.CommunityCategoryDeleteInp
}
type CommunityCategoryDeleteRes struct{}

// 帖子
type CommunityPostListReq struct {
	g.Meta `path:"/admin/cms/community/postList" method:"post" tags:"CmsCommunity" summary:"帖子列表"`
	adminin.CommunityPostListInp
}
type CommunityPostListRes struct {
	*adminin.CommunityPostListModel
}

type CommunityPostDetailReq struct {
	g.Meta `path:"/admin/cms/community/postDetail" method:"get" tags:"CmsCommunity" summary:"帖子详情"`
	adminin.CommunityPostDetailInp
}
type CommunityPostDetailRes struct {
	*adminin.CommunityPostDetailModel
}

type CommunityPostUpdateReq struct {
	g.Meta `path:"/admin/cms/community/postUpdate" method:"post" tags:"CmsCommunity" summary:"编辑帖子(置顶/精华/状态)"`
	adminin.CommunityPostUpdateInp
}
type CommunityPostUpdateRes struct{}

type CommunityPostDeleteReq struct {
	g.Meta `path:"/admin/cms/community/postDelete" method:"post" tags:"CmsCommunity" summary:"删除帖子"`
	adminin.CommunityPostDeleteInp
}
type CommunityPostDeleteRes struct{}

// 回复
type CommunityReplyListReq struct {
	g.Meta `path:"/admin/cms/community/replyList" method:"post" tags:"CmsCommunity" summary:"回复列表"`
	adminin.CommunityReplyListInp
}
type CommunityReplyListRes struct {
	*adminin.CommunityReplyListModel
}

type CommunityReplyDeleteReq struct {
	g.Meta `path:"/admin/cms/community/replyDelete" method:"post" tags:"CmsCommunity" summary:"删除回复"`
	adminin.CommunityReplyDeleteInp
}
type CommunityReplyDeleteRes struct{}
