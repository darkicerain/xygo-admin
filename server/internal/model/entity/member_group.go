// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// MemberGroup is the golang structure for table member_group.
type MemberGroup struct {
	Id        uint64 `json:"id"        orm:"id"         description:"分组ID"`              // 分组ID
	Name      string `json:"name"      orm:"name"       description:"分组名称"`              // 分组名称
	Rules     string `json:"rules"     orm:"rules"      description:"权限规则（菜单ID列表，逗号分隔）"` // 权限规则（菜单ID列表，逗号分隔）
	Status    int    `json:"status"    orm:"status"     description:"状态：0=禁用 1=正常"`      // 状态：0=禁用 1=正常
	Sort      int    `json:"sort"      orm:"sort"       description:"排序"`                // 排序
	Remark    string `json:"remark"    orm:"remark"     description:"备注"`                // 备注
	CreatedAt uint64 `json:"createdAt" orm:"created_at" description:"创建时间"`              // 创建时间
	UpdatedAt uint64 `json:"updatedAt" orm:"updated_at" description:"更新时间"`              // 更新时间
}
