// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminPost is the golang structure of table xy_admin_post for DAO operations like Where/Data.
type AdminPost struct {
	g.Meta     `orm:"table:xy_admin_post, do:true"`
	Id         any // 岗位ID
	Code       any // 岗位编码
	Name       any // 岗位名称
	Sort       any // 排序(越小越靠前)
	Status     any // 状态:0=禁用,1=启用
	Remark     any // 备注
	CreatedBy  any // 创建人ID
	UpdatedBy  any // 更新人ID
	CreateTime any // 创建时间
	UpdateTime any // 更新时间
}
