package consts

// 通用业务错误消息（可在中间件/服务层统一使用）
const (
	// ErrorORM 数据库执行异常（对外提示用友好文案）
	ErrorORM     = "数据库执行异常"
	ErrorNotData = "数据不存在"
)

// 上下文 Key
const (
	ContextKey = "XYGoContext" // 自定义上下文对象的 Key
)

// 缓存 Key 前缀
const (
	CachePrefix = "xygo" // 缓存 Key 前缀
)
