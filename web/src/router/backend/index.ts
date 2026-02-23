/**
 * 后台路由模块汇总
 * 
 * BuildAdmin 风格：所有后台路由统一从此处导出
 */
import { AppRouteRecord } from '@/types/router'
import { dashboardRoutes } from './dashboard'
import { templateRoutes } from './template'
import { widgetsRoutes } from './widgets'
import { examplesRoutes } from './examples'
import { systemRoutes } from './system'
import { articleRoutes } from './article'
import { resultRoutes } from './result'
import { exceptionRoutes } from './exception'
import { safeguardRoutes } from './safeguard'
import { developRoutes } from './develop'
import { helpRoutes } from './help'

/**
 * 后台路由模块列表
 */
export const backendRoutes: AppRouteRecord[] = [
  dashboardRoutes,
  templateRoutes,
  widgetsRoutes,
  examplesRoutes,
  systemRoutes,
  articleRoutes,
  resultRoutes,
  exceptionRoutes,
  safeguardRoutes,
  developRoutes,
  ...helpRoutes
]

// 兼容旧的导出名称
export const routeModules = backendRoutes

// 导出各模块路由
export {
  dashboardRoutes,
  templateRoutes,
  widgetsRoutes,
  examplesRoutes,
  systemRoutes,
  articleRoutes,
  resultRoutes,
  exceptionRoutes,
  safeguardRoutes,
  developRoutes,
  helpRoutes
}
