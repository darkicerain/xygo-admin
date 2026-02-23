// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// TestCode is the golang structure of table xy_test_code for DAO operations like Where/Data.
type TestCode struct {
	g.Meta   `orm:"table:xy_test_code, do:true"`
	Id       any // 主键
	Name     any // 名称
	MemberId any // 关联ID
}
