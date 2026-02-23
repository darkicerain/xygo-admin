/**
 * CMS 案例内容 API
 * @module api/backend/cms/case
 */
import { adminRequest } from '@/utils/http'

/** 获取案例列表（分页） */
export function fetchCaseList(params: any) {
  return adminRequest.post<any>({
    url: '/cms/case/list',
    params
  })
}

/** 获取案例详情 */
export function fetchCaseDetail(id: number) {
  return adminRequest.get<any>({
    url: '/cms/case/detail',
    params: { id }
  })
}

/** 保存案例（新增/编辑） */
export function fetchSaveCase(params: any) {
  return adminRequest.post<{ id: number }>({
    url: '/cms/case/save',
    params
  })
}

/** 删除案例 */
export function fetchDeleteCase(id: number) {
  return adminRequest.post({
    url: '/cms/case/delete',
    params: { id }
  })
}
