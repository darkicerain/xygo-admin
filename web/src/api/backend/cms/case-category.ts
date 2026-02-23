/**
 * CMS 案例分类 API
 * @module api/backend/cms/case-category
 */
import { adminRequest } from '@/utils/http'

/** 获取案例分类列表（树形） */
export async function fetchCaseCategoryList(params?: any) {
  const res = await adminRequest.post<{ list?: any[] }>({
    url: '/cms/caseCategory/list',
    params
  })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 保存案例分类（新增/编辑） */
export function fetchSaveCaseCategory(params: any) {
  return adminRequest.post<{ id: number }>({
    url: '/cms/caseCategory/save',
    params
  })
}

/** 删除案例分类 */
export function fetchDeleteCaseCategory(id: number) {
  return adminRequest.post({
    url: '/cms/caseCategory/delete',
    params: { id }
  })
}
