// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// Captcha is the golang structure of table xy_captcha for DAO operations like Where/Data.
type Captcha struct {
	g.Meta     `orm:"table:xy_captcha, do:true"`
	Id         any //
	Key        any // 验证码key（MD5）
	Code       any // 验证码code（MD5）
	Captcha    any // 验证码数据（JSON，包含点位坐标等）
	CreateTime any // 创建时间（unix秒）
	ExpireTime any // 过期时间（unix秒）
}
