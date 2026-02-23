package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// PostListReq 岗位列表请求
type PostListReq struct {
	g.Meta `path:"/admin/post/list" method:"get" tags:"AdminPost" summary:"岗位列表"`
	adminin.PostListInp
}

// PostListRes 岗位列表响应
type PostListRes struct {
	adminin.PostListModel
}

// PostDetailReq 岗位详情请求
type PostDetailReq struct {
	g.Meta `path:"/admin/post/detail" method:"get" tags:"AdminPost" summary:"岗位详情"`
	adminin.PostDetailInp
}

// PostDetailRes 岗位详情响应
type PostDetailRes struct {
	adminin.PostListItem
}

// PostSaveReq 岗位保存（新增/编辑）请求
type PostSaveReq struct {
	g.Meta `path:"/admin/post/save" method:"post" tags:"AdminPost" summary:"岗位保存"`
	adminin.PostSaveInp
}

// PostSaveRes 岗位保存响应
type PostSaveRes struct {
	Id uint `json:"id" dc:"岗位ID"`
}

// PostDeleteReq 岗位删除请求
type PostDeleteReq struct {
	g.Meta `path:"/admin/post/delete" method:"post" tags:"AdminPost" summary:"岗位删除"`
	adminin.PostDeleteInp
}

// PostDeleteRes 岗位删除响应
type PostDeleteRes struct{}
