-- ============================================
-- 权限改造 - 数据库结构调整脚本
-- 执行前请先备份数据库！
-- ============================================

-- ============================================
-- 1. 为 admin_user 表添加 pid 字段（上级用户ID）
-- 用于支持"自己和直属下级"、"自己和全部下级"数据范围
-- ============================================

ALTER TABLE `admin_user` 
ADD COLUMN `pid` BIGINT UNSIGNED DEFAULT 0 COMMENT '上级用户ID（直属上级）' AFTER `dept_id`,
ADD INDEX `idx_pid` (`pid`);

-- 为现有用户初始化 pid（可选，根据实际情况调整）
-- 方案1：将创建人设为上级（如果业务逻辑符合）
-- UPDATE `admin_user` SET `pid` = `created_by` WHERE `created_by` > 0 AND `pid` = 0;

-- 方案2：超级管理员的 pid 为 0，其他用户根据实际情况手动设置
-- 不自动初始化，由管理员后续手动维护上下级关系


-- ============================================
-- 2. 创建字段权限配置表 admin_field_perm
-- 用于存储角色对特定资源字段的访问权限
-- ============================================

CREATE TABLE IF NOT EXISTS `admin_field_perm` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` BIGINT UNSIGNED NOT NULL COMMENT '角色ID',
  `module` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '模块名称（如：system、org）',
  `resource` VARCHAR(100) NOT NULL COMMENT '资源标识（表名或页面标识，如：admin_user、user_list）',
  `field_name` VARCHAR(100) NOT NULL COMMENT '字段名称（如：mobile、salary）',
  `field_label` VARCHAR(100) DEFAULT NULL COMMENT '字段显示名称（用于界面展示）',
  `perm_type` TINYINT NOT NULL DEFAULT 2 COMMENT '权限类型：0=不可见，1=只读，2=可编辑',
  `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0=禁用，1=启用',
  `remark` VARCHAR(255) DEFAULT NULL COMMENT '备注',
  `create_time` INT UNSIGNED NOT NULL COMMENT '创建时间',
  `update_time` INT UNSIGNED NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_role_resource_field` (`role_id`, `resource`, `field_name`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_resource` (`resource`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字段权限配置表';


-- ============================================
-- 3. 检查并添加 created_by 字段（数据权限过滤依赖）
-- 以下是常见表的检查和添加脚本
-- 请根据实际业务表调整
-- ============================================

-- 3.1 检查 admin_dept 是否有 created_by 字段
-- SELECT COUNT(*) FROM information_schema.COLUMNS 
-- WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'admin_dept' AND COLUMN_NAME = 'created_by';

-- 如果没有，执行以下语句添加
-- ALTER TABLE `admin_dept` 
-- ADD COLUMN `created_by` BIGINT UNSIGNED DEFAULT 0 COMMENT '创建人ID' AFTER `id`,
-- ADD INDEX `idx_created_by` (`created_by`);

-- 3.2 检查 admin_menu 是否有 created_by 字段
-- SELECT COUNT(*) FROM information_schema.COLUMNS 
-- WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'admin_menu' AND COLUMN_NAME = 'created_by';

-- 如果没有，执行以下语句添加
-- ALTER TABLE `admin_menu` 
-- ADD COLUMN `created_by` BIGINT UNSIGNED DEFAULT 0 COMMENT '创建人ID' AFTER `id`,
-- ADD INDEX `idx_created_by` (`created_by`);

-- 3.3 检查 sys_config 是否有 created_by 字段
-- SELECT COUNT(*) FROM information_schema.COLUMNS 
-- WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'sys_config' AND COLUMN_NAME = 'created_by';

-- 如果没有，执行以下语句添加
-- ALTER TABLE `sys_config` 
-- ADD COLUMN `created_by` BIGINT UNSIGNED DEFAULT 0 COMMENT '创建人ID' AFTER `id`,
-- ADD INDEX `idx_created_by` (`created_by`);

-- 3.4 其他业务表（根据实际情况添加）
-- 对于需要数据权限控制的业务表，确保有 created_by 字段
-- 格式示例：
-- ALTER TABLE `业务表名` 
-- ADD COLUMN `created_by` BIGINT UNSIGNED DEFAULT 0 COMMENT '创建人ID' AFTER `id`,
-- ADD INDEX `idx_created_by` (`created_by`);


-- ============================================
-- 4. 多租户支持字段（可选，暂时注释）
-- 如果需要支持多租户、多商户、多用户隔离，取消以下注释
-- ============================================

-- 4.1 为 admin_dept 添加部门类型字段
-- ALTER TABLE `admin_dept` 
-- ADD COLUMN `type` VARCHAR(20) DEFAULT 'dept' COMMENT '部门类型：dept=普通部门, tenant=租户, merchant=商户, user=用户' AFTER `name`,
-- ADD INDEX `idx_type` (`type`);

-- 4.2 为业务表添加租户/商户/用户隔离字段
-- 根据业务需求，为需要隔离的表添加以下字段：
-- ALTER TABLE `业务表名` 
-- ADD COLUMN `tenant_id` BIGINT UNSIGNED DEFAULT 0 COMMENT '租户ID' AFTER `id`,
-- ADD COLUMN `merchant_id` BIGINT UNSIGNED DEFAULT 0 COMMENT '商户ID' AFTER `tenant_id`,
-- ADD COLUMN `user_id` BIGINT UNSIGNED DEFAULT 0 COMMENT '用户ID' AFTER `merchant_id`,
-- ADD INDEX `idx_tenant` (`tenant_id`),
-- ADD INDEX `idx_merchant` (`merchant_id`),
-- ADD INDEX `idx_user` (`user_id`);


-- ============================================
-- 5. 初始化测试数据（可选）
-- ============================================

-- 5.1 字段权限配置说明
/*
【重要】超级管理员不需要配置字段权限！

超级管理员判断逻辑：
- ✅ 通过 admin_user.is_super = 1 判断（用户级别）
- ✅ 通过 admin_role.key = 'super' 判断（角色级别）
- ❌ 不要通过 role_id = 1 判断（ID 会变化，不可靠）

后端和前端都会自动豁免超级管理员的字段权限检查。
admin_field_perm 表只用来"限制"普通角色，而不是"授权"超级管理员。

因此：
- 超级管理员：不需要在此表中配置（代码自动豁免）
- 普通角色：只配置需要限制的字段（不配置则默认可见可编辑）
*/

-- 5.2 为普通角色配置限制性字段权限示例（假设角色ID为2）
-- 示例：手机号只读，薪资不可见
/*
INSERT INTO `admin_field_perm` (`role_id`, `module`, `resource`, `field_name`, `field_label`, `perm_type`, `status`, `create_time`, `update_time`) VALUES
(2, 'system', 'admin_user', 'username', '用户名', 2, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, 'system', 'admin_user', 'nickname', '昵称', 2, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, 'system', 'admin_user', 'mobile', '手机号', 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),  -- 只读
(2, 'system', 'admin_user', 'email', '邮箱', 2, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, 'system', 'admin_user', 'salary', '薪资', 0, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());  -- 不可见
*/


-- ============================================
-- 6. 验证脚本执行结果
-- ============================================

-- 6.1 验证 admin_user 表结构
SELECT 
    COLUMN_NAME, 
    COLUMN_TYPE, 
    COLUMN_COMMENT 
FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA = DATABASE() 
  AND TABLE_NAME = 'admin_user' 
  AND COLUMN_NAME IN ('pid', 'dept_id', 'created_by')
ORDER BY ORDINAL_POSITION;

-- 6.2 验证 admin_field_perm 表是否创建成功
SHOW CREATE TABLE `admin_field_perm`;

-- 6.3 查看 admin_field_perm 表数据
SELECT * FROM `admin_field_perm` ORDER BY `id` ASC;


-- ============================================
-- 7. 回滚脚本（仅供紧急情况使用）
-- ============================================

/*
-- 回滚：删除 admin_user.pid 字段
ALTER TABLE `admin_user` DROP COLUMN `pid`, DROP INDEX `idx_pid`;

-- 回滚：删除 admin_field_perm 表
DROP TABLE IF EXISTS `admin_field_perm`;

-- 回滚：删除业务表的 created_by 字段（根据实际情况调整）
-- ALTER TABLE `表名` DROP COLUMN `created_by`, DROP INDEX `idx_created_by`;
*/


-- ============================================
-- 执行说明
-- ============================================

/*
【执行步骤】
1. 备份数据库（必须！）
   mysqldump -u用户名 -p密码 数据库名 > backup_$(date +%Y%m%d_%H%M%S).sql

2. 连接到数据库
   mysql -u用户名 -p密码 数据库名

3. 执行本脚本
   source /path/to/权限改造-数据库脚本.sql
   
   或直接粘贴执行：
   - 先执行 1、2 部分（必须）
   - 根据需要执行 3 部分（检查并添加 created_by）
   - 根据需要执行 4 部分（多租户支持）
   - 可选执行 5 部分（测试数据）
   - 最后执行 6 部分（验证结果）

4. 验证结果
   - 检查表结构是否正确
   - 检查索引是否创建
   - 检查测试数据是否插入成功

【注意事项】
1. 本脚本会修改数据库表结构，执行前务必备份！
2. admin_user.pid 字段初始化需根据实际业务逻辑调整
3. created_by 字段检查部分需根据实际表名调整
4. 多租户支持字段为可选功能，根据需求决定是否启用
5. 生产环境建议在维护窗口期间执行

【执行时间估算】
- 小数据量（<10万条）：约 1-5 分钟
- 中数据量（10-100万条）：约 5-30 分钟
- 大数据量（>100万条）：建议分批执行或使用 pt-online-schema-change 工具

【兼容性】
- MySQL 5.7+
- MariaDB 10.2+

【下一步】
执行完本脚本后，请参考《权限改造方案.md》继续后续步骤：
- 步骤2：后端常量定义
- 步骤3：完善用户上下文
- 步骤4：实现数据权限 Handler
- ...
*/
