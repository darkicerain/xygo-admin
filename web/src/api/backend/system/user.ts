/**
 * 用户管理 API
 * @module api/backend/system/user
 */
import { adminRequest } from '@/utils/http'

/**
 * 获取用户列表
 */
export function fetchGetUserList(params: any) {
  return adminRequest.get<{ 
    list: Api.SystemManage.UserListItem[]
    page: number
    pageSize: number
    total: number 
  }>({
    url: '/user/list',
    params
  })
}

/**
 * 获取用户详情（编辑用，未脱敏）
 */
export function fetchGetUserDetail(id: number) {
  return adminRequest.get<any>({
    url: '/user/detail',
    params: { id }
  })
}

/**
 * 保存用户（新增/编辑）
 */
export function fetchSaveUser(params: any) {
  return adminRequest.post<{ id: number }>({
    url: '/user/save',
    params
  })
}

/**
 * 删除用户
 */
export function fetchDeleteUser(id: number) {
  return adminRequest.post({
    url: '/user/delete',
    params: { id }
  })
}

/**
 * 强制用户下线
 */
export function fetchKickUser(id: number) {
  return adminRequest.post({
    url: '/user/kick',
    params: { id }
  })
}
