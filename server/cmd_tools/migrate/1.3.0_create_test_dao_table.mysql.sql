-- Migration: 1.3.0
-- Description: 测试 gf gen dao 联动 - 创建测试表

CREATE TABLE IF NOT EXISTS `xy_test_dao` (
    `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title` varchar(128) NOT NULL DEFAULT '' COMMENT '标题',
    `content` text COMMENT '内容',
    `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
    `created_at` bigint UNSIGNED DEFAULT NULL COMMENT '创建时间',
    `updated_at` bigint UNSIGNED DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='DAO生成测试表（可删除）';
