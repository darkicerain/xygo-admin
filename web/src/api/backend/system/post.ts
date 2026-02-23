/**
 * 岗位管理 API
 * @module api/backend/system/post
 */
import { adminRequest } from '@/utils/http'

/**
 * 获取岗位列表
 */
export function fetchGetPostList(params: any) {
  return adminRequest.get<{ 
    list: any[]
    page: number
    pageSize: number
    total: number 
  }>({
    url: '/post/list',
    params
  })
}

/**
 * 保存岗位（新增/编辑）
 */
export function fetchSavePost(params: any) {
  return adminRequest.post<{ id: number }>({
    url: '/post/save',
    params
  })
}

/**
 * 删除岗位
 */
export function fetchDeletePost(id: number) {
  return adminRequest.post({
    url: '/post/delete',
    params: { id }
  })
}
