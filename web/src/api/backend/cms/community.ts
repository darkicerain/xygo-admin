/**
 * 后台社区管理 API
 */
import { adminRequest } from '@/utils/http'

/** 分类列表 */
export async function fetchCommunityCategoryList(params?: any) {
  const res = await adminRequest.post<{ list?: any[] }>({ url: '/cms/community/categoryList', params })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 保存分类 */
export function fetchSaveCommunityCategory(params: any) {
  return adminRequest.post<{ id: number }>({ url: '/cms/community/categorySave', params })
}

/** 删除分类 */
export function fetchDeleteCommunityCategory(id: number) {
  return adminRequest.post({ url: '/cms/community/categoryDelete', params: { id } })
}

/** 帖子列表 */
export function fetchCommunityPostList(params: any) {
  return adminRequest.post<any>({ url: '/cms/community/postList', params })
}

/** 帖子详情 */
export function fetchCommunityPostDetail(id: number) {
  return adminRequest.get<any>({ url: '/cms/community/postDetail', params: { id } })
}

/** 编辑帖子（置顶/精华/状态） */
export function fetchUpdateCommunityPost(params: any) {
  return adminRequest.post({ url: '/cms/community/postUpdate', params })
}

/** 删除帖子 */
export function fetchDeleteCommunityPost(id: number) {
  return adminRequest.post({ url: '/cms/community/postDelete', params: { id } })
}

/** 回复列表 */
export function fetchCommunityReplyList(params: any) {
  return adminRequest.post<any>({ url: '/cms/community/replyList', params })
}

/** 删除回复 */
export function fetchDeleteCommunityReply(id: number) {
  return adminRequest.post({ url: '/cms/community/replyDelete', params: { id } })
}
