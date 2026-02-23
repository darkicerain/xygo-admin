-- =====================================================
-- 岗位管理表结构
-- =====================================================

-- 创建岗位表
CREATE TABLE IF NOT EXISTS `xy_admin_post` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `code` VARCHAR(64) NOT NULL COMMENT '岗位编码',
  `name` VARCHAR(50) NOT NULL COMMENT '岗位名称',
  `sort` INT NOT NULL DEFAULT 0 COMMENT '排序(越小越靠前)',
  `status` TINYINT NOT NULL DEFAULT 1 COMMENT '状态:0=禁用,1=启用',
  `remark` VARCHAR(500) DEFAULT '' COMMENT '备注',
  `created_by` BIGINT UNSIGNED DEFAULT 0 COMMENT '创建人ID',
  `updated_by` BIGINT UNSIGNED DEFAULT 0 COMMENT '更新人ID',
  `create_time` INT UNSIGNED DEFAULT 0 COMMENT '创建时间',
  `update_time` INT UNSIGNED DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_code` (`code`),
  KEY `idx_status` (`status`),
  KEY `idx_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='岗位表';

-- 插入初始数据（去掉id，使用自增）
INSERT INTO `xy_admin_post` (`code`, `name`, `sort`, `status`, `remark`, `create_time`, `update_time`) VALUES
('CEO', '董事长', 1, 1, '公司最高管理者', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('CTO', '技术总监', 2, 1, '技术部门负责人', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('CFO', '财务总监', 3, 1, '财务部门负责人', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('PM', '产品经理', 4, 1, '产品规划与设计', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('DEV', '开发工程师', 5, 1, '软件开发', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('QA', '测试工程师', 6, 1, '质量保证', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
('UI', 'UI设计师', 7, 1, '用户界面设计', UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 用户岗位关联表（多对多）
CREATE TABLE IF NOT EXISTS `xy_admin_user_post` (
  `user_id` BIGINT UNSIGNED NOT NULL COMMENT '用户ID',
  `post_id` BIGINT UNSIGNED NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户岗位关联表';
