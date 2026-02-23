package site

import (
	"context"

	api "xygo/api/site"
	"xygo/internal/library/contexts"
	"xygo/internal/model/input/adminin"
	"xygo/internal/service"
)

// CommunityCategoryList 前台社区分类列表
func (c *ControllerV1) CommunityCategoryList(ctx context.Context, req *api.CommunityCategoryListReq) (res *api.CommunityCategoryListRes, err error) {
	result, err := service.Community().CategoryList(ctx, &adminin.CommunityCategoryListInp{Status: 1})
	if err != nil {
		return nil, err
	}
	return &api.CommunityCategoryListRes{CommunityCategoryListModel: result}, nil
}

// CommunityPostList 前台帖子列表
func (c *ControllerV1) CommunityPostList(ctx context.Context, req *api.CommunityPostListReq) (res *api.CommunityPostListRes, err error) {
	inp := req.CommunityPostListInp
	inp.Status = 1 // 前台只看正常状态
	result, err := service.Community().PostList(ctx, &inp)
	if err != nil {
		return nil, err
	}
	return &api.CommunityPostListRes{CommunityPostListModel: result}, nil
}

// CommunityPostDetail 前台帖子详情
func (c *ControllerV1) CommunityPostDetail(ctx context.Context, req *api.CommunityPostDetailReq) (res *api.CommunityPostDetailRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	result, err := service.Community().SitePostDetail(ctx, req.Id, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityPostDetailRes{CommunityPostDetailModel: result}, nil
}

// CommunityReplyList 前台回复列表
func (c *ControllerV1) CommunityReplyList(ctx context.Context, req *api.CommunityReplyListReq) (res *api.CommunityReplyListRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	result, err := service.Community().ReplyList(ctx, &req.CommunityReplyListInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityReplyListRes{CommunityReplyListModel: result}, nil
}

// CommunityHotTags 热门标签
func (c *ControllerV1) CommunityHotTags(ctx context.Context, req *api.CommunityHotTagsReq) (res *api.CommunityHotTagsRes, err error) {
	result, err := service.Community().HotTags(ctx)
	if err != nil {
		return nil, err
	}
	return &api.CommunityHotTagsRes{CommunityHotTagsModel: result}, nil
}

// CommunityWaitingPosts 待解答帖子
func (c *ControllerV1) CommunityWaitingPosts(ctx context.Context, req *api.CommunityWaitingPostsReq) (res *api.CommunityWaitingPostsRes, err error) {
	list, err := service.Community().WaitingPosts(ctx)
	if err != nil {
		return nil, err
	}
	return &api.CommunityWaitingPostsRes{List: list}, nil
}

// CommunitySearch 全文搜索
func (c *ControllerV1) CommunitySearch(ctx context.Context, req *api.CommunitySearchReq) (res *api.CommunitySearchRes, err error) {
	memberId := contexts.GetMemberId(ctx) // 游客为0
	result, err := service.Community().Search(ctx, &req.CommunitySearchInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunitySearchRes{CommunitySearchModel: result}, nil
}

// CommunityHotSearchWords 热门搜索词
func (c *ControllerV1) CommunityHotSearchWords(ctx context.Context, req *api.CommunityHotSearchWordsReq) (res *api.CommunityHotSearchWordsRes, err error) {
	result, err := service.Community().HotSearchWords(ctx)
	if err != nil {
		return nil, err
	}
	return &api.CommunityHotSearchWordsRes{CommunityHotSearchWordsModel: result}, nil
}
