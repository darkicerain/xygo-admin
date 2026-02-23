/**
 * 前台会员签到 API
 */
import { memberRequest } from '@/utils/http'

/** 签到日历天 */
export interface CheckinDayItem {
  date: string
  checked: boolean
  score: number
}

/** 签到信息 */
export interface CheckinInfo {
  continuousDays: number
  todayChecked: boolean
  todayScore: number
  weekDays: CheckinDayItem[]
}

/** 签到结果 */
export interface CheckinResult {
  score: number
  continuousDays: number
}

/** 获取签到信息 */
export function getCheckinInfo() {
  return memberRequest.get<CheckinInfo>({
    url: '/user/checkin/info'
  })
}

/** 执行签到 */
export function doCheckin() {
  return memberRequest.post<CheckinResult>({
    url: '/user/checkin'
  })
}
