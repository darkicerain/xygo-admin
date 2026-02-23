// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// MemberNotice is the golang structure of table xy_member_notice for DAO operations like Where/Data.
type MemberNotice struct {
	g.Meta    `orm:"table:xy_member_notice, do:true"`
	Id        any //
	Title     any // 通知标题
	Content   any // 通知内容
	Type      any // 通知类型:system=系统通知,announce=公告,feature=功能更新,maintain=维护通知
	Target    any // 目标:all=全部会员,group=指定分组
	TargetId  any // 目标分组ID（target=group时有效）
	Sender    any // 发送者
	Status    any // 状态:0=草稿,1=已发布
	CreatedAt any // 创建时间
}
