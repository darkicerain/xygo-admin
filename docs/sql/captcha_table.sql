-- =============================================
-- 点选验证码表（对齐 BuildAdmin 方案）
-- 用于前后台登录验证码存储，基于数据表而非缓存
-- 自动清理过期记录
-- =============================================

CREATE TABLE IF NOT EXISTS `xy_captcha` (
  `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
  `key`         varchar(64)     NOT NULL DEFAULT '' COMMENT '验证码key（MD5）',
  `code`        varchar(64)     NOT NULL DEFAULT '' COMMENT '验证码code（MD5）',
  `captcha`     text            COMMENT '验证码数据（JSON，包含点位坐标等）',
  `create_time` int unsigned    NOT NULL DEFAULT 0 COMMENT '创建时间（unix秒）',
  `expire_time` int unsigned    NOT NULL DEFAULT 0 COMMENT '过期时间（unix秒）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='点选验证码';
