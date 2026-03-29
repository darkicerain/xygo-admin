/**
 * 余额变动日志管理 API
 */
import { adminRequest } from '@/utils/http'

/** 列表 */
export function fetchMemberMoneyLogList(params: any) {
  return adminRequest.get<Record<string, any>>({
    url: '/member-money-log/list',
    params
  })
}

/** 详情 */
export function fetchMemberMoneyLogView(id: number) {
  return adminRequest.get<any>({
    url: '/member-money-log/view',
    params: { id }
  })
}

/** 保存(新增/编辑) */
export function fetchMemberMoneyLogEdit(params: any) {
  return adminRequest.post<any>({
    url: '/member-money-log/edit',
    params
  })
}

/** 删除 */
export function fetchMemberMoneyLogDelete(id: number) {
  return adminRequest.post<any>({
    url: '/member-money-log/delete',
    params: { id }
  })
}
