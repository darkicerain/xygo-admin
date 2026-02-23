package admin

import (
	"context"

	api "xygo/api/admin"
	"xygo/internal/service"
)

// ===================== 社区分类管理 =====================

func (c *ControllerV1) CommunityCategoryList(ctx context.Context, req *api.CommunityCategoryListReq) (res *api.CommunityCategoryListRes, err error) {
	result, err := service.Community().CategoryList(ctx, &req.CommunityCategoryListInp)
	if err != nil {
		return nil, err
	}
	return &api.CommunityCategoryListRes{CommunityCategoryListModel: result}, nil
}

func (c *ControllerV1) CommunityCategorySave(ctx context.Context, req *api.CommunityCategorySaveReq) (res *api.CommunityCategorySaveRes, err error) {
	id, err := service.Community().CategorySave(ctx, &req.CommunityCategorySaveInp)
	if err != nil {
		return nil, err
	}
	return &api.CommunityCategorySaveRes{Id: id}, nil
}

func (c *ControllerV1) CommunityCategoryDelete(ctx context.Context, req *api.CommunityCategoryDeleteReq) (res *api.CommunityCategoryDeleteRes, err error) {
	err = service.Community().CategoryDelete(ctx, req.Id)
	return &api.CommunityCategoryDeleteRes{}, err
}

// ===================== 社区帖子管理 =====================

func (c *ControllerV1) CommunityPostList(ctx context.Context, req *api.CommunityPostListReq) (res *api.CommunityPostListRes, err error) {
	result, err := service.Community().PostList(ctx, &req.CommunityPostListInp)
	if err != nil {
		return nil, err
	}
	return &api.CommunityPostListRes{CommunityPostListModel: result}, nil
}

func (c *ControllerV1) CommunityPostDetail(ctx context.Context, req *api.CommunityPostDetailReq) (res *api.CommunityPostDetailRes, err error) {
	result, err := service.Community().PostDetail(ctx, req.Id, 0)
	if err != nil {
		return nil, err
	}
	return &api.CommunityPostDetailRes{CommunityPostDetailModel: result}, nil
}

func (c *ControllerV1) CommunityPostUpdate(ctx context.Context, req *api.CommunityPostUpdateReq) (res *api.CommunityPostUpdateRes, err error) {
	err = service.Community().PostUpdate(ctx, &req.CommunityPostUpdateInp)
	return &api.CommunityPostUpdateRes{}, err
}

func (c *ControllerV1) CommunityPostDelete(ctx context.Context, req *api.CommunityPostDeleteReq) (res *api.CommunityPostDeleteRes, err error) {
	err = service.Community().PostDelete(ctx, req.Id, 0) // 后台不校验 memberId
	return &api.CommunityPostDeleteRes{}, err
}

// ===================== 社区回复管理 =====================

func (c *ControllerV1) CommunityReplyList(ctx context.Context, req *api.CommunityReplyListReq) (res *api.CommunityReplyListRes, err error) {
	result, err := service.Community().ReplyList(ctx, &req.CommunityReplyListInp, 0)
	if err != nil {
		return nil, err
	}
	return &api.CommunityReplyListRes{CommunityReplyListModel: result}, nil
}

func (c *ControllerV1) CommunityReplyDelete(ctx context.Context, req *api.CommunityReplyDeleteReq) (res *api.CommunityReplyDeleteRes, err error) {
	err = service.Community().ReplyDelete(ctx, req.Id, 0) // 后台不校验 memberId
	return &api.CommunityReplyDeleteRes{}, err
}
