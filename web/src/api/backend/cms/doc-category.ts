/**
 * CMS 文档分类 API
 * @module api/backend/cms/doc-category
 */
import { adminRequest } from '@/utils/http'

/** 获取文档分类列表（树形） */
export async function fetchDocCategoryList(params?: any) {
  const res = await adminRequest.post<{ list?: any[] }>({
    url: '/cms/docCategory/list',
    params
  })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 保存文档分类（新增/编辑） */
export function fetchSaveDocCategory(params: any) {
  return adminRequest.post<{ id: number }>({
    url: '/cms/docCategory/save',
    params
  })
}

/** 删除文档分类 */
export function fetchDeleteDocCategory(id: number) {
  return adminRequest.post({
    url: '/cms/docCategory/delete',
    params: { id }
  })
}
