// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminUserRole is the golang structure for table admin_user_role.
type AdminUserRole struct {
	UserId uint64 `json:"userId" orm:"user_id" description:"管理员ID"` // 管理员ID
	RoleId uint64 `json:"roleId" orm:"role_id" description:"角色ID"`  // 角色ID
}
