/**
 * 附件管理 API
 * @module api/backend/common/attachment
 */
import { adminRequest } from '@/utils/http'

/**
 * 获取附件列表
 */
export function fetchAttachmentList(params: {
  page: number
  pageSize: number
  topic?: string
  storage?: string
}) {
  return adminRequest.get<{
    list: any[]
    page: number
    pageSize: number
    total: number
  }>({
    url: '/attachment/list',
    params
  })
}

/**
 * 删除附件
 */
export function fetchDeleteAttachment(id: number) {
  return adminRequest.post({
    url: '/attachment/delete',
    params: { id }
  })
}
