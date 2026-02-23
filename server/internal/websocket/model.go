package websocket

import "time"

// WsRequest 客户端发送的 WebSocket 消息
type WsRequest struct {
	Event string         `json:"event"`          // 事件名称（路由键）
	Data  map[string]any `json:"data,omitempty"` // 负载数据
}

// WsResponse 服务端响应的 WebSocket 消息
type WsResponse struct {
	Event     string `json:"event"`              // 事件名称
	Data      any    `json:"data,omitempty"`     // 响应数据
	Code      int    `json:"code"`               // 状态码（0=成功）
	ErrorMsg  string `json:"errorMsg,omitempty"` // 错误信息
	Timestamp int64  `json:"timestamp"`          // 时间戳
}

// NewResponse 快捷构建成功响应
func NewResponse(event string, data any) *WsResponse {
	return &WsResponse{
		Event:     event,
		Data:      data,
		Code:      0,
		Timestamp: time.Now().Unix(),
	}
}

// NewErrorResponse 快捷构建错误响应
func NewErrorResponse(event string, code int, msg string) *WsResponse {
	return &WsResponse{
		Event:     event,
		Code:      code,
		ErrorMsg:  msg,
		Timestamp: time.Now().Unix(),
	}
}
