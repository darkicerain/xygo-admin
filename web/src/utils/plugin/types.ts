/**
 * 插件系统类型定义
 * @module utils/plugin/types
 */

/**
 * 插件状态
 */
export type PluginStatus = 'installed' | 'enabled' | 'disabled' | 'uninstalled'

/**
 * 菜单项
 */
export interface PluginMenuItem {
  title: string
  path: string
  icon?: string
  sort?: number
  children?: PluginMenuItem[]
}

/**
 * 权限项
 */
export interface PluginPermission {
  name: string
  title: string
}

/**
 * 插件信息
 */
export interface PluginInfo {
  id: string
  name: string
  version: string
  description?: string
  author?: string
  homepage?: string
  license?: string
  requires?: {
    xygo?: string
  }
  dependencies?: string[]
  menus?: PluginMenuItem[]
  permissions?: PluginPermission[]
  status?: PluginStatus
}

/**
 * 插件列表响应
 */
export interface PluginListResponse {
  list: PluginInfo[]
}
