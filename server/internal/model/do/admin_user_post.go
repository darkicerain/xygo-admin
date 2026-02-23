// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminUserPost is the golang structure of table xy_admin_user_post for DAO operations like Where/Data.
type AdminUserPost struct {
	g.Meta `orm:"table:xy_admin_user_post, do:true"`
	UserId any // 用户ID
	PostId any // 岗位ID
}
