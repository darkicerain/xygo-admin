package model

// TenantAuthUser 租户管理员登录态（扩展预留，安装租户扩展后使用）
type TenantAuthUser struct {
	Id       uint64 `json:"id"       description:"管理员ID"`
	TenantId uint64 `json:"tenantId" description:"所属租户ID"`
	Username string `json:"username" description:"登录账号"`
	Nickname string `json:"nickname" description:"昵称"`
	Avatar   string `json:"avatar"   description:"头像"`
	Email    string `json:"email"    description:"邮箱"`
	Mobile   string `json:"mobile"   description:"手机号"`
	DeptId   uint64 `json:"deptId"   description:"部门ID"`
	RoleId   uint64 `json:"roleId"   description:"角色ID"`
	RoleKey  string `json:"roleKey"  description:"角色标识"`
	IsSuper  bool   `json:"isSuper"  description:"是否租户超管"`
}
