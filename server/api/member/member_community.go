package member

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 会员社区写入接口 =====================

type CommunityPostSaveReq struct {
	g.Meta `path:"/user/community/postSave" method:"post" tags:"MemberCommunity" summary:"发帖/编辑帖子"`
	adminin.CommunityPostSaveInp
}
type CommunityPostSaveRes struct {
	Id uint64 `json:"id"`
}

type CommunityPostDeleteReq struct {
	g.Meta `path:"/user/community/postDelete" method:"post" tags:"MemberCommunity" summary:"删除帖子"`
	adminin.CommunityPostDeleteInp
}
type CommunityPostDeleteRes struct{}

type CommunityReplySaveReq struct {
	g.Meta `path:"/user/community/replySave" method:"post" tags:"MemberCommunity" summary:"发表回复"`
	adminin.CommunityReplySaveInp
}
type CommunityReplySaveRes struct {
	Id uint64 `json:"id"`
}

type CommunityReplyDeleteReq struct {
	g.Meta `path:"/user/community/replyDelete" method:"post" tags:"MemberCommunity" summary:"删除回复"`
	adminin.CommunityReplyDeleteInp
}
type CommunityReplyDeleteRes struct{}

type CommunityLikeReq struct {
	g.Meta `path:"/user/community/like" method:"post" tags:"MemberCommunity" summary:"点赞/取消点赞"`
	adminin.CommunityLikeInp
}
type CommunityLikeRes struct {
	*adminin.CommunityLikeModel
}

type CommunityAcceptReplyReq struct {
	g.Meta `path:"/user/community/acceptReply" method:"post" tags:"MemberCommunity" summary:"采纳最佳回答"`
	adminin.CommunityAcceptReplyInp
}
type CommunityAcceptReplyRes struct{}

type CommunityCollectReq struct {
	g.Meta `path:"/user/community/collect" method:"post" tags:"MemberCommunity" summary:"收藏/取消收藏帖子"`
	adminin.CommunityCollectInp
}
type CommunityCollectRes struct {
	*adminin.CommunityCollectModel
}

// ===================== 会员社区查询接口 =====================

type CommunityMyPostListReq struct {
	g.Meta `path:"/user/community/myPosts" method:"get" tags:"MemberCommunity" summary:"我的帖子列表"`
	adminin.CommunityMyPostListInp
}
type CommunityMyPostListRes struct {
	*adminin.CommunityMyPostListModel
}

type CommunityMyReplyListReq struct {
	g.Meta `path:"/user/community/myReplies" method:"get" tags:"MemberCommunity" summary:"我的回复列表"`
	adminin.CommunityMyReplyListInp
}
type CommunityMyReplyListRes struct {
	*adminin.CommunityMyReplyListModel
}

type CommunityMyCollectListReq struct {
	g.Meta `path:"/user/community/myCollects" method:"get" tags:"MemberCommunity" summary:"我的收藏列表"`
	adminin.CommunityMyCollectListInp
}
type CommunityMyCollectListRes struct {
	*adminin.CommunityMyCollectListModel
}
