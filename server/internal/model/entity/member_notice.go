// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// MemberNotice is the golang structure for table member_notice.
type MemberNotice struct {
	Id        uint64 `json:"id"        orm:"id"         description:""`                                                        //
	Title     string `json:"title"     orm:"title"      description:"通知标题"`                                                    // 通知标题
	Content   string `json:"content"   orm:"content"    description:"通知内容"`                                                    // 通知内容
	Type      string `json:"type"      orm:"type"       description:"通知类型:system=系统通知,announce=公告,feature=功能更新,maintain=维护通知"` // 通知类型:system=系统通知,announce=公告,feature=功能更新,maintain=维护通知
	Target    string `json:"target"    orm:"target"     description:"目标:all=全部会员,group=指定分组"`                                  // 目标:all=全部会员,group=指定分组
	TargetId  uint64 `json:"targetId"  orm:"target_id"  description:"目标分组ID（target=group时有效）"`                                 // 目标分组ID（target=group时有效）
	Sender    string `json:"sender"    orm:"sender"     description:"发送者"`                                                     // 发送者
	Status    int    `json:"status"    orm:"status"     description:"状态:0=草稿,1=已发布"`                                           // 状态:0=草稿,1=已发布
	CreatedAt uint64 `json:"createdAt" orm:"created_at" description:"创建时间"`                                                    // 创建时间
}
