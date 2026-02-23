/**
 * 会员社区写入 API（需登录）
 */
import { memberRequest } from '@/utils/http'

/** 发帖/编辑帖子 */
export function fetchCommunityPostSave(params: any) {
  return memberRequest.post<{ id: number }>({ url: '/user/community/postSave', data: params })
}

/** 删除帖子 */
export function fetchCommunityPostDelete(id: number) {
  return memberRequest.post({ url: '/user/community/postDelete', data: { id } })
}

/** 发表回复 */
export function fetchCommunityReplySave(params: { postId: number; parentId?: number; content: string; captchaId: string; captchaInfo: string }) {
  return memberRequest.post<{ id: number }>({ url: '/user/community/replySave', data: params })
}

/** 删除回复 */
export function fetchCommunityReplyDelete(id: number) {
  return memberRequest.post({ url: '/user/community/replyDelete', data: { id } })
}

/** 点赞/取消点赞 */
export function fetchCommunityLike(params: { targetType: number; targetId: number }) {
  return memberRequest.post<{ isLiked: boolean }>({ url: '/user/community/like', data: params })
}

/** 采纳最佳回答 */
export function fetchCommunityAcceptReply(replyId: number) {
  return memberRequest.post({ url: '/user/community/acceptReply', data: { replyId } })
}

/** 收藏/取消收藏帖子 */
export function fetchCommunityCollect(postId: number) {
  return memberRequest.post<{ isCollected: boolean }>({ url: '/user/community/collect', data: { postId } })
}

/** 我的帖子列表 */
export function fetchMyPostList(params: { page?: number; pageSize?: number }) {
  return memberRequest.get<any>({ url: '/user/community/myPosts', params })
}

/** 我的回复列表 */
export function fetchMyReplyList(params: { page?: number; pageSize?: number }) {
  return memberRequest.get<any>({ url: '/user/community/myReplies', params })
}

/** 我的收藏列表 */
export function fetchMyCollectList(params: { page?: number; pageSize?: number }) {
  return memberRequest.get<any>({ url: '/user/community/myCollects', params })
}
