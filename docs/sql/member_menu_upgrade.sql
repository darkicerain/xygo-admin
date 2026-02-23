-- =============================================
-- 会员菜单表扩展（对齐 BuildAdmin user_rule）
-- 将 type 从 1=菜单/2=按钮 扩展为 6 种类型
-- 新增 component/menu_type/url/no_login_valid/extend 字段
-- =============================================

-- 1. 修改 type 字段：从 tinyint 改为 varchar 枚举风格
ALTER TABLE `xy_member_menu`
  MODIFY COLUMN `type` varchar(20) NOT NULL DEFAULT 'menu' COMMENT '类型：route=普通路由, menu_dir=会员中心菜单目录, menu=会员中心菜单项, nav=顶栏菜单项, nav_user_menu=顶栏会员菜单下拉, button=页面按钮';

-- 2. 新增字段
ALTER TABLE `xy_member_menu`
  ADD COLUMN `component` varchar(255) NOT NULL DEFAULT '' COMMENT 'Vue组件路径（相对于views/frontend/）' AFTER `path`,
  ADD COLUMN `menu_type` varchar(20) NOT NULL DEFAULT 'tab' COMMENT '菜单打开方式：tab=标签页, link=外链, iframe=内嵌' AFTER `icon`,
  ADD COLUMN `url` varchar(500) NOT NULL DEFAULT '' COMMENT '外链/iframe地址' AFTER `menu_type`,
  ADD COLUMN `no_login_valid` tinyint(1) NOT NULL DEFAULT 0 COMMENT '未登录是否有效：0=否 1=是（公开路由）' AFTER `url`,
  ADD COLUMN `extend` varchar(20) NOT NULL DEFAULT 'none' COMMENT '扩展属性：none=无, add_rules_only=仅添加为路由, add_menu_only=仅添加为菜单' AFTER `no_login_valid`,
  ADD COLUMN `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注' AFTER `extend`;

-- 3. 把旧数据的 type 从数字转为字符串
UPDATE `xy_member_menu` SET `type` = 'menu' WHERE `type` = '1';
UPDATE `xy_member_menu` SET `type` = 'button' WHERE `type` = '2';

-- =============================================
-- 会员积分变动日志表
-- =============================================
CREATE TABLE IF NOT EXISTS `xy_member_score_log` (
  `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id`   bigint unsigned NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score`       int NOT NULL DEFAULT 0 COMMENT '变动积分（正数=增加，负数=减少）',
  `before`      int NOT NULL DEFAULT 0 COMMENT '变动前积分',
  `after`       int NOT NULL DEFAULT 0 COMMENT '变动后积分',
  `memo`        varchar(255) NOT NULL DEFAULT '' COMMENT '变动说明',
  `created_at`  datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员积分变动日志';

-- =============================================
-- 会员余额变动日志表
-- =============================================
CREATE TABLE IF NOT EXISTS `xy_member_money_log` (
  `id`          bigint unsigned NOT NULL AUTO_INCREMENT,
  `member_id`   bigint unsigned NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money`       int NOT NULL DEFAULT 0 COMMENT '变动金额（分，正数=增加，负数=减少）',
  `before`      int NOT NULL DEFAULT 0 COMMENT '变动前余额（分）',
  `after`       int NOT NULL DEFAULT 0 COMMENT '变动后余额（分）',
  `memo`        varchar(255) NOT NULL DEFAULT '' COMMENT '变动说明',
  `created_at`  datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员余额变动日志';
