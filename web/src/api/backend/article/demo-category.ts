/**
 * 示例分类管理 API
 */
import { adminRequest } from '@/utils/http'

/** 列表 */
export function fetchDemoCategoryList(params: any) {
  return adminRequest.get<Record<string, any>>({
    url: '/demo-category/list',
    params
  })
}

/** 详情 */
export function fetchDemoCategoryView(id: number) {
  return adminRequest.get<any>({
    url: '/demo-category/view',
    params: { id }
  })
}

/** 保存(新增/编辑) */
export function fetchDemoCategoryEdit(params: any) {
  return adminRequest.post<any>({
    url: '/demo-category/edit',
    params
  })
}

/** 删除 */
export function fetchDemoCategoryDelete(id: number) {
  return adminRequest.post<any>({
    url: '/demo-category/delete',
    params: { id }
  })
}

/** 导出 */
export function fetchDemoCategoryExport(params?: any) {
  return adminRequest.get<any>({
    url: '/demo-category/export',
    params,
    responseType: 'blob'
  })
}
