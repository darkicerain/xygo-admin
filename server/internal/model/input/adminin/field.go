package adminin

// ===================== 资源列表 =====================

// ResourceListModel 资源列表响应模型
type ResourceListModel struct {
	List []ResourceItem `json:"list" dc:"资源列表"`
}

// ResourceItem 资源项
type ResourceItem struct {
	Code  string `json:"code" dc:"资源编码（表名）"`
	Label string `json:"label" dc:"资源中文名"`
}
