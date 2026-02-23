-- =====================================================
-- 消息队列菜单（挂在系统管理目录下，parent_id=60）
-- =====================================================

INSERT INTO `xy_admin_menu` (`id`, `parent_id`, `type`, `title`, `name`, `path`, `component`, `resource`, `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`)
VALUES
(250, 60, 2, '消息队列', 'QueueManage', 'queue', '/system/queue/index', '', 'ri:stack-line', 0, 1, '', '', '', 0, 0, 0, '', '', 0, 0, 85, 1, '消息队列管理', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());
