package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// DeptListReq 部门列表请求
type DeptListReq struct {
	g.Meta `path:"/admin/dept/list" method:"get" tags:"AdminDept" summary:"部门列表（树形）"`
	adminin.DeptListInp
}

// DeptListRes 部门列表响应
type DeptListRes struct {
	adminin.DeptListModel
}

// DeptDetailReq 部门详情请求
type DeptDetailReq struct {
	g.Meta `path:"/admin/dept/detail" method:"get" tags:"AdminDept" summary:"部门详情"`
	adminin.DeptDetailInp
}

// DeptDetailRes 部门详情响应
type DeptDetailRes struct {
	adminin.DeptListItem
}

// DeptSaveReq 部门保存（新增/编辑）请求
type DeptSaveReq struct {
	g.Meta `path:"/admin/dept/save" method:"post" tags:"AdminDept" summary:"部门保存"`
	adminin.DeptSaveInp
}

// DeptSaveRes 部门保存响应
type DeptSaveRes struct {
	Id uint `json:"id" dc:"部门ID"`
}

// DeptDeleteReq 部门删除请求
type DeptDeleteReq struct {
	g.Meta `path:"/admin/dept/delete" method:"post" tags:"AdminDept" summary:"部门删除"`
	adminin.DeptDeleteInp
}

// DeptDeleteRes 部门删除响应
type DeptDeleteRes struct{}
