/**
 * 前台文档公开 API（无需登录）
 * @module api/frontend/doc
 */
import { siteRequest } from '@/utils/http'

/** 获取文档分类树 */
export async function fetchDocCategoryTree() {
  const res = await siteRequest.get<{ list?: any[] }>({
    url: '/doc/categoryTree'
  })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 按分类获取文档列表 */
export async function fetchDocListByCategory(categoryId?: number) {
  const res = await siteRequest.get<{ list?: any[] }>({
    url: '/doc/list',
    params: categoryId ? { categoryId } : {}
  })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 按 slug 获取文档详情 */
export function fetchDocDetailBySlug(slug: string) {
  return siteRequest.get<any>({
    url: '/doc/detail',
    params: { slug }
  })
}

/** 全文搜索文档 */
export async function fetchDocSearch(keyword: string) {
  const res = await siteRequest.get<{ list?: any[] }>({
    url: '/doc/search',
    params: { keyword }
  })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}
