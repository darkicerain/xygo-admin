package admin

import (
	"context"

	api "xygo/api/admin"
	"xygo/internal/service"
)

// MemberNoticeList 会员通知列表
func (c *ControllerV1) MemberNoticeList(ctx context.Context, req *api.MemberNoticeListReq) (res *api.MemberNoticeListRes, err error) {
	result, err := service.MemberNotice().List(ctx, &req.MemberNoticeListInp)
	if err != nil {
		return nil, err
	}
	return &api.MemberNoticeListRes{result}, nil
}

// MemberNoticeView 会员通知详情
func (c *ControllerV1) MemberNoticeView(ctx context.Context, req *api.MemberNoticeViewReq) (res *api.MemberNoticeViewRes, err error) {
	result, err := service.MemberNotice().View(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &api.MemberNoticeViewRes{result}, nil
}

// MemberNoticeEdit 保存会员通知
func (c *ControllerV1) MemberNoticeEdit(ctx context.Context, req *api.MemberNoticeEditReq) (res *api.MemberNoticeEditRes, err error) {
	err = service.MemberNotice().Edit(ctx, &req.MemberNoticeEditInp)
	return &api.MemberNoticeEditRes{}, err
}

// MemberNoticeDelete 删除会员通知
func (c *ControllerV1) MemberNoticeDelete(ctx context.Context, req *api.MemberNoticeDeleteReq) (res *api.MemberNoticeDeleteRes, err error) {
	err = service.MemberNotice().Delete(ctx, req.Id)
	return &api.MemberNoticeDeleteRes{}, err
}
