// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminUserRole is the golang structure of table xy_admin_user_role for DAO operations like Where/Data.
type AdminUserRole struct {
	g.Meta `orm:"table:xy_admin_user_role, do:true"`
	UserId any // 管理员ID
	RoleId any // 角色ID
}
