// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// CmsCase is the golang structure of table xy_cms_case for DAO operations like Where/Data.
type CmsCase struct {
	g.Meta     `orm:"table:xy_cms_case, do:true"`
	Id         any // 案例ID
	CategoryId any // 分类ID
	Title      any // 案例标题
	Cover      any // 封面图
	Summary    any // 摘要
	Content    any // 案例详情(Markdown)
	Link       any // 外部链接
	Views      any // 浏览量
	Sort       any // 排序(越大越靠前)
	Status     any // 状态:1=已发布,2=草稿,3=下架
	IsTop      any // 是否置顶:0=否,1=是
	Tags       any // 标签(JSON数组)
	CreatedBy  any // 创建人ID
	UpdatedBy  any // 更新人ID
	CreatedAt  any // 创建时间
	UpdatedAt  any // 更新时间
	DeletedAt  any // 删除时间(软删除)
}
