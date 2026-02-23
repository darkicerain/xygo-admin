-- =====================================================
-- 定时任务模块：任务表 + 分组表 + 执行日志表
-- =====================================================

-- 1. 定时任务分组表
CREATE TABLE IF NOT EXISTS `xy_sys_cron_group` (
  `id`          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `name`        VARCHAR(100)    NOT NULL DEFAULT '' COMMENT '分组名称',
  `sort`        INT             NOT NULL DEFAULT 0 COMMENT '排序（越小越靠前）',
  `remark`      VARCHAR(500)    NOT NULL DEFAULT '' COMMENT '备注',
  `status`      TINYINT         NOT NULL DEFAULT 1 COMMENT '状态:0禁用,1启用',
  `created_at`  INT UNSIGNED    NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at`  INT UNSIGNED    NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务分组表';

-- 初始化默认分组
INSERT INTO `xy_sys_cron_group` (`id`, `name`, `sort`, `remark`, `status`, `created_at`, `updated_at`)
VALUES
(1, '系统任务', 0, '系统内置定时任务', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, '业务任务', 10, '业务自定义定时任务', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 2. 定时任务表
CREATE TABLE IF NOT EXISTS `xy_sys_cron` (
  `id`          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `group_id`    BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '分组ID',
  `title`       VARCHAR(200)    NOT NULL DEFAULT '' COMMENT '任务标题',
  `name`        VARCHAR(100)    NOT NULL DEFAULT '' COMMENT '任务标识（唯一，对应代码注册名）',
  `params`      VARCHAR(1000)   NOT NULL DEFAULT '' COMMENT '任务参数（逗号分隔）',
  `pattern`     VARCHAR(100)    NOT NULL DEFAULT '' COMMENT 'Cron表达式',
  `policy`      TINYINT         NOT NULL DEFAULT 1 COMMENT '策略:1并行,2单例,3单次,4固定次数',
  `count`       INT             NOT NULL DEFAULT 0 COMMENT '固定次数（policy=4时有效）',
  `sort`        INT             NOT NULL DEFAULT 0 COMMENT '排序',
  `remark`      VARCHAR(500)    NOT NULL DEFAULT '' COMMENT '备注',
  `status`      TINYINT         NOT NULL DEFAULT 1 COMMENT '状态:0禁用,1启用',
  `created_at`  INT UNSIGNED    NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at`  INT UNSIGNED    NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务表';

-- 3. 定时任务执行日志表
CREATE TABLE IF NOT EXISTS `xy_sys_cron_log` (
  `id`          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `cron_id`     BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务ID',
  `name`        VARCHAR(100)    NOT NULL DEFAULT '' COMMENT '任务标识',
  `title`       VARCHAR(200)    NOT NULL DEFAULT '' COMMENT '任务标题',
  `params`      VARCHAR(1000)   NOT NULL DEFAULT '' COMMENT '执行参数',
  `status`      TINYINT         NOT NULL DEFAULT 1 COMMENT '状态:1成功,2失败',
  `output`      TEXT            COMMENT '执行输出',
  `err_msg`     TEXT            COMMENT '错误信息',
  `take_ms`     INT             NOT NULL DEFAULT 0 COMMENT '耗时(毫秒)',
  `created_at`  INT UNSIGNED    NOT NULL DEFAULT 0 COMMENT '执行时间',
  PRIMARY KEY (`id`),
  KEY `idx_cron_id` (`cron_id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务执行日志表';
