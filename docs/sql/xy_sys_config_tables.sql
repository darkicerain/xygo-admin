-- 系统配置表（单表：同时存定义与当前值）
-- 说明：不考虑导入导出；value 存字符串/JSON，type 决定解析。

CREATE TABLE IF NOT EXISTS `xy_sys_config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group` varchar(64) NOT NULL DEFAULT '' COMMENT '分组标识，如 basics/mail/oss',
  `group_name` varchar(64) NOT NULL DEFAULT '' COMMENT '分组名称',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '配置项显示名',
  `key` varchar(128) NOT NULL DEFAULT '' COMMENT '配置键（唯一）',
  `value` text COMMENT '配置值（字符串/JSON）',
  `type` varchar(32) NOT NULL DEFAULT 'text' COMMENT '控件类型:text/textarea/number/switch/select/radio/checkbox/json/object/array/color/upload',
  `options` json DEFAULT NULL COMMENT '组件参数/选项 JSON',
  `rules` json DEFAULT NULL COMMENT '校验规则 JSON',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序(大靠后)',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `created_by` bigint unsigned DEFAULT NULL COMMENT '创建人',
  `updated_by` bigint unsigned DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_config_key` (`key`),
  KEY `idx_group_sort` (`group`, `sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统配置（定义+当前值）';

-- 可选：预置基础分组与示例数据（供初始化使用）

