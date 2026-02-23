// =================================================================================
// 会员模块 Logic 层注册
// =================================================================================

package member

import (
	"xygo/internal/service"
)

func init() {
	service.RegisterMemberAuth(NewMemberAuth())
	service.RegisterMemberUser(NewMemberUser())
	service.RegisterAdminMemberGroup(NewAdminMemberGroup())
	service.RegisterAdminMemberMenu(NewAdminMemberMenu())
	service.RegisterMemberCheckin(NewMemberCheckin())
	service.RegisterFrontendNotice(NewFrontendNotice())
}
