-- =============================================
-- 会员中心功能表（签到、通知）
-- 积分日志和余额日志表见 member_menu_upgrade.sql
-- =============================================

-- =============================================
-- 会员签到表
-- =============================================
CREATE TABLE IF NOT EXISTS `xy_member_checkin` (
  `id`              bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id`       bigint unsigned NOT NULL DEFAULT 0 COMMENT '会员ID',
  `checkin_date`    date NOT NULL COMMENT '签到日期',
  `score`           int NOT NULL DEFAULT 0 COMMENT '本次获得积分',
  `continuous_days` int NOT NULL DEFAULT 1 COMMENT '连续签到天数',
  `created_at`      datetime DEFAULT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_member_date` (`member_id`, `checkin_date`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员签到记录';

-- =============================================
-- 会员通知表
-- =============================================
CREATE TABLE IF NOT EXISTS `xy_member_notice` (
  `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
  `title`       varchar(255) NOT NULL DEFAULT '' COMMENT '通知标题',
  `content`     text COMMENT '通知内容',
  `type`        varchar(20) NOT NULL DEFAULT 'system' COMMENT '通知类型：system=系统通知, announce=公告, feature=功能更新, maintain=维护通知',
  `target`      varchar(20) NOT NULL DEFAULT 'all' COMMENT '目标：all=全部会员, group=指定分组',
  `target_id`   bigint unsigned NOT NULL DEFAULT 0 COMMENT '目标分组ID（target=group时有效）',
  `sender`      varchar(50) NOT NULL DEFAULT '系统' COMMENT '发送者',
  `status`      tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态：0=草稿 1=已发布',
  `created_at`  datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at`  datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_status_created` (`status`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员通知';

-- =============================================
-- 会员通知已读表
-- =============================================
CREATE TABLE IF NOT EXISTS `xy_member_notice_read` (
  `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
  `notice_id`   bigint unsigned NOT NULL DEFAULT 0 COMMENT '通知ID',
  `member_id`   bigint unsigned NOT NULL DEFAULT 0 COMMENT '会员ID',
  `read_at`     datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_notice_member` (`notice_id`, `member_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员通知已读记录';

-- =============================================
-- 插入一些默认系统通知（演示数据）
-- =============================================
INSERT INTO `xy_member_notice` (`title`, `content`, `type`, `target`, `sender`, `status`, `created_at`) VALUES
('欢迎使用 XYGo Admin', '感谢您注册成为我们的会员！您可以在会员中心管理个人信息、查看积分和余额变动记录。每天记得签到领取积分哦！', 'system', 'all', '系统', 1, NOW()),
('每日签到功能上线', '全新的每日签到功能现已上线！每日签到可获得随机积分奖励，连续签到天数越多，奖励越丰厚。快来试试吧！', 'feature', 'all', '系统', 1, NOW());
