/**
 * 字段权限 API
 * @module api/backend/system/field
 */
import { adminRequest } from '@/utils/http'

/**
 * 获取所有资源列表（用于菜单resource字段选择）
 */
export function fetchResourceList() {
  return adminRequest.get<{ list: Array<{ code: string; label: string }> }>({
    url: '/field/resourceList'
  })
}
