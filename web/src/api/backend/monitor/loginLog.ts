/**
 * 后台登录日志 API
 */
import { adminRequest } from '@/utils/http'

/** 登录日志列表项 */
export interface LoginLogItem {
  id: number
  userId: number
  username: string
  ip: string
  location: string
  browser: string
  os: string
  status: number
  message: string
  createdAt: string
}

/** 登录日志列表查询参数 */
export interface LoginLogListParams {
  page?: number
  pageSize?: number
  username?: string
  ip?: string
  status?: number
  dateRange?: string[]
}

/** 登录日志列表响应 */
export interface LoginLogListResult {
  list: LoginLogItem[]
  total: number
  page: number
  pageSize: number
}

/**
 * 获取登录日志列表
 */
export function getLoginLogList(params: LoginLogListParams) {
  return adminRequest.post<LoginLogListResult>({
    url: '/log/login/list',
    data: params
  })
}

/**
 * 删除登录日志
 */
export function deleteLoginLog(ids: number[]) {
  return adminRequest.post<void>({
    url: '/log/login/delete',
    data: { ids }
  })
}

/**
 * 清空登录日志
 */
export function clearLoginLog() {
  return adminRequest.post<void>({
    url: '/log/login/clear'
  })
}
