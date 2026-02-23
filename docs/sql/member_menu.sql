-- 添加会员管理菜单到后台
-- 请根据实际的 parent_id 调整（这里假设放在系统管理下，或作为一级菜单）

-- 方案1：作为一级菜单
INSERT INTO `xy_admin_menu` 
(`parent_id`, `type`, `title`, `name`, `path`, `component`, `icon`, `sort`, `status`, `create_time`, `update_time`) 
VALUES 
(0, 1, '会员管理', 'Member', '/member', '', 'ri:user-star-line', 50, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 获取刚插入的菜单ID（假设为 @member_id）
SET @member_id = LAST_INSERT_ID();

-- 会员列表（子菜单）
INSERT INTO `xy_admin_menu` 
(`parent_id`, `type`, `title`, `name`, `path`, `component`, `icon`, `sort`, `status`, `create_time`, `update_time`) 
VALUES 
(@member_id, 2, '会员列表', 'MemberList', '/member/list', '/backend/member/index', 'ri:team-line', 10, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 会员分组（子菜单，后续开发）
-- INSERT INTO `xy_admin_menu` 
-- (`parent_id`, `type`, `title`, `name`, `path`, `component`, `icon`, `sort`, `status`, `create_time`, `update_time`) 
-- VALUES 
-- (@member_id, 2, '会员分组', 'MemberGroup', '/member/group', '/backend/member/group', 'ri:group-line', 20, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 按钮权限
INSERT INTO `xy_admin_menu` 
(`parent_id`, `type`, `title`, `name`, `path`, `component`, `icon`, `sort`, `status`, `create_time`, `update_time`) 
VALUES 
(@member_id, 3, '添加会员', 'MemberAdd', '', '', '', 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@member_id, 3, '编辑会员', 'MemberEdit', '', '', '', 2, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@member_id, 3, '删除会员', 'MemberDelete', '', '', '', 3, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(@member_id, 3, '重置密码', 'MemberResetPassword', '', '', '', 4, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());
