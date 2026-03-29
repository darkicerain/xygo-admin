-- Migration: 1.2.8
-- Description: 迁移测试 - 创建测试表

CREATE TABLE IF NOT EXISTS `xy_test_migrate` (
    `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
    `created_at` bigint UNSIGNED DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='迁移测试表（可删除）';
