// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
	"github.com/gogf/gf/v2/os/gtime"
)

// TestCodec is the golang structure of table xy_test_codec for DAO operations like Where/Data.
type TestCodec struct {
	g.Meta     `orm:"table:xy_test_codec, do:true"`
	Id         any         // 主键
	Status     any         // 状态:0=关闭,1=开启
	CreateTime *gtime.Time //
}
