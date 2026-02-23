-- ============================================
-- 为已存在的"会员管理"添加"会员分组"和"会员菜单"子菜单
-- 前提：会员管理主目录ID=143已存在
-- 说明：已配置合适的图标，使用Iconify图标库
-- ============================================

-- ============================================
-- 1. 添加"会员分组"子菜单及其按钮
-- ============================================

INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `create_time`, `update_time`
) VALUES (
  143, 2, '会员分组', 'MemberGroup', 'group', '/member/group/index', 
  'ri:group-2-line', 0, 1, '', '', 
  '["POST /admin/member/group/list"]', 0, 0, 0, '', 
  '', 0, 0, 20, 1, '会员分组管理',
  'member_group', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);

SET @member_group_id = LAST_INSERT_ID();

-- 会员分组按钮权限
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `create_time`, `update_time`
) VALUES 
(@member_group_id, 3, '新增分组', 'MemberGroupAdd', '', '', '', 0, 0, '', '', '["POST /admin/member/group/save"]', 0, 0, 0, '', '', 0, 0, 1, 1, '新增会员分组', 'member_group', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@member_group_id, 3, '编辑分组', 'MemberGroupEdit', '', '', '', 0, 0, '', '', '["POST /admin/member/group/save"]', 0, 0, 0, '', '', 0, 0, 2, 1, '编辑会员分组', 'member_group', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@member_group_id, 3, '删除分组', 'MemberGroupDelete', '', '', '', 0, 0, '', '', '["POST /admin/member/group/delete"]', 0, 0, 0, '', '', 0, 0, 3, 1, '删除会员分组', 'member_group', UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- ============================================
-- 2. 添加"会员菜单"子菜单及其按钮
-- ============================================

INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `create_time`, `update_time`
) VALUES (
  143, 2, '会员菜单', 'MemberMenu', 'menu', '/member/menu/index', 
  'ri:menu-2-line', 0, 1, '', '', 
  '["GET /admin/member/menu/tree"]', 0, 0, 0, '', 
  '', 0, 0, 30, 1, '会员前台菜单管理',
  'member_menu', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()
);

SET @member_menu_id = LAST_INSERT_ID();

-- 会员菜单按钮权限
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `resource`, `create_time`, `update_time`
) VALUES 
(@member_menu_id, 3, '新增菜单', 'MemberMenuAdd', '', '', '', 0, 0, '', '', '["POST /admin/member/menu/save"]', 0, 0, 0, '', '', 0, 0, 1, 1, '新增会员菜单', 'member_menu', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@member_menu_id, 3, '编辑菜单', 'MemberMenuEdit', '', '', '', 0, 0, '', '', '["POST /admin/member/menu/save"]', 0, 0, 0, '', '', 0, 0, 2, 1, '编辑会员菜单', 'member_menu', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@member_menu_id, 3, '删除菜单', 'MemberMenuDelete', '', '', '', 0, 0, '', '', '["POST /admin/member/menu/delete"]', 0, 0, 0, '', '', 0, 0, 3, 1, '删除会员菜单', 'member_menu', UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- ============================================
-- 验证新增菜单
-- ============================================

SELECT id, parent_id, type, title, name, path, component, sort, status 
FROM `xy_admin_menu` 
WHERE parent_id = 143
ORDER BY sort;
