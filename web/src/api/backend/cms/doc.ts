/**
 * CMS 文档内容 API
 * @module api/backend/cms/doc
 */
import { adminRequest } from '@/utils/http'

/** 获取文档列表（分页） */
export function fetchDocList(params: any) {
  return adminRequest.post<any>({
    url: '/cms/doc/list',
    params
  })
}

/** 获取文档详情 */
export function fetchDocDetail(id: number) {
  return adminRequest.get<any>({
    url: '/cms/doc/detail',
    params: { id }
  })
}

/** 保存文档（新增/编辑） */
export function fetchSaveDoc(params: any) {
  return adminRequest.post<{ id: number }>({
    url: '/cms/doc/save',
    params
  })
}

/** 删除文档 */
export function fetchDeleteDoc(id: number) {
  return adminRequest.post({
    url: '/cms/doc/delete',
    params: { id }
  })
}
