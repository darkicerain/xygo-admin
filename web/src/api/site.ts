import axios from 'axios'

/**
 * 站点信息接口（公开接口，不使用baseURL）
 */

export interface SiteInfo {
  group: string
  items: Record<string, string>
  siteName: string
  siteSubtitle: string
  icp: string
  timezone: string
  description: string
  themeColor: string
  logo: string
  closed: string
  openMemberCenter: boolean
}

/**
 * 获取站点基础信息（公开接口，不加/admin前缀）
 */
export async function fetchSiteIndex(): Promise<SiteInfo> {
  const { data } = await axios.get<{ code: number; data: SiteInfo; message?: string; msg?: string }>(
    '/site/index'
  )
  if (data.code === 0) {
    return data.data
  }
  throw new Error(data.message || data.msg || '获取站点信息失败')
}
