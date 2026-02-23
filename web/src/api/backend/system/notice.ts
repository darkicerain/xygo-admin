/**
 * 通知消息 API
 */
import { adminRequest } from '@/utils/http'

export interface NoticeItem {
  id: number
  title: string
  type: number // 1=通知 2=公告 3=私信
  content?: string
  tag: string
  senderId: number
  senderName?: string
  receiverId: number
  status: number
  readCount: number
  createdAt: number
  isRead?: boolean
}

export interface MessageItem {
  id: number
  title: string
  type: number
  content: string
  tag: string
  isRead: boolean
  createdAt: number
}

export interface UnreadCountItem {
  type: number
  count: number
}

/** 通知列表（管理端） */
export function fetchNoticeList(params: any) {
  return adminRequest.post<any>({ url: '/notice/list', params })
}

/** 发布/编辑通知 */
export function fetchNoticeEdit(params: any) {
  return adminRequest.post<any>({ url: '/notice/edit', params })
}

/** 删除通知 */
export function fetchNoticeDelete(id: number) {
  return adminRequest.post<any>({ url: '/notice/delete', params: { id } })
}

/** 拉取当前用户消息 */
export function fetchNoticePull() {
  return adminRequest.get<{ list: MessageItem[]; unread: UnreadCountItem[] }>({ url: '/notice/pull' })
}

/** 获取未读数 */
export function fetchNoticeUnreadCount() {
  return adminRequest.get<{ list: UnreadCountItem[]; total: number }>({ url: '/notice/unreadCount' })
}

/** 标记已读 */
export function fetchNoticeRead(id: number) {
  return adminRequest.post<any>({ url: '/notice/read', params: { id } })
}

/** 全部已读 */
export function fetchNoticeReadAll(type?: number) {
  return adminRequest.post<any>({ url: '/notice/readAll', params: { type: type || 0 } })
}
