// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// MemberOauth is the golang structure for table member_oauth.
type MemberOauth struct {
	Id         uint64 `json:"id"         orm:"id"          description:"PK"`                                        // PK
	MemberId   uint64 `json:"memberId"   orm:"member_id"   description:"member FK"`                                 // member FK
	Platform   string `json:"platform"   orm:"platform"    description:"platform: wechat_mapp/wechat_oa/qq/alipay"` // platform: wechat_mapp/wechat_oa/qq/alipay
	Openid     string `json:"openid"     orm:"openid"      description:"openid"`                                    // openid
	Unionid    string `json:"unionid"    orm:"unionid"     description:"unionid"`                                   // unionid
	SessionKey string `json:"sessionKey" orm:"session_key" description:"session_key"`                               // session_key
	Nickname   string `json:"nickname"   orm:"nickname"    description:"nickname"`                                  // nickname
	Avatar     string `json:"avatar"     orm:"avatar"      description:"avatar url"`                                // avatar url
	Extra      string `json:"extra"      orm:"extra"       description:"extra json"`                                // extra json
	CreatedAt  uint64 `json:"createdAt"  orm:"created_at"  description:"created time"`                              // created time
	UpdatedAt  uint64 `json:"updatedAt"  orm:"updated_at"  description:"updated time"`                              // updated time
	DeletedAt  uint64 `json:"deletedAt"  orm:"deleted_at"  description:"deleted time"`                              // deleted time
}
