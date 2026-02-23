/**
 * 会员通知管理 API
 */
import { adminRequest } from '@/utils/http'

/** 列表 */
export function fetchMemberNoticeList(params: any) {
  return adminRequest.get<Record<string, any>>({
    url: '/member-notice/list',
    params
  })
}

/** 详情 */
export function fetchMemberNoticeView(id: number) {
  return adminRequest.get<any>({
    url: '/member-notice/view',
    params: { id }
  })
}

/** 保存(新增/编辑) */
export function fetchMemberNoticeEdit(params: any) {
  return adminRequest.post<any>({
    url: '/member-notice/edit',
    params
  })
}

/** 删除 */
export function fetchMemberNoticeDelete(id: number) {
  return adminRequest.post<any>({
    url: '/member-notice/delete',
    params: { id }
  })
}

/** 导出 */
export function fetchMemberNoticeExport(params?: any) {
  return adminRequest.get<any>({
    url: '/member-notice/export',
    params,
    responseType: 'blob'
  })
}
