-- ============================================
-- 菜单重组：创建"权限管理"模块（最终正确版）
-- 执行前请确保已恢复到原始菜单状态！
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
  140, 0, 1, '权限管理', 'Permission', '/permission', '/index/index', 'ri:admin-line',
  0, 0, '', '', '', 0,
  0, 0, '', '', 0, 0,
  65, 1, '权限管理模块', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);


-- ============================================
-- 步骤2：移动"用户管理"到"权限管理"下
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `parent_id` = 140,           -- 移到"权限管理"下
  `title` = '后台用户',         -- 改名
  `path` = 'user',             -- 相对路径（不变）
  `component` = '/system/user', -- ✅ 组件路径不变！
  `sort` = 2,
  `remark` = '后台用户管理',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 61;

-- 说明：完整路由路径变成 /permission/user，但组件还是 views/system/user/index.vue


-- ============================================
-- 步骤3：移动"角色管理"到"权限管理"下
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `parent_id` = 140,
  `path` = 'role',             -- 相对路径
  `component` = '/system/role', -- ✅ 组件路径不变！
  `sort` = 3,
  `remark` = '角色权限管理',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 62;


-- ============================================
-- 步骤4：移动"菜单管理"到"权限管理"下
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `parent_id` = 140,
  `path` = 'menu',             -- 相对路径
  `component` = '/system/menu', -- ✅ 组件路径不变！
  `sort` = 4,
  `remark` = '菜单权限管理',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 64;


-- ============================================
-- 步骤5：调整"系统管理"目录排序
-- ============================================

UPDATE `xy_admin_menu` 
SET 
  `sort` = 70,
  `remark` = '系统设置和配置',
  `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 60;


-- ============================================
-- 步骤6：调整"系统管理"下剩余菜单排序
-- ============================================

-- 用户中心
UPDATE `xy_admin_menu` SET `sort` = 1 WHERE `id` = 63;

-- 系统设置
UPDATE `xy_admin_menu` SET `sort` = 2 WHERE `id` = 65;

-- 附件管理
UPDATE `xy_admin_menu` SET `sort` = 3 WHERE `id` = 122;

-- 多级菜单示例
UPDATE `xy_admin_menu` SET `sort` = 10 WHERE `id` = 66;


-- ============================================
-- 验证结果
-- ============================================

-- 查看"权限管理"目录及其子菜单
SELECT id, parent_id, type, title, name, path, component, sort, status 
FROM `xy_admin_menu` 
WHERE parent_id = 140 OR id = 140
ORDER BY parent_id, sort;

-- 查看"系统管理"目录及其子菜单
SELECT id, parent_id, type, title, name, path, component, sort, status 
FROM `xy_admin_menu` 
WHERE parent_id = 60 OR id = 60
ORDER BY parent_id, sort;


-- ============================================
-- 最终菜单结构
-- ============================================

/*
权限管理（id=140, path='/permission'）
├── 后台用户（id=61, path='user', component='/system/user'）
│   └── 访问路径：/permission/user
│   └── 组件文件：views/system/user/index.vue ✅
├── 角色管理（id=62, path='role', component='/system/role'）
│   └── 访问路径：/permission/role
│   └── 组件文件：views/system/role/index.vue ✅
└── 菜单管理（id=64, path='menu', component='/system/menu'）
    └── 访问路径：/permission/menu
    └── 组件文件：views/system/menu/index.vue ✅

系统管理（id=60, path='/system'）
├── 用户中心（id=63）
├── 系统设置（id=65）
├── 附件管理（id=122）
└── 多级菜单（id=66）

【关键】：
- path 是路由访问路径（拼接父子得到完整路径）
- component 是组件文件路径（直接加载对应文件）
- 两者可以不一致！前端完全支持！
*/
