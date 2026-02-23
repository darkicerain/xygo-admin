-- =====================================================
-- 字段权限优化：为菜单表增加resource字段
-- =====================================================

-- 1. 添加resource字段
ALTER TABLE `xy_admin_menu` 
ADD COLUMN `resource` VARCHAR(50) DEFAULT '' COMMENT '关联的数据资源（表名，用于字段权限）' AFTER `component`;

-- 2. 更新现有菜单的resource字段（根据实际数据）
-- 权限管理模块
UPDATE `xy_admin_menu` SET `resource` = 'admin_user' WHERE `id` = 61;  -- 后台用户
UPDATE `xy_admin_menu` SET `resource` = 'admin_role' WHERE `id` = 62;  -- 角色管理
UPDATE `xy_admin_menu` SET `resource` = 'admin_menu' WHERE `id` = 64;  -- 菜单管理
UPDATE `xy_admin_menu` SET `resource` = 'admin_dept' WHERE `id` = 141; -- 部门管理
UPDATE `xy_admin_menu` SET `resource` = 'admin_post' WHERE `id` = 142; -- 岗位管理

-- 系统管理模块
UPDATE `xy_admin_menu` SET `resource` = 'sys_config' WHERE `id` = 65;  -- 系统设置
UPDATE `xy_admin_menu` SET `resource` = 'sys_attachment' WHERE `id` = 122;  -- 附件管理

-- 注意：
-- 1. 只有实际操作数据的菜单（type=2）才需要设置resource
-- 2. 目录菜单（type=1）和按钮（type=3）不需要resource
-- 3. 后续新增菜单时，在创建菜单时直接设置resource字段
