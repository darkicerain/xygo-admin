// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/encoding/gjson"
	"github.com/gogf/gf/v2/frame/g"
)

// SysGenCodes is the golang structure of table xy_sys_gen_codes for DAO operations like Where/Data.
type SysGenCodes struct {
	g.Meta       `orm:"table:xy_sys_gen_codes, do:true"`
	Id           any         // 主键
	GenType      any         // 生成类型:10=普通列表,11=树表
	DbName       any         // 数据库名
	TableName    any         // 数据表名
	TableComment any         // 表注释(菜单名)
	VarName      any         // 实体名(PascalCase)
	Options      *gjson.Json // 生成选项(JSON)
	Status       any         // 状态:1=已生成,2=未生成
	CreatedAt    any         // 创建时间戳
	UpdatedAt    any         // 更新时间戳
}
