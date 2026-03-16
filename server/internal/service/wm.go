package service

import (
	"context"
	"xygo/internal/model/input/wmin"
)

type (
	IWmAuth interface {
		// WxLogin 微信小程序 code 登录（自动注册）
		WxLogin(ctx context.Context, in *wmin.WxLoginInput) (out *wmin.WxLoginOutput, err error)
	}
)

var (
	localWmAuth IWmAuth
)

func WmAuth() IWmAuth {
	if localWmAuth == nil {
		panic("implement not found for interface IWmAuth, forgot register?")
	}
	return localWmAuth
}

func RegisterWmAuth(i IWmAuth) {
	localWmAuth = i
}
