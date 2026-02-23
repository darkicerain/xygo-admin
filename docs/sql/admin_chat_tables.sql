-- =============================================
-- 管理员聊天功能 - 建表SQL
-- 包含：会话表、会话成员表、聊天消息表
-- =============================================

SET NAMES utf8mb4;

-- ----------------------------
-- 1. 聊天会话表
-- ----------------------------
CREATE TABLE IF NOT EXISTS `xy_admin_chat_session` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会话ID',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '类型:1=单聊,2=群聊',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '群名称(单聊为空)',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '群头像',
  `creator_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `last_message` varchar(500) NOT NULL DEFAULT '' COMMENT '最后消息预览',
  `last_message_time` int(11) NOT NULL DEFAULT 0 COMMENT '最后消息时间戳',
  `member_count` int(11) NOT NULL DEFAULT 0 COMMENT '成员数',
  `created_at` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_creator_id` (`creator_id`),
  KEY `idx_last_message_time` (`last_message_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天会话表';

-- ----------------------------
-- 2. 聊天会话成员表
-- ----------------------------
CREATE TABLE IF NOT EXISTS `xy_admin_chat_session_member` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `session_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会话ID',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `role` tinyint(4) NOT NULL DEFAULT 1 COMMENT '角色:1=成员,2=管理员,3=群主',
  `unread_count` int(11) NOT NULL DEFAULT 0 COMMENT '未读消息数',
  `last_read_msg_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后已读消息ID',
  `is_muted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否免打扰:0=否,1=是',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除会话:0=否,1=是',
  `joined_at` int(11) NOT NULL DEFAULT 0 COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_session_user` (`session_id`, `user_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天会话成员表';

-- ----------------------------
-- 3. 聊天消息表
-- ----------------------------
CREATE TABLE IF NOT EXISTS `xy_admin_chat_message` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `session_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会话ID',
  `sender_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送者ID',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '消息类型:1=文字,2=图片,3=系统消息',
  `content` text NOT NULL COMMENT '消息内容(图片时存URL)',
  `created_at` int(11) NOT NULL DEFAULT 0 COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `idx_session_id` (`session_id`),
  KEY `idx_sender_id` (`sender_id`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天消息表';
