// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// DemoArticle is the golang structure of table xy_demo_article for DAO operations like Where/Data.
type DemoArticle struct {
	g.Meta     `orm:"table:xy_demo_article, do:true"`
	Id         any // 主键
	CategoryId any // 分类ID
	Title      any // 标题
	Cover      any // 封面图
	Summary    any // 摘要
	Content    any // 内容
	Author     any // 作者
	Views      any // 浏览量
	Sort       any // 排序
	Status     any // 状态:1=启用,0=禁用
	CreatedAt  any // 创建时间
	UpdatedAt  any // 更新时间
}
