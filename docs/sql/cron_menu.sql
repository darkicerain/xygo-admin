-- =====================================================
-- 定时任务菜单（挂在系统管理目录下，parent_id=60）
-- 请根据实际菜单ID调整，避免主键冲突
-- =====================================================

-- 定时任务页面菜单（type=2 页面）
INSERT INTO `xy_admin_menu` (`id`, `parent_id`, `type`, `title`, `name`, `path`, `component`, `resource`, `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`)
VALUES
(240, 60, 2, '定时任务', 'CronManage', 'cron', '/system/cron/index', 'sys_cron', 'ri:timer-line', 0, 1, '', '', '', 0, 0, 0, '', '', 0, 0, 80, 1, '定时任务管理', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 按钮权限（type=3）
INSERT INTO `xy_admin_menu` (`id`, `parent_id`, `type`, `title`, `name`, `path`, `component`, `resource`, `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`)
VALUES
(241, 240, 3, '查看', 'CronView', '', '', '', '', 0, 0, '', '', 'GET /admin/cron/list', 0, 0, 0, '', '', 0, 0, 0, 1, '', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(242, 240, 3, '新增/编辑', 'CronEdit', '', '', '', '', 0, 0, '', '', 'POST /admin/cron/save', 0, 0, 0, '', '', 0, 0, 0, 1, '', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(243, 240, 3, '删除', 'CronDelete', '', '', '', '', 0, 0, '', '', 'POST /admin/cron/delete', 0, 0, 0, '', '', 0, 0, 0, 1, '', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(244, 240, 3, '在线执行', 'CronOnlineExec', '', '', '', '', 0, 0, '', '', 'POST /admin/cron/onlineExec', 0, 0, 0, '', '', 0, 0, 0, 1, '', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());
