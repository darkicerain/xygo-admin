-- 修复sy_sys_attachment表的id字段为自增主键

-- 步骤1：检查当前表结构
SHOW CREATE TABLE `xy_sys_attachment`;

-- 步骤2：修改id字段为AUTO_INCREMENT
ALTER TABLE `xy_sys_attachment` 
MODIFY COLUMN `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
ADD PRIMARY KEY (`id`);

-- 如果已经有主键，先删除再添加：
-- ALTER TABLE `xy_sys_attachment` DROP PRIMARY KEY;
-- ALTER TABLE `xy_sys_attachment` 
-- MODIFY COLUMN `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
-- ADD PRIMARY KEY (`id`);

-- 步骤3：验证修复结果
SHOW CREATE TABLE `xy_sys_attachment`;

-- 步骤4：测试插入
SELECT * FROM `xy_sys_attachment` ORDER BY `id` DESC LIMIT 10;
