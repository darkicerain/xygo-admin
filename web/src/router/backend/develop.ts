import { AppRouteRecord } from '@/types/router'

export const developRoutes: AppRouteRecord = {
  path: '/develop',
  name: 'Develop',
  component: '/index/index',
  meta: {
    title: 'menus.develop.title',
    icon: 'ri:code-box-line',
    roles: ['R_SUPER']
  },
  children: [
    {
      path: 'gen-codes',
      name: 'GenCodes',
      component: '/develop/gen-codes/index',
      meta: {
        title: 'menus.develop.genCodes',
        icon: 'ri:magic-line',
        keepAlive: true,
        roles: ['R_SUPER']
      }
    }
  ]
}
