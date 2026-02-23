-- ============================================
-- 在"运维管理"(id=110)下新增登录日志和操作日志菜单
-- 当前 AUTO_INCREMENT=157，新记录从 157 开始
-- ============================================

-- ============================================
-- 1. 添加"登录日志"子菜单
-- ============================================

INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `created_by`, `updated_by`, `create_time`, `update_time`
) VALUES (
  110, 2, '登录日志', 'LoginLog', 'login-log', '/safeguard/login-log', 
  'ri:login-box-line', 0, 1, '', '', 
  '["POST /admin/log/login/list"]', 0, 0, 0, '', 
  '', 0, 0, 122, 1, '管理员登录日志',
  'admin_login_log', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);

SET @login_log_id = LAST_INSERT_ID();

-- 登录日志按钮权限
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `created_by`, `updated_by`, `create_time`, `update_time`
) VALUES 
(@login_log_id, 3, '删除日志', 'LoginLogDelete', '', '', '', 0, 0, '', '', '["POST /admin/log/login/delete"]', 0, 0, 0, '', '', 0, 0, 1, 1, '删除登录日志', 'admin_login_log', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@login_log_id, 3, '清空日志', 'LoginLogClear', '', '', '', 0, 0, '', '', '["POST /admin/log/login/clear"]', 0, 0, 0, '', '', 0, 0, 2, 1, '清空登录日志', 'admin_login_log', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- ============================================
-- 2. 添加"操作日志"子菜单
-- ============================================

INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `created_by`, `updated_by`, `create_time`, `update_time`
) VALUES (
  110, 2, '操作日志', 'OperationLog', 'operation-log', '/safeguard/operation-log', 
  'ri:file-text-line', 0, 1, '', '', 
  '["POST /admin/log/operation/list"]', 0, 0, 0, '', 
  '', 0, 0, 123, 1, '管理员操作日志',
  'admin_operation_log', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);

SET @operation_log_id = LAST_INSERT_ID();

-- 操作日志按钮权限
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `created_by`, `updated_by`, `create_time`, `update_time`
) VALUES 
(@operation_log_id, 3, '查看详情', 'OperationLogDetail', '', '', '', 0, 0, '', '', '["GET /admin/log/operation/detail"]', 0, 0, 0, '', '', 0, 0, 1, 1, '查看操作日志详情', 'admin_operation_log', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@operation_log_id, 3, '删除日志', 'OperationLogDelete', '', '', '', 0, 0, '', '', '["POST /admin/log/operation/delete"]', 0, 0, 0, '', '', 0, 0, 2, 1, '删除操作日志', 'admin_operation_log', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@operation_log_id, 3, '清空日志', 'OperationLogClear', '', '', '', 0, 0, '', '', '["POST /admin/log/operation/clear"]', 0, 0, 0, '', '', 0, 0, 3, 1, '清空操作日志', 'admin_operation_log', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- ============================================
-- 验证
-- ============================================

SELECT id, parent_id, type, title, name, path, component, sort, status 
FROM `xy_admin_menu` 
WHERE parent_id = 110 OR id = 110
ORDER BY sort;

/*
运维管理（id=110, path='/safeguard'）  ← 已存在
├── 服务器（id=111, path='server'）   ← 已存在
├── 登录日志（path='login-log', component='/safeguard/login-log'）  ← 新增
│   ├── [按钮] 删除日志
│   └── [按钮] 清空日志
└── 操作日志（path='operation-log', component='/safeguard/operation-log'）  ← 新增
    ├── [按钮] 查看详情
    ├── [按钮] 删除日志
    └── [按钮] 清空日志
*/
