// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// TestOrder is the golang structure of table xy_test_order for DAO operations like Where/Data.
type TestOrder struct {
	g.Meta    `orm:"table:xy_test_order, do:true"`
	Id        any //
	MemberId  any // 卖家ID
	ApplyId   any // 买家ID
	Amount    any // 订单金额
	Status    any // 状态:0=待处理,1=已完成,2=已取消
	Memo      any // 备注
	CreatedAt any // 创建时间
	UpdatedAt any // 更新时间
}
