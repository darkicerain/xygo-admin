package queues

import (
	"context"
	"encoding/json"

	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/dao"
	"xygo/internal/library/queue"
)

const TopicLoginLog = "login_log"

func init() {
	queue.Register(&LoginLogConsumer{})
}

// LoginLogConsumer 登录日志异步写入消费者
type LoginLogConsumer struct{}

func (c *LoginLogConsumer) GetTopic() string { return TopicLoginLog }

func (c *LoginLogConsumer) Handle(ctx context.Context, msg *queue.Message) error {
	var data map[string]interface{}
	if err := json.Unmarshal([]byte(msg.Body), &data); err != nil {
		g.Log().Errorf(ctx, "[queue:login_log] unmarshal failed: %v", err)
		return nil // 格式错误不重试
	}
	if len(data) == 0 {
		g.Log().Warning(ctx, "[queue:login_log] empty data, skip")
		return nil
	}

	_, err := dao.AdminLoginLog.Ctx(ctx).Data(data).Insert()
	if err != nil {
		g.Log().Errorf(ctx, "[queue:login_log] insert failed: %v", err)
		// 数据库临时不可用时才重试，字段不匹配等不重试
		return queue.NewRetryError(err)
	}
	return nil
}
