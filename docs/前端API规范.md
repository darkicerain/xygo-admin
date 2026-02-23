# 前端 API 调用规范

## ⚠️ 重要：API 路径规则

### URL 前缀说明

**前端 API 调用时，URL 路径中不需要加 `/admin` 前缀！**

#### 原因

Vite 开发服务器已经配置了统一的代理规则（`vite.config.ts`），会自动将请求代理到后端并添加 `/admin` 前缀。

#### 正确示例

```typescript
// ✅ 正确：直接写业务路径
export function fetchGetUserList(params: any) {
  return request.get({
    url: '/user/list',  // ✅ 不加 /admin
    params
  })
}

// ✅ 正确：菜单接口
export function fetchGetMenuTree() {
  return request.get({
    url: '/menu/tree',  // ✅ 不加 /admin
  })
}
```

#### 错误示例

```typescript
// ❌ 错误：加了 /admin 会导致 404
export function fetchGetUserList(params: any) {
  return request.get({
    url: '/admin/user/list',  // ❌ 多余的 /admin
    params
  })
}
```

#### 实际请求流程

1. 前端调用：`/user/list`
2. Vite 代理转发：`http://localhost:8000/admin/user/list`
3. 后端接收：`/admin/user/list`

### API 路径清单

| 功能模块 | 前端 URL | 后端实际路径 |
|---------|---------|------------|
| 登录 | `/auth/login` | `/auth/login` |
| 用户信息 | `/auth/profile` | `/auth/profile` |
| 退出登录 | `/auth/logout` | `/auth/logout` |
| 用户列表 | `/user/list` | `/admin/user/list` |
| 用户保存 | `/user/save` | `/admin/user/save` |
| 用户删除 | `/user/delete` | `/admin/user/delete` |
| 角色列表 | `/role/list` | `/admin/role/list` |
| 数据权限选项 | `/role/dataScopeSelect` | `/admin/role/dataScopeSelect` |
| 数据权限编辑 | `/role/dataScopeEdit` | `/admin/role/dataScopeEdit` |
| 菜单路由 | `/menu/routes` | `/admin/menu/routes` |
| 菜单树 | `/menu/tree` | `/admin/menu/tree` |
| 菜单保存 | `/menu/save` | `/admin/menu/save` |
| 菜单删除 | `/menu/delete` | `/admin/menu/delete` |

## Vite 代理配置参考

```typescript
// vite.config.ts
export default defineConfig({
  server: {
    proxy: {
      '/admin': {
        target: 'http://localhost:8000',
        changeOrigin: true
      },
      '/auth': {
        target: 'http://localhost:8000',
        changeOrigin: true
      }
    }
  }
})
```

## 注意事项

1. **开发环境**：通过 Vite 代理，自动处理跨域和路径转发
2. **生产环境**：需要配置 Nginx 反向代理，规则与 Vite 一致
3. **所有前端 API 调用都不加 `/admin` 前缀**（`/auth` 路径除外）
