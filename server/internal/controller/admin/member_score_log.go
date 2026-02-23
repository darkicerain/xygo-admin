package admin

import (
	"context"

	api "xygo/api/admin"
	"xygo/internal/service"
)

// MemberScoreLogList 积分变动日志列表
func (c *ControllerV1) MemberScoreLogList(ctx context.Context, req *api.MemberScoreLogListReq) (res *api.MemberScoreLogListRes, err error) {
	result, err := service.MemberScoreLog().List(ctx, &req.MemberScoreLogListInp)
	if err != nil {
		return nil, err
	}
	return &api.MemberScoreLogListRes{result}, nil
}

// MemberScoreLogView 积分变动日志详情
func (c *ControllerV1) MemberScoreLogView(ctx context.Context, req *api.MemberScoreLogViewReq) (res *api.MemberScoreLogViewRes, err error) {
	result, err := service.MemberScoreLog().View(ctx, req.Id)
	if err != nil {
		return nil, err
	}
	return &api.MemberScoreLogViewRes{result}, nil
}

// MemberScoreLogEdit 保存积分变动日志
func (c *ControllerV1) MemberScoreLogEdit(ctx context.Context, req *api.MemberScoreLogEditReq) (res *api.MemberScoreLogEditRes, err error) {
	err = service.MemberScoreLog().Edit(ctx, &req.MemberScoreLogEditInp)
	return &api.MemberScoreLogEditRes{}, err
}

// MemberScoreLogDelete 删除积分变动日志
func (c *ControllerV1) MemberScoreLogDelete(ctx context.Context, req *api.MemberScoreLogDeleteReq) (res *api.MemberScoreLogDeleteRes, err error) {
	err = service.MemberScoreLog().Delete(ctx, req.Id)
	return &api.MemberScoreLogDeleteRes{}, err
}
