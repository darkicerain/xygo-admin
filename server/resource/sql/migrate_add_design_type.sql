-- ============================================================
-- 代码生成器 - 字段配置表增加 design_type + extra 字段
-- 执行此 SQL 后重启后端服务
-- ============================================================

ALTER TABLE `xy_sys_gen_codes_column`
ADD COLUMN `design_type` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '设计类型(designType)' AFTER `form_type`;

ALTER TABLE `xy_sys_gen_codes_column`
ADD COLUMN `extra` TEXT DEFAULT NULL COMMENT '扩展配置JSON(关联表配置/表格属性/表单属性等)' AFTER `design_type`;
