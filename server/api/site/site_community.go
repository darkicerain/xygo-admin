package site

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 前台社区公开接口 =====================

type CommunityCategoryListReq struct {
	g.Meta `path:"/site/community/categoryList" method:"get" tags:"SiteCommunity" summary:"社区分类列表"`
}
type CommunityCategoryListRes struct {
	*adminin.CommunityCategoryListModel
}

type CommunityPostListReq struct {
	g.Meta `path:"/site/community/postList" method:"get" tags:"SiteCommunity" summary:"帖子列表"`
	adminin.CommunityPostListInp
}
type CommunityPostListRes struct {
	*adminin.CommunityPostListModel
}

type CommunityPostDetailReq struct {
	g.Meta `path:"/site/community/postDetail" method:"get" tags:"SiteCommunity" summary:"帖子详情"`
	adminin.CommunityPostDetailInp
}
type CommunityPostDetailRes struct {
	*adminin.CommunityPostDetailModel
}

type CommunityReplyListReq struct {
	g.Meta `path:"/site/community/replyList" method:"get" tags:"SiteCommunity" summary:"回复列表"`
	adminin.CommunityReplyListInp
}
type CommunityReplyListRes struct {
	*adminin.CommunityReplyListModel
}

type CommunityHotTagsReq struct {
	g.Meta `path:"/site/community/hotTags" method:"get" tags:"SiteCommunity" summary:"热门标签"`
}
type CommunityHotTagsRes struct {
	*adminin.CommunityHotTagsModel
}

type CommunityWaitingPostsReq struct {
	g.Meta `path:"/site/community/waitingPosts" method:"get" tags:"SiteCommunity" summary:"待解答帖子"`
}
type CommunityWaitingPostsRes struct {
	List []adminin.CommunityPostListItem `json:"list"`
}

type CommunitySearchReq struct {
	g.Meta `path:"/site/community/search" method:"get" tags:"SiteCommunity" summary:"全文搜索"`
	adminin.CommunitySearchInp
}
type CommunitySearchRes struct {
	*adminin.CommunitySearchModel
}

type CommunityHotSearchWordsReq struct {
	g.Meta `path:"/site/community/hotSearchWords" method:"get" tags:"SiteCommunity" summary:"热门搜索词"`
}
type CommunityHotSearchWordsRes struct {
	*adminin.CommunityHotSearchWordsModel
}
