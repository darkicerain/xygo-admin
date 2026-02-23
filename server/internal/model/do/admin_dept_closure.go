// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminDeptClosure is the golang structure of table xy_admin_dept_closure for DAO operations like Where/Data.
type AdminDeptClosure struct {
	g.Meta     `orm:"table:xy_admin_dept_closure, do:true"`
	Id         any // ID
	Ancestor   any // 祖先部门ID
	Descendant any // 后代部门ID
	Level      any // 层级深度
}
