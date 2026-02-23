// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// DemoCategory is the golang structure for table demo_category.
type DemoCategory struct {
	Id        uint64 `json:"id"        orm:"id"         description:"主键"`           // 主键
	ParentId  uint64 `json:"parentId"  orm:"parent_id"  description:"父级ID"`         // 父级ID
	Name      string `json:"name"      orm:"name"       description:"分类名称"`         // 分类名称
	Icon      string `json:"icon"      orm:"icon"       description:"图标"`           // 图标
	Sort      int    `json:"sort"      orm:"sort"       description:"排序"`           // 排序
	Status    int    `json:"status"    orm:"status"     description:"状态:1=启用,0=禁用"` // 状态:1=启用,0=禁用
	Remark    string `json:"remark"    orm:"remark"     description:"备注"`           // 备注
	CreatedAt uint64 `json:"createdAt" orm:"created_at" description:"创建时间"`         // 创建时间
	UpdatedAt uint64 `json:"updatedAt" orm:"updated_at" description:"更新时间"`         // 更新时间
}
