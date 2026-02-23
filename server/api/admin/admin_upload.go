package admin

import (
	"github.com/gogf/gf/v2/frame/g"

	"xygo/internal/model/input/adminin"
)

// ===================== 文件上传 =====================

type UploadFileReq struct {
	g.Meta `path:"/admin/upload/file" method:"post" mime:"multipart/form-data" tags:"AdminUpload" summary:"上传文件"`
	adminin.UploadFileInp
}

type UploadFileRes struct {
	*adminin.UploadFileModel
}
