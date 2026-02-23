import { AppRouteRecord } from '@/types/router'

export const safeguardRoutes: AppRouteRecord = {
  path: '/safeguard',
  name: 'Safeguard',
  component: '/index/index',
  meta: {
    title: 'menus.safeguard.title',
    icon: 'ri:shield-check-line',
    keepAlive: false
  },
  children: [
    {
      path: 'server',
      name: 'SafeguardServer',
      component: '/safeguard/server',
      meta: {
        title: 'menus.safeguard.server',
        icon: 'ri:hard-drive-3-line',
        keepAlive: true
      }
    },
    {
      path: 'login-log',
      name: 'LoginLog',
      component: '/safeguard/login-log',
      meta: {
        title: 'menus.safeguard.loginLog',
        icon: 'ri:login-box-line',
        keepAlive: true,
        roles: ['R_SUPER']
      }
    },
    {
      path: 'operation-log',
      name: 'OperationLog',
      component: '/safeguard/operation-log',
      meta: {
        title: 'menus.safeguard.operationLog',
        icon: 'ri:file-text-line',
        keepAlive: true,
        roles: ['R_SUPER']
      }
    },
    {
      path: 'performance',
      name: 'SafeguardPerformance',
      component: '/safeguard/performance',
      meta: {
        title: 'menus.safeguard.performance',
        icon: 'ri:line-chart-line',
        keepAlive: true,
        roles: ['R_SUPER']
      }
    }
  ]
}
