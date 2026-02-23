package member

import (
	"context"

	api "xygo/api/member"
	"xygo/internal/consts"
	"xygo/internal/library/captcha"
	"xygo/internal/library/contexts"
	"xygo/internal/service"

	"github.com/gogf/gf/v2/errors/gerror"
)

// CommunityPostSave 发帖/编辑帖子
func (c *ControllerV1) CommunityPostSave(ctx context.Context, req *api.CommunityPostSaveReq) (res *api.CommunityPostSaveRes, err error) {
	// 验证码校验（硬关联）
	if !captcha.VerifyClick(ctx, req.CaptchaId, req.CaptchaInfo) {
		return nil, gerror.NewCode(consts.CodeBusinessError, "验证码错误或已过期，请重试")
	}
	memberId := contexts.GetMemberId(ctx)
	id, err := service.Community().PostSave(ctx, &req.CommunityPostSaveInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityPostSaveRes{Id: id}, nil
}

// CommunityPostDelete 删除自己的帖子
func (c *ControllerV1) CommunityPostDelete(ctx context.Context, req *api.CommunityPostDeleteReq) (res *api.CommunityPostDeleteRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	err = service.Community().PostDelete(ctx, req.Id, memberId)
	return &api.CommunityPostDeleteRes{}, err
}

// CommunityReplySave 发表回复
func (c *ControllerV1) CommunityReplySave(ctx context.Context, req *api.CommunityReplySaveReq) (res *api.CommunityReplySaveRes, err error) {
	// 验证码校验（硬关联，和登录一样）
	if !captcha.VerifyClick(ctx, req.CaptchaId, req.CaptchaInfo) {
		return nil, gerror.NewCode(consts.CodeBusinessError, "验证码错误或已过期，请重试")
	}
	memberId := contexts.GetMemberId(ctx)
	id, err := service.Community().ReplySave(ctx, &req.CommunityReplySaveInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityReplySaveRes{Id: id}, nil
}

// CommunityReplyDelete 删除自己的回复
func (c *ControllerV1) CommunityReplyDelete(ctx context.Context, req *api.CommunityReplyDeleteReq) (res *api.CommunityReplyDeleteRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	err = service.Community().ReplyDelete(ctx, req.Id, memberId)
	return &api.CommunityReplyDeleteRes{}, err
}

// CommunityLike 点赞/取消点赞
func (c *ControllerV1) CommunityLike(ctx context.Context, req *api.CommunityLikeReq) (res *api.CommunityLikeRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	result, err := service.Community().Like(ctx, &req.CommunityLikeInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityLikeRes{CommunityLikeModel: result}, nil
}

// CommunityAcceptReply 采纳最佳回答
func (c *ControllerV1) CommunityAcceptReply(ctx context.Context, req *api.CommunityAcceptReplyReq) (res *api.CommunityAcceptReplyRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	err = service.Community().AcceptReply(ctx, req.ReplyId, memberId)
	return &api.CommunityAcceptReplyRes{}, err
}

// CommunityCollect 收藏/取消收藏帖子
func (c *ControllerV1) CommunityCollect(ctx context.Context, req *api.CommunityCollectReq) (res *api.CommunityCollectRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	result, err := service.Community().Collect(ctx, &req.CommunityCollectInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityCollectRes{CommunityCollectModel: result}, nil
}

// CommunityMyPostList 我的帖子列表
func (c *ControllerV1) CommunityMyPostList(ctx context.Context, req *api.CommunityMyPostListReq) (res *api.CommunityMyPostListRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	result, err := service.Community().MyPostList(ctx, &req.CommunityMyPostListInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityMyPostListRes{CommunityMyPostListModel: result}, nil
}

// CommunityMyReplyList 我的回复列表
func (c *ControllerV1) CommunityMyReplyList(ctx context.Context, req *api.CommunityMyReplyListReq) (res *api.CommunityMyReplyListRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	result, err := service.Community().MyReplyList(ctx, &req.CommunityMyReplyListInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityMyReplyListRes{CommunityMyReplyListModel: result}, nil
}

// CommunityMyCollectList 我的收藏列表
func (c *ControllerV1) CommunityMyCollectList(ctx context.Context, req *api.CommunityMyCollectListReq) (res *api.CommunityMyCollectListRes, err error) {
	memberId := contexts.GetMemberId(ctx)
	result, err := service.Community().MyCollectList(ctx, &req.CommunityMyCollectListInp, memberId)
	if err != nil {
		return nil, err
	}
	return &api.CommunityMyCollectListRes{CommunityMyCollectListModel: result}, nil
}
