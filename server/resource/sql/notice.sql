-- ============================================================
-- 通知系统表结构
-- ============================================================

-- 通知消息表
CREATE TABLE IF NOT EXISTS `xy_admin_notice` (
  `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title`       varchar(200)        NOT NULL DEFAULT ''      COMMENT '标题',
  `type`        tinyint(1)          NOT NULL DEFAULT 1       COMMENT '类型:1=通知,2=公告,3=私信',
  `content`     text                                         COMMENT '内容(HTML)',
  `tag`         varchar(50)         NOT NULL DEFAULT ''      COMMENT '标签(info/success/warning/danger)',
  `sender_id`   bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '发送人ID(0=系统)',
  `receiver_id` bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '接收人ID(0=全员)',
  `status`      tinyint(1)          NOT NULL DEFAULT 1       COMMENT '状态:1=正常,2=关闭',
  `sort`        int(10)             NOT NULL DEFAULT 0       COMMENT '排序',
  `remark`      varchar(255)        NOT NULL DEFAULT ''      COMMENT '备注',
  `read_count`  int(10) unsigned    NOT NULL DEFAULT 0       COMMENT '已读人数',
  `created_at`  bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '创建时间',
  `updated_at`  bigint(20) unsigned NOT NULL DEFAULT 0       COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type`),
  KEY `idx_status` (`status`),
  KEY `idx_receiver` (`receiver_id`),
  KEY `idx_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知消息表';

-- 已读记录表
CREATE TABLE IF NOT EXISTS `xy_admin_notice_read` (
  `id`        bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_id` bigint(20) unsigned NOT NULL                COMMENT '通知ID',
  `user_id`   bigint(20) unsigned NOT NULL                COMMENT '用户ID',
  `read_at`   bigint(20) unsigned NOT NULL DEFAULT 0      COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_notice_user` (`notice_id`, `user_id`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知已读记录表';
