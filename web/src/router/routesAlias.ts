/**
 * 后台路由基础路径（对齐 BuildAdmin 的 adminBaseRoutePath）
 * 所有后台管理页面都在此前缀下，前后台路由靠路径前缀严格隔离
 */
export const ADMIN_BASE_PATH = '/admin'

/**
 * 公共路由别名
 * 存放系统级公共路由路径，如布局容器、登录页等
 */
export enum RoutesAlias {
  Layout = '/index/index', // 布局容器
  Login = '/admin/login' // 后台登录页
}
