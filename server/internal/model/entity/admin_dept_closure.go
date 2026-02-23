// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminDeptClosure is the golang structure for table admin_dept_closure.
type AdminDeptClosure struct {
	Id         uint64 `json:"id"         orm:"id"         description:"ID"`     // ID
	Ancestor   uint64 `json:"ancestor"   orm:"ancestor"   description:"祖先部门ID"` // 祖先部门ID
	Descendant uint64 `json:"descendant" orm:"descendant" description:"后代部门ID"` // 后代部门ID
	Level      int    `json:"level"      orm:"level"      description:"层级深度"`   // 层级深度
}
