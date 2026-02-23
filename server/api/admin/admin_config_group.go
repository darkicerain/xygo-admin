package admin

import (
	"github.com/gogf/gf/v2/frame/g"
)

// ConfigGroupListReq 获取配置分组列表
type ConfigGroupListReq struct {
	g.Meta `path:"/admin/config/group/list" method:"get" tags:"AdminConfig" summary:"获取配置分组列表"`
}

type ConfigGroupItem struct {
	Group       string `json:"group"`
	GroupName   string `json:"groupName"`
	Icon        string `json:"icon"`
	Description string `json:"description"`
	Sort        int    `json:"sort"`
}

type ConfigGroupListRes struct {
	List []ConfigGroupItem `json:"list"`
}

// ConfigGroupSaveReq 保存配置分组（添加或编辑）
type ConfigGroupSaveReq struct {
	g.Meta      `path:"/admin/config/group/save" method:"post" tags:"AdminConfig" summary:"保存配置分组"`
	Group       string `json:"group" v:"required#分组标识必填"`
	GroupName   string `json:"groupName" v:"required#分组名称必填"`
	Icon        string `json:"icon"`
	Description string `json:"description"`
	Sort        int    `json:"sort"`
	IsEdit      bool   `json:"isEdit"` // 是否为编辑模式
}

type ConfigGroupSaveRes struct{}

// ConfigGroupDeleteReq 删除配置分组
type ConfigGroupDeleteReq struct {
	g.Meta `path:"/admin/config/group/delete" method:"post" tags:"AdminConfig" summary:"删除配置分组"`
	Group  string `json:"group" v:"required#分组标识必填"`
}

type ConfigGroupDeleteRes struct{}
