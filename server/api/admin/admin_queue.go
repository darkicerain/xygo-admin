package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/library/queue"
)

// QueueStatsReq 队列统计
type QueueStatsReq struct {
	g.Meta `path:"/admin/queue/stats" method:"get" tags:"Queue" summary:"队列统计"`
}

type QueueStatsRes struct {
	Driver string             `json:"driver"`
	Topics []queue.TopicStats `json:"topics"`
}

// QueueTopicsReq 已注册的 Topic 列表
type QueueTopicsReq struct {
	g.Meta `path:"/admin/queue/topics" method:"get" tags:"Queue" summary:"已注册Topic列表"`
}

type QueueTopicsRes struct {
	List []string `json:"list"`
}

// QueuePushTestReq 测试投递消息
type QueuePushTestReq struct {
	g.Meta   `path:"/admin/queue/pushTest" method:"post" tags:"Queue" summary:"测试投递消息"`
	Topic    string `json:"topic"    p:"topic"    v:"required#Topic不能为空" dc:"队列Topic"`
	Body     string `json:"body"     p:"body"     v:"required#消息内容不能为空" dc:"消息内容(JSON)"`
	DelaySec int64  `json:"delaySec" p:"delaySec" d:"0" dc:"延迟秒数（0=即时投递）"`
}

type QueuePushTestRes struct{}
