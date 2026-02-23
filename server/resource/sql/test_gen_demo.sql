-- ============================================================
-- 代码生成器测试表（CRUD 普通列表）
-- 用于端到端测试代码生成流程
-- ============================================================

DROP TABLE IF EXISTS `xy_demo_article`;
CREATE TABLE `xy_demo_article` (
  `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` int(10) unsigned    NOT NULL DEFAULT 0      COMMENT '分类ID',
  `title`       varchar(200)        NOT NULL DEFAULT ''      COMMENT '标题',
  `cover`       varchar(500)        NOT NULL DEFAULT ''      COMMENT '封面图',
  `summary`     varchar(500)        NOT NULL DEFAULT ''      COMMENT '摘要',
  `content`     text                                         COMMENT '内容',
  `author`      varchar(50)         NOT NULL DEFAULT ''      COMMENT '作者',
  `views`       int(10) unsigned    NOT NULL DEFAULT 0       COMMENT '浏览量',
  `sort`        int(10)             NOT NULL DEFAULT 0       COMMENT '排序',
  `status`      tinyint(1)          NOT NULL DEFAULT 1       COMMENT '状态:1=启用,0=禁用',
  `created_at`  bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '创建时间',
  `updated_at`  bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_category` (`category_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='示例文章';

-- ============================================================
-- 代码生成器测试表（Tree 树表）
-- ============================================================

DROP TABLE IF EXISTS `xy_demo_category`;
CREATE TABLE `xy_demo_category` (
  `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id`   bigint(20) unsigned NOT NULL DEFAULT 0      COMMENT '父级ID',
  `name`        varchar(100)        NOT NULL DEFAULT ''      COMMENT '分类名称',
  `icon`        varchar(100)        NOT NULL DEFAULT ''      COMMENT '图标',
  `sort`        int(10)             NOT NULL DEFAULT 0       COMMENT '排序',
  `status`      tinyint(1)          NOT NULL DEFAULT 1       COMMENT '状态:1=启用,0=禁用',
  `remark`      varchar(255)        NOT NULL DEFAULT ''      COMMENT '备注',
  `created_at`  bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '创建时间',
  `updated_at`  bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_parent` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='示例分类';

-- 插入一些测试数据
INSERT INTO `xy_demo_category` (`id`, `parent_id`, `name`, `icon`, `sort`, `status`, `remark`, `created_at`, `updated_at`) VALUES
(1, 0, '技术', 'ri:code-line', 1, 1, '技术类文章', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, 0, '生活', 'ri:heart-line', 2, 1, '生活类文章', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(3, 1, '前端', 'ri:html5-line', 1, 1, '前端技术', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(4, 1, '后端', 'ri:server-line', 2, 1, '后端技术', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(5, 2, '美食', 'ri:restaurant-line', 1, 1, '美食分享', UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

INSERT INTO `xy_demo_article` (`id`, `category_id`, `title`, `cover`, `summary`, `content`, `author`, `views`, `sort`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Vue3 组合式API指南', '', 'Vue3 Composition API 使用教程', '这是一篇关于Vue3的文章...', '张三', 100, 1, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, 4, 'GoFrame 入门教程', '', 'GoFrame v2 快速上手指南', '这是一篇关于GoFrame的文章...', '李四', 200, 2, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(3, 5, '家常菜做法', '', '简单好做的家常菜', '这是一篇美食文章...', '王五', 50, 3, 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());
