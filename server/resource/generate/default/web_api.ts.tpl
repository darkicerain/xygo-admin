/**
 * {{.TableComment}}管理 API
 */
import { adminRequest } from '@/utils/http'

/** 列表 */
export function fetch{{.VarName}}List(params: any) {
  return adminRequest.get<Record<string, any>>({
    url: '/{{.RouteName}}/list',
    params
  })
}
{{- if .HasView}}

/** 详情 */
export function fetch{{.VarName}}View(id: number) {
  return adminRequest.get<any>({
    url: '/{{.RouteName}}/view',
    params: { id }
  })
}
{{- end}}
{{- if or .HasAdd .HasEdit}}

/** 保存(新增/编辑) */
export function fetch{{.VarName}}Edit(params: any) {
  return adminRequest.post<any>({
    url: '/{{.RouteName}}/edit',
    params
  })
}
{{- end}}
{{- if or .HasDel .HasBatchDel}}

/** 删除 */
export function fetch{{.VarName}}Delete(id: number) {
  return adminRequest.post<any>({
    url: '/{{.RouteName}}/delete',
    params: { id }
  })
}
{{- end}}
{{- if .HasExport}}

/** 导出 */
export function fetch{{.VarName}}Export(params?: any) {
  return adminRequest.get<any>({
    url: '/{{.RouteName}}/export',
    params,
    responseType: 'blob'
  })
}
{{- end}}
