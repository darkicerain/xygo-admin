/**
 * 前台会员余额记录 API
 */
import { memberRequest } from '@/utils/http'

/** 余额记录项 */
export interface MoneyLogItem {
  id: number
  money: number
  before: number
  after: number
  memo: string
  createdAt: string
}

/** 余额记录列表响应 */
export interface MoneyLogListResult {
  list: MoneyLogItem[]
  page: number
  pageSize: number
  total: number
}

/** 获取余额记录列表 */
export function getMoneyLogList(params?: { page?: number; pageSize?: number }) {
  return memberRequest.get<MoneyLogListResult>({
    url: '/user/money/log',
    params
  })
}
