/**
 * 角色管理 API
 * @module api/backend/system/role
 */
import { adminRequest } from '@/utils/http'

/**
 * 获取角色列表
 */
export function fetchGetRoleList(params: any) {
  return adminRequest.get<{ 
    list: Api.SystemManage.RoleListItem[]
    page: number
    pageSize: number
    total: number 
  }>({
    url: '/role/list',
    params
  })
}

/**
 * 保存角色（新增/编辑）
 */
export function fetchSaveRole(params: any) {
  return adminRequest.post<{ id: number }>({
    url: '/role/save',
    params
  })
}

/**
 * 删除角色
 */
export function fetchDeleteRole(id: number) {
  return adminRequest.post({
    url: '/role/delete',
    params: { id }
  })
}

/**
 * 获取角色已绑定的菜单ID列表
 */
export function fetchRoleMenuIds(roleId: number) {
  return adminRequest.get<{ menuIds: number[] }>({
    url: '/role/menuIds',
    params: { roleId }
  })
}

/**
 * 为角色绑定菜单
 */
export function fetchRoleBindMenus(data: { roleId: number; menuIds: number[] }) {
  return adminRequest.post({
    url: '/role/bindMenus',
    params: data
  })
}

/**
 * 获取数据范围选项
 */
export function fetchGetDataScopeSelect() {
  return adminRequest.get<{ list: any[] }>({
    url: '/role/dataScopeSelect'
  })
}

/**
 * 编辑角色数据权限
 */
export function fetchEditDataScope(data: {
  id: number
  dataScope: number
  customDepts?: number[]
}) {
  return adminRequest.post({
    url: '/role/dataScopeEdit',
    params: data
  })
}

/**
 * 获取角色可配置的资源列表（基于菜单权限）
 */
export function fetchRoleAvailableResources(roleId: number) {
  return adminRequest.get<{ list: Array<{ code: string; label: string }> }>({
    url: '/role/availableResources',
    params: { roleId }
  })
}
