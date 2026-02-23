// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package do

import (
	"github.com/gogf/gf/v2/frame/g"
)

// AdminUser is the golang structure of table xy_admin_user for DAO operations like Where/Data.
type AdminUser struct {
	g.Meta      `orm:"table:xy_admin_user, do:true"`
	Id          any // 管理员ID
	Username    any // 登录账号
	Nickname    any // 昵称
	RealName    any // 真实姓名
	Password    any // 密码哈希
	Gender      any // 性别0保密 1男 2女
	Salt        any // 密码盐
	Mobile      any // 手机号
	Address     any // 地址
	Remark      any // 个人简介
	Email       any // 邮箱
	Avatar      any // 头像
	DeptId      any // 部门ID
	Pid         any // 上级用户ID（直属上级）
	IsSuper     any // 是否超管:0=否,1=是
	Status      any // 状态:0=禁用,1=启用
	LastLoginAt any // last login time
	LastLoginIp any // 最后登录IP
	CreatedBy   any // 创建人ID
	UpdatedBy   any // 更新人ID
	CreateTime  any // 创建时间
	UpdateTime  any // 更新时间
}
