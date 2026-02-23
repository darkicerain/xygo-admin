/**
 * 前台案例中心 API
 * @module api/frontend/case
 */
import { siteRequest } from '@/utils/http'

/** 获取案例分类树 */
export async function fetchCaseCategoryTree() {
  const res = await siteRequest.get<{ list?: any[] }>({
    url: '/case/categoryTree'
  })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 获取案例列表 */
export function fetchCaseListBySite(params?: { categoryId?: number; page?: number; pageSize?: number }) {
  return siteRequest.get<any>({
    url: '/case/list',
    params
  })
}

/** 获取案例详情 */
export function fetchCaseDetailBySite(id: number) {
  return siteRequest.get<any>({
    url: '/case/detail',
    params: { id }
  })
}
