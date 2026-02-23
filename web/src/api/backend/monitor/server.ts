/**
 * 服务器监控 API
 */
import { adminRequest } from '@/utils/http'

/** 服务器信息 */
export interface ServerInfo {
  os: {
    hostname: string
    os: string
    platform: string
    arch: string
    goVer: string
    uptime: string
    appTime: string
  }
  cpu: {
    cores: number
    usage: number
    modelName: string
  }
  memory: {
    total: number
    used: number
    available: number
    usageRate: number
    totalStr: string
    usedStr: string
  }
  disk: {
    total: number
    used: number
    free: number
    usageRate: number
    totalStr: string
    usedStr: string
  }
  runtime: {
    goroutines: number
    heapAlloc: string
    heapSys: string
    stackInUse: string
    numGC: number
    lastGC: string
  }
}

/** 获取服务器信息 */
export function getServerInfo() {
  return adminRequest.get<ServerInfo>({ url: '/monitor/server' })
}

/** 函数级性能分析项 */
export interface PprofTopItem {
  func: string
  file: string
  flat: string
  flatPct: number
  cum: string
  cumPct: number
}

/** 函数级性能分析结果 */
export interface PprofTopResult {
  cpuTop: PprofTopItem[]
  memTop: PprofTopItem[]
  cpuTime: string
  timestamp: string
}

/** 获取函数级性能分析 */
export function getPprofTop(params?: { seconds?: number; limit?: number }) {
  return adminRequest.get<PprofTopResult>({ url: '/monitor/pprof-top', params })
}
