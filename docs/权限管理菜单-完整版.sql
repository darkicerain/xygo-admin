-- ============================================
-- 权限管理完整菜单（包含部门、岗位）
-- 路由前缀：/auth（避免与 /permission 冲突）
-- ============================================

-- ============================================
-- 步骤1：创建"权限管理"一级目录
-- ============================================

INSERT INTO `xy_admin_menu` (
  `id`, `parent_id`, `type`, `title`, `name`, `path`, `component`, `icon`, 
  `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, 
  `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, 
  `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`
) VALUES (
  140, 0, 1, '权限管理', 'Auth', '/auth', '/index/index', 'ri:admin-line',
  0, 0, '', '', '', 0,
  0, 0, '', '', 0, 0,
  65, 1, '权限管理模块：部门、岗位、用户、角色、菜单', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);


-- ============================================
-- 步骤2：创建"部门管理"菜单（需创建前端页面）
-- ============================================

INSERT INTO `xy_admin_menu` (
  `id`, `parent_id`, `type`, `title`, `name`, `path`, `component`, `icon`, 
  `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, 
  `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, 
  `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`
) VALUES (
  141, 140, 2, '部门管理', 'Dept', 'dept', '/system/dept', 'ri:organization-chart',
  0, 1, '', '', '', 0,
  0, 0, '', '', 0, 0,
  1, 1, '组织架构和部门管理', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);


-- ============================================
-- 步骤3：创建"岗位管理"菜单（需创建前端页面）
-- ============================================

INSERT INTO `xy_admin_menu` (
  `id`, `parent_id`, `type`, `title`, `name`, `path`, `component`, `icon`, 
  `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, 
  `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, 
  `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`
) VALUES (
  142, 140, 2, '岗位管理', 'Post', 'post', '/system/post', 'ri:briefcase-line',
  0, 1, '', '', '', 0,
  0, 0, '', '', 0, 0,
  2, 1, '岗位管理（职位字典）', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);


-- ============================================
-- 步骤4：移动"用户管理"到"权限管理"下
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `parent_id` = 140,
  `title` = '后台用户',
  `path` = 'user',
  `component` = '/system/user',
  `sort` = 3,
  `remark` = '后台用户管理',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 61;


-- ============================================
-- 步骤5：移动"角色管理"到"权限管理"下
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `parent_id` = 140,
  `path` = 'role',
  `component` = '/system/role',
  `sort` = 4,
  `remark` = '角色权限管理',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 62;


-- ============================================
-- 步骤6：移动"菜单管理"到"权限管理"下
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `parent_id` = 140,
  `path` = 'menu',
  `component` = '/system/menu',
  `sort` = 5,
  `remark` = '菜单权限管理',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 64;


-- ============================================
-- 步骤7：调整"系统管理"目录排序
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `sort` = 70,
  `remark` = '系统设置和配置',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 60;


-- ============================================
-- 步骤8：调整"系统管理"下剩余菜单排序
-- ============================================

UPDATE `xy_admin_menu` SET `sort` = 1, `update_time` = UNIX_TIMESTAMP() WHERE `id` = 63;
UPDATE `xy_admin_menu` SET `sort` = 2, `update_time` = UNIX_TIMESTAMP() WHERE `id` = 65;
UPDATE `xy_admin_menu` SET `sort` = 3, `update_time` = UNIX_TIMESTAMP() WHERE `id` = 122;
UPDATE `xy_admin_menu` SET `sort` = 10, `update_time` = UNIX_TIMESTAMP() WHERE `id` = 66;


-- ============================================
-- 验证结果
-- ============================================

SELECT id, parent_id, type, title, name, path, component, sort, status 
FROM `xy_admin_menu` 
WHERE parent_id = 140 OR id = 140
ORDER BY parent_id, sort;


-- ============================================
-- 最终菜单结构
-- ============================================

/*
权限管理（id=140, path='/auth'）✅ 改为 /auth
├── 部门管理（id=141, path='dept', component='/system/dept'）✨ 新增
├── 岗位管理（id=142, path='post', component='/system/post'）✨ 新增
├── 后台用户（id=61, path='user', component='/system/user'）
├── 角色管理（id=62, path='role', component='/system/role'）
└── 菜单管理（id=64, path='menu', component='/system/menu'）

访问路径：
- /auth/dept  → 部门管理
- /auth/post  → 岗位管理
- /auth/user  → 后台用户
- /auth/role  → 角色管理
- /auth/menu  → 菜单管理

系统管理（id=60, path='/system'）
├── 用户中心
├── 系统设置
├── 附件管理
└── 多级菜单

【后续工作】
1. 创建前端页面：
   - views/system/dept/index.vue（部门管理）
   - views/system/post/index.vue（岗位管理）
2. 参考 HotGo 实现部门和岗位的 CRUD 功能
*/
