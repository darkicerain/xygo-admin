-- ============================================================
-- 代码生成器 - 菜单 SQL
-- 基于 xy_admin_menu 实际表结构
-- ============================================================

-- 开发工具目录 (type=1)
INSERT INTO `xy_admin_menu` (`parent_id`, `type`, `title`, `name`, `path`, `component`, `resource`, `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`)
VALUES (0, 1, '开发工具', 'Develop', '/develop', '/index/index', '', 'ri:code-box-line', 0, 0, '', '', '', 0, 0, 0, '', '', 0, 0, 125, 1, '开发工具目录', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

SET @devDirId = LAST_INSERT_ID();

-- 代码生成器页面 (type=2)
INSERT INTO `xy_admin_menu` (`parent_id`, `type`, `title`, `name`, `path`, `component`, `resource`, `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`, `created_by`, `updated_by`, `create_time`, `update_time`)
VALUES (@devDirId, 2, '代码生成器', 'GenCodes', 'gen-codes', '/develop/gen-codes/index', 'sys_gen_codes', 'ri:magic-line', 0, 1, '', '', '[\"GET /admin/genCodes/selects\",\"GET /admin/genCodes/tableSelect\",\"GET /admin/genCodes/columnList\",\"GET /admin/genCodes/list\",\"GET /admin/genCodes/view\",\"POST /admin/genCodes/edit\",\"POST /admin/genCodes/delete\",\"POST /admin/genCodes/preview\",\"POST /admin/genCodes/build\",\"POST /admin/genCodes/createTable\"]', 0, 0, 0, '', '', 0, 0, 1, 1, '代码生成器', 0, 0, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());
