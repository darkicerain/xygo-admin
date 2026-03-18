// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// MemberOauth is the golang structure of table xy_member_oauth for DAO operations like Where/Data.
type MemberOauth struct {
	g.Meta     `orm:"table:xy_member_oauth, do:true"`
	Id         any // PK
	MemberId   any // member FK
	Platform   any // platform: wechat_mapp/wechat_oa/qq/alipay
	Openid     any // openid
	Unionid    any // unionid
	SessionKey any // session_key
	Nickname   any // nickname
	Avatar     any // avatar url
	Extra      any // extra json
	CreatedAt  any // created time
	UpdatedAt  any // updated time
	DeletedAt  any // deleted time
}
