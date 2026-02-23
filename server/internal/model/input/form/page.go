package form

// PageReq 通用分页请求
type PageReq struct {
	Page     int `p:"page"      d:"1"  v:"min:1#页码至少为1"             json:"page"`
	PageSize int `p:"pageSize"  d:"20" v:"min:1|max:100#每页数量范围为1-100" json:"pageSize"`
}

// PageRes 通用分页响应
type PageRes struct {
	Page     int `json:"page"     dc:"当前页码"`
	PageSize int `json:"pageSize" dc:"每页数量"`
	Total    int `json:"total"    dc:"总记录数"`
}
