/**
 * 消息队列 API
 */
import { adminRequest } from '@/utils/http'

export interface TopicStats {
  topic: string
  pending: number
  deadSize: number
}

/** 获取队列统计 */
export function fetchQueueStats() {
  return adminRequest.get<{ driver: string; topics: TopicStats[] }>({ url: '/queue/stats' })
}

/** 获取已注册 Topic 列表 */
export function fetchQueueTopics() {
  return adminRequest.get<{ list: string[] }>({ url: '/queue/topics' })
}

/** 测试投递消息（delaySec>0 为延迟投递） */
export function fetchQueuePushTest(params: { topic: string; body: string; delaySec?: number }) {
  return adminRequest.post({ url: '/queue/pushTest', params })
}
