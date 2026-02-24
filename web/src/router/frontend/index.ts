/**
 * Frontend 前台路由配置（对齐 BuildAdmin 路径隔离模式）
 *
 * 设计原则：
 *   - 静态路由只注册 FrontendLayout 壳 + 首页 + 登录/注册等固定页面
 *   - 其他业务页面（文档、社区、案例等）全部由后台会员菜单 API 驱动动态注册
 *   - 当用户直接访问一个尚未注册的前台路由时，beforeEach 守卫会先调用
 *     loader 加载菜单并注册路由，再重新导航（避免 404）
 */

import { AppRouteRecordRaw } from '@/utils/router'

export const frontendRoutes: AppRouteRecordRaw[] = [
  {
    path: '/',
    name: 'FrontendLayout',
    component: () => import('@/views/frontend/layouts/FrontendLayout.vue'),
    meta: { title: '首页' },
    children: [
      {
        path: '',
        name: 'FrontendHome',
        component: () => import('@/views/frontend/index/index.vue'),
        meta: { title: '首页' }
      },
      {
        path: 'user/login',
        name: 'MemberLogin',
        component: () => import('@/views/frontend/member/login.vue'),
        meta: { title: '登录' }
      },
      {
        path: 'user/register',
        name: 'MemberRegister',
        component: () => import('@/views/frontend/member/register.vue'),
        meta: { title: '注册' }
      },
      {
        path: 'user',
        name: 'MemberCenter',
        component: () => import('@/views/frontend/member/center.vue'),
        meta: { title: '用户中心', requiresAuth: true }
      },
    ]
  }
]

export default frontendRoutes
