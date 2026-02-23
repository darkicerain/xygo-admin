/**
 * 前台社区公开 API（无需登录）
 */
import { siteRequest } from '@/utils/http'

/** 社区分类列表 */
export async function fetchCommunityCategoryList() {
  const res = await siteRequest.get<{ list?: any[] }>({ url: '/community/categoryList' })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 帖子列表 */
export function fetchCommunityPostList(params?: any) {
  return siteRequest.get<any>({ url: '/community/postList', params })
}

/** 帖子详情 */
export function fetchCommunityPostDetail(id: number) {
  return siteRequest.get<any>({ url: '/community/postDetail', params: { id } })
}

/** 回复列表 */
export function fetchCommunityReplyList(params: { postId: number; page?: number; pageSize?: number }) {
  return siteRequest.get<any>({ url: '/community/replyList', params })
}

/** 热门标签 */
export async function fetchCommunityHotTags() {
  const res = await siteRequest.get<{ list?: any[] }>({ url: '/community/hotTags' })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 待解答帖子 */
export async function fetchCommunityWaitingPosts() {
  const res = await siteRequest.get<{ list?: any[] }>({ url: '/community/waitingPosts' })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}

/** 全文搜索 */
export function fetchCommunitySearch(params: { keyword: string; page?: number; pageSize?: number }) {
  return siteRequest.get<{ list: any[]; total: number }>({ url: '/community/search', params })
}

/** 热门搜索词 */
export async function fetchCommunityHotSearchWords() {
  const res = await siteRequest.get<{ list?: any[] }>({ url: '/community/hotSearchWords' })
  const list = (res as any)?.list ?? res
  return (Array.isArray(list) ? list : []) as any[]
}
