/**
 * 业务状态码（与后端 consts/code.go 保持一致）
 * - success:            gcode.CodeOK          -> 0
 * - error:              gcode.CodeNil         -> -1（通用失败）
 * - unauthorized:       gcode.CodeNotAuthorized -> 61（未登录/登录失效）
 *
 * 其余保留 HTTP 常见状态，仅用于兜底参考，不代表后端实际业务码。
 */
export enum ApiStatus {
  success = 0,
  error = -1,
  unauthorized = 61,

  // 自定义业务码（与后端 consts/code.go 对齐）
  kickedOut = 10010, // 被踢下线（SSO单点登录/管理员强制下线）

  // 下列为 HTTP 参考值（未与后端业务码强绑定）
  forbidden = 403,
  notFound = 404,
  methodNotAllowed = 405,
  requestTimeout = 408,
  internalServerError = 500,
  notImplemented = 501,
  badGateway = 502,
  serviceUnavailable = 503,
  gatewayTimeout = 504,
  httpVersionNotSupported = 505
}
