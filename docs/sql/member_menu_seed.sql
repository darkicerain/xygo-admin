-- =============================================
-- 会员菜单初始数据（执行前请先执行 member_menu_upgrade.sql）
-- 包含：顶栏导航 + 用户中心菜单
-- =============================================

-- 先清空旧数据（如果有的话）
TRUNCATE TABLE `xy_member_menu`;

-- ==================== 顶栏导航菜单 ====================

INSERT INTO `xy_member_menu` (`pid`, `title`, `name`, `path`, `component`, `icon`, `menu_type`, `url`, `no_login_valid`, `extend`, `type`, `sort`, `status`) VALUES
(0, '文档',     'docs',      '/docs',      'docs/index',      'ri:book-open-line',  'tab', '', 1, 'none', 'nav', 10, 1),
(0, '案例',     'cases',     '/cases',     'cases/index',     'ri:slideshow-line',  'tab', '', 1, 'none', 'nav', 20, 1),
(0, '社区',     'community', '/community', 'community/index', 'ri:discuss-line',    'tab', '', 1, 'none', 'nav', 30, 1);

-- ==================== 用户中心菜单（会员登录后可见） ====================

-- 一级目录：我的账户
INSERT INTO `xy_member_menu` (`pid`, `title`, `name`, `path`, `component`, `icon`, `menu_type`, `url`, `no_login_valid`, `extend`, `type`, `sort`, `status`) VALUES
(0, '我的账户', 'account', '/user', '', 'ri:user-line', 'tab', '', 0, 'none', 'menu_dir', 100, 1);

-- 获取刚插入的"我的账户"的 ID（假设是 4，后面子菜单引用它）
SET @account_pid = LAST_INSERT_ID();

-- 二级菜单项
INSERT INTO `xy_member_menu` (`pid`, `title`, `name`, `path`, `component`, `icon`, `menu_type`, `url`, `no_login_valid`, `extend`, `type`, `sort`, `status`) VALUES
(@account_pid, '账户概览',   'overview',     '/user/overview',     'member/center',  'ri:home-4-line',           'tab', '', 0, 'none', 'menu', 101, 1),
(@account_pid, '每日签到',   'checkin',      '/user/checkin',      'member/center',  'ri:calendar-check-line',   'tab', '', 0, 'none', 'menu', 102, 1),
(@account_pid, '个人资料',   'profile',      '/user/profile',      'member/center',  'ri:user-line',             'tab', '', 0, 'none', 'menu', 103, 1),
(@account_pid, '修改密码',   'password',     '/user/password',     'member/center',  'ri:shield-keyhole-line',   'tab', '', 0, 'none', 'menu', 104, 1),
(@account_pid, '积分记录',   'points',       '/user/points',       'member/center',  'ri:copper-coin-line',      'tab', '', 0, 'none', 'menu', 105, 1),
(@account_pid, '余额记录',   'balance',      '/user/balance',      'member/center',  'ri:wallet-3-line',         'tab', '', 0, 'none', 'menu', 106, 1),
(@account_pid, '系统通知',   'notification', '/user/notification', 'member/center',  'ri:notification-3-line',   'tab', '', 0, 'none', 'menu', 107, 1);
