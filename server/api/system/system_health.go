package system

import "github.com/gogf/gf/v2/frame/g"

// HealthReq 健康检查请求
type HealthReq struct {
	g.Meta `path:"/health" method:"get" tags:"System" summary:"Health check"`
}

// HealthRes 健康检查响应
type HealthRes struct {
	Status string `json:"status" example:"ok"`
}
