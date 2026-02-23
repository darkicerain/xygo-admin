SET client_encoding TO 'UTF8';

-- ============================================================
-- 社区测试数据（会员ID=1: z312193608）
-- ============================================================

-- 1. 插入分类
INSERT INTO xy_community_category (title, icon, sort, status, created_at, updated_at) VALUES
('前端开发', 'ri:html5-line', 10, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
('后端开发', 'ri:server-line', 9, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
('部署运维', 'ri:cloud-line', 8, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
('UI设计', 'ri:palette-line', 7, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
('综合讨论', 'ri:chat-smile-2-line', 6, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint);

-- 2. 插入帖子（member_id=1，分类ID假设从1开始）
INSERT INTO xy_community_post (member_id, category_id, title, content, tags, views, reply_count, like_count, is_top, is_essence, status, last_reply_at, last_reply_member_id, created_at, updated_at, deleted_at) VALUES

-- 置顶+精华
(1, 1, 'Vue3 组合式 API 最佳实践总结',
E'# Vue3 组合式 API 最佳实践\n\n## 1. 使用 composables 抽离逻辑\n\n将可复用的逻辑抽成 `useXxx` 函数：\n\n```ts\nexport function useCounter(initial = 0) {\n  const count = ref(initial)\n  const increment = () => count.value++\n  return { count, increment }\n}\n```\n\n## 2. 响应式数据选择\n\n- 基本类型用 `ref`\n- 对象/数组用 `reactive`\n- 从 props 解构用 `toRefs`\n\n## 3. watch vs watchEffect\n\n- `watch` 惰性执行，可以拿到新旧值\n- `watchEffect` 立即执行，自动追踪依赖\n\n## 4. 生命周期\n\n推荐使用 `onMounted`、`onUnmounted` 等组合式 API 钩子，避免 Options API 混用。\n\n> 欢迎大家补充自己的实践经验！',
'["Vue3","组合式API","最佳实践"]', 328, 5, 18, 1, 1, 1, EXTRACT(EPOCH FROM NOW())::bigint - 3600, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*3, EXTRACT(EPOCH FROM NOW())::bigint - 3600, 0),

-- 置顶
(1, 2, 'GoFrame v2 路由注册机制详解',
E'# GoFrame v2 路由注册\n\n## 约定式路由\n\nGoFrame v2 使用 `g.Meta` 标签自动注册路由：\n\n```go\ntype HelloReq struct {\n    g.Meta `path:"/hello" method:"get"`\n    Name string `v:"required"`\n}\n```\n\n## 中间件\n\n通过 `BindMiddleware` 绑定：\n\n```go\ngroup.Middleware(middleware.Auth)\ngroup.Bind(controller.NewV1())\n```\n\n## 分组\n\n建议按模块分组：admin、site、member，各自独立的认证中间件。\n\n有问题欢迎讨论！',
'["GoFrame","路由","Go"]', 256, 3, 12, 1, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 7200, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*5, EXTRACT(EPOCH FROM NOW())::bigint - 7200, 0),

-- 精华
(1, 1, 'Element Plus 表单校验的几种高级用法',
E'# Element Plus 表单校验进阶\n\n## 1. 自定义校验器\n\n```ts\nconst checkAge = (rule, value, callback) => {\n  if (value < 18) callback(new Error(''年龄不能小于18''))\n  else callback()\n}\n```\n\n## 2. 动态表单校验\n\n使用 `v-for` 渲染的表单项，prop 需要拼接索引：\n\n```html\n<el-form-item :prop="`items.${index}.name`" :rules="nameRules">\n```\n\n## 3. 跨字段联动校验\n\n密码确认场景，在 validator 中访问 form model 的其他字段。\n\n## 4. 异步校验\n\n校验器返回 Promise，可以做接口查重等异步操作。',
'["Element Plus","表单校验","Vue3"]', 189, 4, 9, 0, 1, 1, EXTRACT(EPOCH FROM NOW())::bigint - 1800, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*2, EXTRACT(EPOCH FROM NOW())::bigint - 1800, 0),

-- 普通帖子
(1, 3, 'Docker Compose 部署 Go + PostgreSQL + Nginx 全流程',
E'# Docker Compose 一键部署\n\n## docker-compose.yml\n\n```yaml\nversion: "3.8"\nservices:\n  app:\n    build: .\n    ports:\n      - "8000:8000"\n    depends_on:\n      - db\n  db:\n    image: postgres:15\n    environment:\n      POSTGRES_PASSWORD: 123456\n      POSTGRES_DB: myapp\n    volumes:\n      - pgdata:/var/lib/postgresql/data\n  nginx:\n    image: nginx:alpine\n    ports:\n      - "80:80"\n    volumes:\n      - ./nginx.conf:/etc/nginx/conf.d/default.conf\nvolumes:\n  pgdata:\n```\n\n## Dockerfile\n\n```dockerfile\nFROM golang:1.21-alpine AS builder\nWORKDIR /app\nCOPY . .\nRUN go build -o server .\n\nFROM alpine:latest\nCOPY --from=builder /app/server /server\nCMD ["/server"]\n```\n\n部署遇到问题可以在下面讨论。',
'["Docker","部署","PostgreSQL","Nginx"]', 412, 7, 15, 0, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 900, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*1, EXTRACT(EPOCH FROM NOW())::bigint - 900, 0),

(1, 2, 'PostgreSQL 性能优化：索引策略与查询分析',
E'# PostgreSQL 性能优化\n\n## EXPLAIN ANALYZE\n\n```sql\nEXPLAIN ANALYZE SELECT * FROM users WHERE email = ''test@example.com'';\n```\n\n## 索引类型选择\n\n- B-tree：等值查询、范围查询（默认）\n- GIN：全文搜索、JSONB 查询\n- GiST：地理空间数据\n- BRIN：时序数据、大表\n\n## 常见优化手段\n\n1. 避免 `SELECT *`，只查需要的列\n2. 合理使用复合索引，注意列顺序\n3. 大表分页用 keyset pagination 替代 OFFSET\n4. 定期 `VACUUM ANALYZE`\n\n大家有什么优化经验也可以分享！',
'["PostgreSQL","性能优化","索引"]', 178, 2, 8, 0, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 600, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*4, EXTRACT(EPOCH FROM NOW())::bigint - 600, 0),

(1, 1, 'Tailwind CSS 响应式布局技巧分享',
E'# Tailwind CSS 响应式布局\n\n## 断点系统\n\n```html\n<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">\n```\n\nTailwind 默认断点：\n- `sm`: 640px\n- `md`: 768px\n- `lg`: 1024px\n- `xl`: 1280px\n- `2xl`: 1536px\n\n## 容器查询\n\nTailwind v3.4+ 支持 `@container` 查询：\n\n```html\n<div class="@container">\n  <div class="@lg:grid-cols-2">\n```\n\n## 实用技巧\n\n- `max-w-7xl mx-auto` 居中容器\n- `aspect-[16/9]` 固定宽高比\n- `line-clamp-2` 文本截断',
'["Tailwind CSS","响应式","CSS"]', 95, 1, 4, 0, 0, 1, 0, 0, EXTRACT(EPOCH FROM NOW())::bigint - 86400*6, EXTRACT(EPOCH FROM NOW())::bigint - 86400*6, 0),

(1, 4, '后台管理系统 UI 设计规范建议',
E'# 后台管理系统 UI 设计规范\n\n## 色彩体系\n\n- 主色：品牌蓝 #5a8dee\n- 成功：#67c23a\n- 警告：#e6a23c\n- 危险：#f56c6c\n- 信息：#909399\n\n## 间距规范\n\n采用 4px 基准网格：4, 8, 12, 16, 24, 32, 48\n\n## 字体层级\n\n- 页面标题：20px Bold\n- 卡片标题：16px Medium\n- 正文：14px Regular\n- 辅助文字：12px Regular\n\n## 圆角\n\n- 按钮：8px\n- 卡片：12px\n- 弹窗：16px\n- 大容器：24px\n\n欢迎设计师们补充！',
'["UI设计","设计规范","后台管理"]', 67, 0, 3, 0, 0, 1, 0, 0, EXTRACT(EPOCH FROM NOW())::bigint - 86400*7, EXTRACT(EPOCH FROM NOW())::bigint - 86400*7, 0),

(1, 5, '新人报到！分享一下我的技术栈',
E'# 大家好！\n\n我是一名全栈开发者，主要技术栈：\n\n## 前端\n- Vue 3 + TypeScript\n- Element Plus / Ant Design Vue\n- Tailwind CSS\n- Vite\n\n## 后端\n- Go (GoFrame)\n- PostgreSQL / MySQL\n- Redis\n\n## 运维\n- Docker + Docker Compose\n- Nginx\n- GitHub Actions CI/CD\n\n最近在学习 XYGo Admin 框架，感觉设计得很不错，希望能在社区里多交流学习！\n\n大家都用什么技术栈呢？',
'["新人报到","技术栈","全栈"]', 234, 6, 11, 0, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 300, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*8, EXTRACT(EPOCH FROM NOW())::bigint - 300, 0),

(1, 2, 'GoFrame 中间件鉴权方案对比：JWT vs Session',
E'# JWT vs Session 鉴权\n\n## JWT 方案\n\n优点：\n- 无状态，天然支持分布式\n- 前后端分离友好\n\n缺点：\n- Token 无法主动失效\n- Payload 不宜过大\n\n## Session 方案\n\n优点：\n- 服务端可控，随时踢人\n- 安全性更高\n\n缺点：\n- 需要 Session 存储（Redis）\n- 分布式需要共享 Session\n\n## GoFrame 实践\n\nGoFrame 内置了 `ghttp.Session`，也可以用 JWT 中间件。\n\n我们项目用的是 JWT + Redis 黑名单方案，兼顾无状态和主动失效。\n\n大家用的什么方案？',
'["GoFrame","JWT","Session","鉴权"]', 156, 4, 7, 0, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 1200, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*10, EXTRACT(EPOCH FROM NOW())::bigint - 1200, 0),

(1, 3, 'GitHub Actions 自动部署到阿里云 ECS 完整配置',
E'# GitHub Actions 自动部署\n\n## workflow 配置\n\n```yaml\nname: Deploy\non:\n  push:\n    branches: [main]\njobs:\n  deploy:\n    runs-on: ubuntu-latest\n    steps:\n      - uses: actions/checkout@v4\n      - name: Build\n        run: |\n          go build -o server .\n      - name: Deploy to ECS\n        uses: appleboy/ssh-action@v1\n        with:\n          host: ${{ secrets.HOST }}\n          username: root\n          key: ${{ secrets.SSH_KEY }}\n          script: |\n            cd /opt/app\n            ./deploy.sh\n```\n\n## deploy.sh\n\n```bash\n#!/bin/bash\nsystemctl stop myapp\ncp /tmp/server /opt/app/server\nsystemctl start myapp\n```\n\n有更好的方案欢迎分享！',
'["GitHub Actions","CI/CD","部署","阿里云"]', 203, 3, 6, 0, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 2400, 1, EXTRACT(EPOCH FROM NOW())::bigint - 86400*12, EXTRACT(EPOCH FROM NOW())::bigint - 2400, 0),

-- 零回答帖子（用于"消灭零回答"）
(1, 1, 'Vite 热更新偶尔失效怎么排查？',
E'用 Vite 开发 Vue3 项目，偶尔会出现修改代码后页面不刷新的情况，需要手动 F5。\n\n环境：\n- Vite 5.x\n- Vue 3.4\n- Windows 11\n\n已尝试：\n1. 清除 node_modules/.vite 缓存\n2. 关闭杀毒软件\n3. 检查文件监听数量限制\n\n还是偶发，有遇到过的吗？',
'["Vite","热更新","Vue3"]', 42, 0, 1, 0, 0, 1, 0, 0, EXTRACT(EPOCH FROM NOW())::bigint - 3600*4, EXTRACT(EPOCH FROM NOW())::bigint - 3600*4, 0),

(1, 2, 'gf gen dao 生成的代码如何自定义模板？',
E'想修改 `gf gen dao` 生成的代码模板，比如给 entity 加上自定义的方法或者接口实现。\n\n看了文档说可以用 `--tplDaoIndexContent` 之类的参数，但没找到具体的模板变量文档。\n\n有人做过自定义模板吗？求分享经验。',
'["GoFrame","gf gen dao","代码生成"]', 28, 0, 0, 0, 0, 1, 0, 0, EXTRACT(EPOCH FROM NOW())::bigint - 3600*8, EXTRACT(EPOCH FROM NOW())::bigint - 3600*8, 0),

(1, 3, 'Nginx 反向代理 WebSocket 连接经常断开',
E'配置了 Nginx 反向代理 WebSocket，但连接大概 60 秒就会断开。\n\n当前配置：\n```nginx\nlocation /ws {\n    proxy_pass http://127.0.0.1:8000;\n    proxy_http_version 1.1;\n    proxy_set_header Upgrade $http_upgrade;\n    proxy_set_header Connection "upgrade";\n}\n```\n\n是不是需要加 timeout 配置？具体怎么加？',
'["Nginx","WebSocket","反向代理"]', 35, 0, 2, 0, 0, 1, 0, 0, EXTRACT(EPOCH FROM NOW())::bigint - 3600*12, EXTRACT(EPOCH FROM NOW())::bigint - 3600*12, 0),

(1, 4, 'Figma 设计稿导出给前端的最佳格式是什么？',
E'团队里设计师用 Figma，前端用 Vue3 + Tailwind。\n\n目前设计师直接给 Figma 链接，前端自己量尺寸和取色。但效率不高，经常还原度有偏差。\n\n想问下大家：\n1. 设计稿用什么格式交付最高效？\n2. 有没有好用的 Figma 转代码工具？\n3. 设计 Token 怎么管理？',
'["Figma","设计交付","前端协作"]', 19, 0, 0, 0, 0, 1, 0, 0, EXTRACT(EPOCH FROM NOW())::bigint - 3600*16, EXTRACT(EPOCH FROM NOW())::bigint - 3600*16, 0),

(1, 5, 'XYGo Admin 的权限系统是怎么设计的？',
E'看了 XYGo Admin 的源码，权限系统挺完善的，有菜单权限、按钮权限、数据权限。\n\n想了解一下：\n1. 前端路由权限是怎么和后端菜单关联的？\n2. 按钮级权限是怎么控制的？\n3. 数据权限（部门隔离）是在哪一层实现的？\n\n希望有大佬能详细讲讲架构设计思路。',
'["XYGo Admin","权限系统","架构"]', 88, 0, 5, 0, 0, 1, 0, 0, EXTRACT(EPOCH FROM NOW())::bigint - 3600*20, EXTRACT(EPOCH FROM NOW())::bigint - 3600*20, 0);

-- 3. 给部分帖子插入回复
INSERT INTO xy_community_reply (post_id, member_id, parent_id, content, like_count, is_accepted, status, created_at, updated_at, deleted_at) VALUES
(1, 1, 0, '补充一点：composables 里尽量不要直接操作 DOM，保持纯逻辑。如果需要操作 DOM，用 `useTemplateRef` 或者 `onMounted` 里处理。', 3, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 80000, EXTRACT(EPOCH FROM NOW())::bigint - 80000, 0),
(1, 1, 0, '关于 watch 和 watchEffect 的选择，我的经验是：如果需要对比新旧值做差异处理，用 watch；如果只是"某个值变了就执行副作用"，用 watchEffect 更简洁。', 5, 1, 1, EXTRACT(EPOCH FROM NOW())::bigint - 70000, EXTRACT(EPOCH FROM NOW())::bigint - 70000, 0),
(1, 1, 0, '还有一个技巧：`defineExpose` 可以控制组件暴露给父组件的方法，配合 TypeScript 的 `InstanceType` 可以获得完整类型提示。', 2, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 60000, EXTRACT(EPOCH FROM NOW())::bigint - 60000, 0),
(1, 1, 1, '同意，我们项目里 composables 都是纯函数 + ref，测试也方便。', 1, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 50000, EXTRACT(EPOCH FROM NOW())::bigint - 50000, 0),
(1, 1, 2, '对的，watchEffect 在 SSR 场景下还有个好处是可以用 `onServerPrefetch` 配合。', 0, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 40000, EXTRACT(EPOCH FROM NOW())::bigint - 40000, 0),

(2, 1, 0, 'GoFrame 的路由注册确实很优雅，比手动写 router.GET 之类的简洁多了。', 2, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 90000, EXTRACT(EPOCH FROM NOW())::bigint - 90000, 0),
(2, 1, 0, '请问 g.Meta 里的 tags 字段是用来做什么的？是给 Swagger 文档分组用的吗？', 1, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 85000, EXTRACT(EPOCH FROM NOW())::bigint - 85000, 0),
(2, 1, 6, '是的，tags 就是 OpenAPI 的 tag，用来在 Swagger UI 里分组显示接口。', 3, 1, 1, EXTRACT(EPOCH FROM NOW())::bigint - 82000, EXTRACT(EPOCH FROM NOW())::bigint - 82000, 0),

(4, 1, 0, '补充一下 Nginx 配置里的 gzip 压缩，对前端资源加载速度提升很大。', 4, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 50000, EXTRACT(EPOCH FROM NOW())::bigint - 50000, 0),
(4, 1, 0, '建议加上健康检查，docker-compose 里用 healthcheck 确保 db 启动完成后再启动 app。', 6, 1, 1, EXTRACT(EPOCH FROM NOW())::bigint - 45000, EXTRACT(EPOCH FROM NOW())::bigint - 45000, 0),
(4, 1, 0, '多阶段构建的 Dockerfile 写得很好，我们项目也是这么做的，镜像从 1.2G 缩到 20M。', 2, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 40000, EXTRACT(EPOCH FROM NOW())::bigint - 40000, 0),

(8, 1, 0, '欢迎！技术栈很全面，Go + Vue3 是现在很流行的组合。', 3, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 70000, EXTRACT(EPOCH FROM NOW())::bigint - 70000, 0),
(8, 1, 0, '我也是用 GoFrame + Vue3，感觉开发效率很高。XYGo Admin 的代码生成器特别好用。', 2, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 65000, EXTRACT(EPOCH FROM NOW())::bigint - 65000, 0),

(9, 1, 0, '我们用的 JWT + Redis 方案，Token 过期时间设 2 小时，刷新 Token 7 天。', 3, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 60000, EXTRACT(EPOCH FROM NOW())::bigint - 60000, 0),
(9, 1, 0, 'Session 方案在单体应用里更简单，但如果后面要做微服务，JWT 更合适。', 1, 0, 1, EXTRACT(EPOCH FROM NOW())::bigint - 55000, EXTRACT(EPOCH FROM NOW())::bigint - 55000, 0);
