package system

import (
	"context"

	"github.com/gogf/gf/v2/errors/gerror"

	api "xygo/api/system"
	"xygo/internal/library/captcha"
)

// ClickCaptcha 获取点选验证码
func (c *ControllerV1) ClickCaptcha(ctx context.Context, req *api.ClickCaptchaReq) (res *api.ClickCaptchaRes, err error) {
	result, err := captcha.GenerateClick(ctx)
	if err != nil {
		return nil, err
	}
	return &api.ClickCaptchaRes{
		Id:     result.Id,
		Text:   result.Text,
		Base64: result.Base64,
		Width:  result.Width,
		Height: result.Height,
	}, nil
}

// CheckClickCaptcha 校验点选验证码
func (c *ControllerV1) CheckClickCaptcha(ctx context.Context, req *api.CheckClickCaptchaReq) (res *api.CheckClickCaptchaRes, err error) {
	if !captcha.VerifyClick(ctx, req.Id, req.Info) {
		return nil, gerror.New("验证失败，请重试")
	}
	return &api.CheckClickCaptchaRes{}, nil
}
