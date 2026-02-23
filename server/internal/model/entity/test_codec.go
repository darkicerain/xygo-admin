// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

import (
	"github.com/gogf/gf/v2/os/gtime"
)

// TestCodec is the golang structure for table test_codec.
type TestCodec struct {
	Id         uint64      `json:"id"         orm:"id"          description:"主键"`           // 主键
	Status     int         `json:"status"     orm:"status"      description:"状态:0=关闭,1=开启"` // 状态:0=关闭,1=开启
	CreateTime *gtime.Time `json:"createTime" orm:"create_time" description:""`             //
}
