package wm

import (
	"github.com/gogf/gf/v2/frame/g"
	"xygo/internal/model/input/wmin"
)

// WxLoginReq 微信小游戏登录请求
type WxLoginReq struct {
	g.Meta `path:"/auth/login" method:"post" tags:"小游戏认证" summary:"微信code登录"`
	Code   string `json:"code" v:"required#请提供微信登录code"`
}

// WxLoginRes 微信小游戏登录响应
type WxLoginRes struct {
	*wmin.WxLoginOutput
}

// ProfileReq 获取当前用户信息
type ProfileReq struct {
	g.Meta `path:"/auth/profile" method:"get" tags:"小游戏认证" summary:"获取用户信息"`
}

// ProfileRes 用户信息响应
type ProfileRes struct {
	Id       uint64  `json:"id"`
	Nickname string  `json:"nickname"`
	Avatar   string  `json:"avatar"`
	Score    int     `json:"score"`
	Money    float64 `json:"money"`
	Level    int     `json:"level"`
}
