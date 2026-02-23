// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminNotice is the golang structure of table xy_admin_notice for DAO operations like Where/Data.
type AdminNotice struct {
	g.Meta     `orm:"table:xy_admin_notice, do:true"`
	Id         any // 主键
	Title      any // 标题
	Type       any // 类型:1=通知,2=公告,3=私信
	Content    any // 内容(HTML)
	Tag        any // 标签(info/success/warning/danger)
	SenderId   any // 发送人ID(0=系统)
	ReceiverId any // 接收人ID(0=全员)
	Status     any // 状态:1=正常,2=关闭
	Sort       any // 排序
	Remark     any // 备注
	ReadCount  any // 已读人数
	CreatedAt  any // 创建时间
	UpdatedAt  any // 更新时间
}
