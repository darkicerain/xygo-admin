/**
 * 前台会员通知 API
 */
import { memberRequest } from '@/utils/http'

/** 通知项 */
export interface NoticeItem {
  id: number
  title: string
  content: string
  type: string
  sender: string
  isRead: boolean
  createdAt: string
}

/** 通知列表响应 */
export interface NoticeListResult {
  list: NoticeItem[]
  page: number
  pageSize: number
  total: number
  unread: number
}

/** 获取通知列表 */
export function getNoticeList(params?: { page?: number; pageSize?: number }) {
  return memberRequest.get<NoticeListResult>({
    url: '/user/notice/list',
    params
  })
}

/** 标记通知已读 */
export function markNoticeRead(noticeId: number) {
  return memberRequest.post<void>({
    url: '/user/notice/read',
    data: { noticeId }
  })
}

/** 全部已读 */
export function markAllNoticeRead() {
  return memberRequest.post<void>({
    url: '/user/notice/read-all'
  })
}
