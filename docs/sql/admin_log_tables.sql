-- ==========================================
-- 审计日志表（管理员登录日志 + 操作日志）
-- ==========================================

-- 1. 管理员登录日志表
DROP TABLE IF EXISTS `xy_admin_login_log`;
CREATE TABLE `xy_admin_login_log` (
  `id`          INT UNSIGNED    NOT NULL AUTO_INCREMENT  COMMENT '日志ID',
  `user_id`     INT UNSIGNED    NOT NULL DEFAULT 0       COMMENT '管理员ID（0=未知用户）',
  `username`    VARCHAR(64)     NOT NULL DEFAULT ''       COMMENT '登录账号',
  `ip`          VARCHAR(64)     NOT NULL DEFAULT ''       COMMENT '登录IP',
  `location`    VARCHAR(255)    NOT NULL DEFAULT ''       COMMENT '登录地点',
  `user_agent`  VARCHAR(500)    NOT NULL DEFAULT ''       COMMENT 'User-Agent',
  `browser`     VARCHAR(128)    NOT NULL DEFAULT ''       COMMENT '浏览器',
  `os`          VARCHAR(128)    NOT NULL DEFAULT ''       COMMENT '操作系统',
  `status`      TINYINT(1)      NOT NULL DEFAULT 1        COMMENT '状态：0=失败 1=成功',
  `message`     VARCHAR(255)    NOT NULL DEFAULT ''       COMMENT '提示消息',
  `created_at`  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id`    (`user_id`),
  KEY `idx_username`   (`username`),
  KEY `idx_status`     (`status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员登录日志';


-- 2. 操作日志表
DROP TABLE IF EXISTS `xy_admin_operation_log`;
CREATE TABLE `xy_admin_operation_log` (
  `id`             INT UNSIGNED    NOT NULL AUTO_INCREMENT  COMMENT '日志ID',
  `user_id`        INT UNSIGNED    NOT NULL DEFAULT 0       COMMENT '操作人ID',
  `username`       VARCHAR(64)     NOT NULL DEFAULT ''       COMMENT '操作人账号',
  `module`         VARCHAR(64)     NOT NULL DEFAULT ''       COMMENT '模块名称（如：用户管理、角色管理）',
  `title`          VARCHAR(255)    NOT NULL DEFAULT ''       COMMENT '操作标题/接口描述',
  `method`         VARCHAR(10)     NOT NULL DEFAULT ''       COMMENT 'HTTP方法（GET/POST/PUT/DELETE）',
  `url`            VARCHAR(500)    NOT NULL DEFAULT ''       COMMENT '请求URL',
  `ip`             VARCHAR(64)     NOT NULL DEFAULT ''       COMMENT '操作IP',
  `location`       VARCHAR(255)    NOT NULL DEFAULT ''       COMMENT '操作地点',
  `user_agent`     VARCHAR(500)    NOT NULL DEFAULT ''       COMMENT 'User-Agent',
  `request_body`   TEXT                                      COMMENT '请求参数（JSON）',
  `response_body`  TEXT                                      COMMENT '响应结果（JSON，可选截断存储）',
  `error_message`  VARCHAR(1000)   NOT NULL DEFAULT ''       COMMENT '错误信息',
  `status`         TINYINT(1)      NOT NULL DEFAULT 1        COMMENT '状态：0=失败 1=成功',
  `elapsed`        INT UNSIGNED    NOT NULL DEFAULT 0        COMMENT '耗时（毫秒）',
  `created_at`     DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id`    (`user_id`),
  KEY `idx_module`     (`module`),
  KEY `idx_status`     (`status`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员操作日志';
