# API 目录整理说明

## 📁 方案B：保留公开接口例外

按照前端API规范，API目录已按以下结构整理：

## 当前目录结构

```
src/api/
├── backend/                    ✅ 后台接口(需要鉴权)
│   ├── auth/                   - 后台认证
│   │   ├── index.ts
│   │   └── login.ts
│   ├── common/                 - 公共功能
│   │   ├── attachment.ts       - 附件管理
│   │   ├── upload.ts           - 文件上传
│   │   └── index.ts
│   ├── member/                 - 会员管理
│   │   ├── index.ts            - 会员CRUD
│   │   ├── group.ts            - 会员分组
│   │   └── menu.ts             - 会员菜单
│   ├── system/                 - 系统管理
│   │   ├── config.ts           - 系统配置 ✅ 新增
│   │   ├── dept.ts             - 部门管理
│   │   ├── field.ts            - 字段定义
│   │   ├── fieldPerm.ts        - 字段权限 ✅ 新增
│   │   ├── menu.ts             - 菜单管理
│   │   ├── post.ts             - 岗位管理
│   │   ├── role.ts             - 角色管理
│   │   ├── user.ts             - 用户管理
│   │   └── index.ts
│   └── index.ts
│
├── frontend/                   ✅ 前台接口(会员端)
│   ├── member/
│   │   ├── auth.ts             - 会员认证
│   │   └── user.ts             - 会员信息
│   └── index.ts
│
├── site.ts                     ✅ 保留(公开接口，特殊)
│
└── 兼容文件(仅重定向，标记@deprecated)
    ├── attachment.ts           → backend/common/attachment
    ├── auth.ts                 → backend/auth
    ├── upload.ts               → backend/common/upload
    ├── system-manage.ts        → backend/system
    ├── system-config.ts        → backend/system/config ✅ 新增
    └── system/fieldPerm.ts     → backend/system/fieldPerm ✅ 新增
```

## 设计原则

### 1. **后台接口** (`backend/`)
- 所有需要后台管理员权限的接口
- 使用 `adminRequest`
- Token 头: `Authorization: Bearer xxx`
- 路由前缀: `/admin/**`

### 2. **前台接口** (`frontend/`)
- 会员端使用的接口
- 使用 `memberRequest`
- Token 头: `Xy-User-Token: xxx`
- 路由前缀: `/member/**`

### 3. **公开接口** (根目录)
- **site.ts**: 站点配置接口，无需鉴权
- 直接使用 axios，不走 adminRequest
- 路由前缀: `/site/**`

### 4. **兼容文件**
- 标记 `@deprecated`
- 仅做重定向: `export * from './backend/xxx'`
- 便于旧代码逐步迁移
- 后续版本可删除

## 迁移完成的模块

### ✅ 已迁移
- `system-config.ts` → `backend/system/config.ts`
- `system/fieldPerm.ts` → `backend/system/fieldPerm.ts`

### ✅ 已规范化
- `backend/member/` - 会员管理完整模块
  - index.ts - 会员CRUD
  - group.ts - 会员分组
  - menu.ts - 会员菜单

## 新代码开发规范

### ✅ 正确做法
```typescript
// 后台系统配置
import { getConfigSchemaApi } from '@/api/backend/system/config'

// 会员管理
import { getMemberList } from '@/api/backend/member'

// 会员分组
import { getMemberGroupList } from '@/api/backend/member/group'
```

### ❌ 避免使用
```typescript
// 不要使用根目录的兼容文件
import { getConfigSchemaApi } from '@/api/system-config'  // ❌
```

## 特殊说明

### site.ts 为什么保留在根目录？

**原因**：
1. **公开接口**：不需要任何鉴权
2. **特殊性质**：使用原生 axios，不走 adminRequest/memberRequest
3. **独立性**：不属于 backend 或 frontend 任何一方

**示例**：
```typescript
// site.ts
import axios from 'axios'

export async function fetchSiteIndex(): Promise<SiteInfo> {
  const { data } = await axios.get('/site/index')  // 直接调用
  return data.data
}
```

## 后续清理计划

待所有旧代码迁移完成后，可删除：
- `attachment.ts`
- `auth.ts`
- `upload.ts`
- `system-manage.ts`
- `system-config.ts`
- `system/` 目录

保留：
- `site.ts` (公开接口)
- `backend/` (后台接口)
- `frontend/` (前台接口)
