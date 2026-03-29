/**
 * 登录日志管理 API
 */
import { adminRequest } from '@/utils/http'

/** 列表 */
export function fetchMemberLoginLogList(params: any) {
  return adminRequest.get<Record<string, any>>({
    url: '/member-login-log/list',
    params
  })
}

/** 详情 */
export function fetchMemberLoginLogView(id: number) {
  return adminRequest.get<any>({
    url: '/member-login-log/view',
    params: { id }
  })
}

/** 删除 */
export function fetchMemberLoginLogDelete(id: number) {
  return adminRequest.post<any>({
    url: '/member-login-log/delete',
    params: { id }
  })
}
