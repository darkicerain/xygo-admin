## 目标
- 参考 buildadmin：每个模块一个独立 API/类型/视图文件，按路径直接引用，不依赖聚合入口，便于后端 CRUD 生成器直接写文件而无需追加。

## 目录规范
### API
- 路径：`src/api/system/<module>.ts`
- 引用：`import { fn } from '@/api/system/<module>'`
- 不强制维护聚合入口；如需入口文件（`src/api/system/index.ts`）由生成器整文件覆盖写入。
- 旧文件 `src/api/system-manage.ts` 仅兼容，逐步迁移。

### 类型
- 路径：`src/types/api/system/<module>.ts`
- 结构：`declare namespace Api { namespace SystemManage { ... } }`
- 不需要聚合；如保留 `api.d.ts` 只引用 `system/index.ts`（可由生成器覆盖）。

### 视图
- 路径：`src/views/system/<module>/index.vue`
- 子组件/弹窗：放 `src/views/system/<module>/modules/`
- 页面内直接引用对应 API 模块。

### 路由
- 路径：`src/router/modules/system.ts`（或对应模块路由文件）
- CRUD 生成时按模块插入 route 配置，path 与视图目录一致。

## 生成/覆盖规则
- 新增模块时，后端生成器直接写入：
  - `src/api/system/<module>.ts`（接口函数）
  - `src/types/api/system/<module>.ts`（类型声明）
  - `src/views/system/<module>/index.vue`（页面 + modules/ 子组件）
  - `src/router/modules/system.ts` 插入 route 片段
- 若需要入口（如 `src/api/system/index.ts`、`src/types/api/system/index.ts`），采用“整文件覆盖+排序导出”方式生成，不做追加。

## 开发步骤（建议执行顺序）
1) API：为每个业务域落地独立文件；移除对 `system-manage.ts` 的新引用，逐步迁移旧引用。
2) 类型：确保各模块类型在 `types/api/system/<module>.ts`，删除残留聚合/旧 d.ts。
3) 视图：逐页改为按模块 API 路径引入（例如附件页已用 `@/api/system/attachment`）。
4) 路由：核对 `router/modules/system.ts`，按模块挂路由，便于生成器插入。
5) 生成器约定：后端按照上述路径写文件；若需要入口文件则覆盖生成。

## 现状对齐说明（截至本次调整）
- API 已拆：`attachment.ts / user.ts / role.ts / config.ts`，入口 `src/api/system/index.ts` 为覆盖式导出。
- 类型已拆：`types/api/system/attachment.ts / user.ts / role.ts / config.ts`。
- 附件页已切到 `@/api/system/attachment`，列与附件字段对齐。
- TODO：迁移残留对 `system-manage.ts` 的引用，按模块路径引入；视图/路由按需批量核对。
