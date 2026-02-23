package system

import (
	"context"

	api "xygo/api/system"
)

// Health 健康检查接口，配合统一响应中间件返回标准结构。
func (c *ControllerV1) Health(ctx context.Context, req *api.HealthReq) (res *api.HealthRes, err error) {
	res = &api.HealthRes{
		Status: "ok",
	}
	return
}
