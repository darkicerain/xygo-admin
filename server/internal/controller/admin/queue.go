package admin

import (
	"context"

	api "xygo/api/admin"
	"xygo/internal/library/queue"
)

// QueueStats 队列统计
func (c *ControllerV1) QueueStats(ctx context.Context, req *api.QueueStatsReq) (res *api.QueueStatsRes, err error) {
	return &api.QueueStatsRes{
		Driver: queue.GetDriverName(),
		Topics: queue.GetStats(ctx),
	}, nil
}

// QueueTopics 已注册 Topic 列表
func (c *ControllerV1) QueueTopics(ctx context.Context, req *api.QueueTopicsReq) (res *api.QueueTopicsRes, err error) {
	return &api.QueueTopicsRes{
		List: queue.GetRegisteredTopics(),
	}, nil
}

// QueuePushTest 测试投递消息（支持延迟）
func (c *ControllerV1) QueuePushTest(ctx context.Context, req *api.QueuePushTestReq) (res *api.QueuePushTestRes, err error) {
	if req.DelaySec > 0 {
		err = queue.DelayPush(req.Topic, req.Body, req.DelaySec)
	} else {
		err = queue.Push(req.Topic, req.Body)
	}
	return &api.QueuePushTestRes{}, err
}
