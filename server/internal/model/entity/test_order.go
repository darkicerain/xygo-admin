// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// TestOrder is the golang structure for table test_order.
type TestOrder struct {
	Id        uint64  `json:"id"        orm:"id"         description:""`                     //
	MemberId  uint64  `json:"memberId"  orm:"member_id"  description:"卖家ID"`                 // 卖家ID
	ApplyId   uint64  `json:"applyId"   orm:"apply_id"   description:"买家ID"`                 // 买家ID
	Amount    float64 `json:"amount"    orm:"amount"     description:"订单金额"`                 // 订单金额
	Status    int     `json:"status"    orm:"status"     description:"状态:0=待处理,1=已完成,2=已取消"` // 状态:0=待处理,1=已完成,2=已取消
	Memo      string  `json:"memo"      orm:"memo"       description:"备注"`                   // 备注
	CreatedAt uint64  `json:"createdAt" orm:"created_at" description:"创建时间"`                 // 创建时间
	UpdatedAt uint64  `json:"updatedAt" orm:"updated_at" description:"更新时间"`                 // 更新时间
}
