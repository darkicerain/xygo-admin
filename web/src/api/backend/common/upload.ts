/**
 * 文件上传 API
 * @module api/backend/common/upload
 */
import { adminRequest } from '@/utils/http'

/**
 * 上传响应数据类型
 */
export interface UploadResponse {
  url: string
  path?: string
  name?: string
  size?: number
}

/**
 * 上传图片
 * @param file 图片文件
 */
export const uploadImageApi = (file: File) => {
  const formData = new FormData()
  formData.append('file', file)
  
  return adminRequest.post<UploadResponse>({
    url: '/upload/file',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    },
    showErrorMessage: true
  })
}

/**
 * 上传文件
 * @param file 文件
 */
export const uploadFileApi = (file: File) => {
  const formData = new FormData()
  formData.append('file', file)
  
  return adminRequest.post<UploadResponse>({
    url: '/upload/file',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    },
    showErrorMessage: true
  })
}

/**
 * 上传文件（带进度回调）
 * @param file 文件
 * @param onProgress 进度回调
 */
export const uploadFileWithProgressApi = (
  file: File, 
  onProgress?: (progress: number) => void
) => {
  const formData = new FormData()
  formData.append('file', file)
  
  return adminRequest.post<any>({
    url: '/upload/file',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    },
    onUploadProgress: (progressEvent: any) => {
      if (progressEvent.lengthComputable && onProgress) {
        const percentCompleted = Math.round(
          (progressEvent.loaded * 100) / progressEvent.total
        )
        onProgress(percentCompleted)
      }
    }
  })
}
