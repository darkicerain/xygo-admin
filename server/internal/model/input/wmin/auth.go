package wmin

// WxLoginInput 微信小游戏登录输入
type WxLoginInput struct {
	Code string `json:"code" v:"required#请提供微信登录code"`
}

// WxLoginOutput 微信小游戏登录输出
type WxLoginOutput struct {
	Token     string `json:"token"`
	ExpiresIn int64  `json:"expiresIn"`
	IsNew     bool   `json:"isNew"`
}
