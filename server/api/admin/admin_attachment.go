package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 附件列表 =====================

type AttachmentListReq struct {
	g.Meta `path:"/admin/attachment/list" method:"get" tags:"AdminAttachment" summary:"附件列表"`
	adminin.AttachmentListInp
}

type AttachmentListRes struct {
	*adminin.AttachmentListModel
}

// ===================== 删除附件 =====================

type AttachmentDeleteReq struct {
	g.Meta `path:"/admin/attachment/delete" method:"post" tags:"AdminAttachment" summary:"删除附件"`
	adminin.AttachmentDeleteInp
}

type AttachmentDeleteRes struct{}
