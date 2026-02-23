/**
 * 前台会员积分记录 API
 */
import { memberRequest } from '@/utils/http'

/** 积分记录项 */
export interface ScoreLogItem {
  id: number
  score: number
  before: number
  after: number
  memo: string
  createdAt: string
}

/** 积分记录列表响应 */
export interface ScoreLogListResult {
  list: ScoreLogItem[]
  page: number
  pageSize: number
  total: number
}

/** 获取积分记录列表 */
export function getScoreLogList(params?: { page?: number; pageSize?: number }) {
  return memberRequest.get<ScoreLogListResult>({
    url: '/user/score/log',
    params
  })
}
