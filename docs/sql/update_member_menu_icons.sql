-- ============================================
-- 更新会员菜单表(member_menu)的图标字段
-- 将Element Plus图标替换为RemixIcon图标
-- ============================================

-- 用户中心 - 使用用户图标
UPDATE `member_menu` SET `icon` = 'ri:user-3-line' WHERE `id` = 1;

-- 个人资料 - 使用个人信息图标  
UPDATE `member_menu` SET `icon` = 'ri:profile-line' WHERE `id` = 2;

-- 安全设置 - 使用锁/安全图标
UPDATE `member_menu` SET `icon` = 'ri:lock-password-line' WHERE `id` = 3;

-- 消息通知 - 使用通知铃铛图标
UPDATE `member_menu` SET `icon` = 'ri:notification-3-line' WHERE `id` = 4;

-- 我的订单 - 使用订单/文件图标
UPDATE `member_menu` SET `icon` = 'ri:file-list-3-line' WHERE `id` = 5;

-- ============================================
-- 验证更新结果
-- ============================================

SELECT id, pid, title, name, path, icon, type, permission, sort, status 
FROM `member_menu` 
ORDER BY pid, sort;

-- ============================================
-- 图标说明
-- ============================================

/*
推荐的会员前台菜单图标：

用户相关：
- ri:user-3-line          用户中心
- ri:profile-line         个人资料
- ri:account-circle-line  账号信息
- ri:user-settings-line   用户设置

安全相关：
- ri:lock-password-line   安全设置/密码
- ri:shield-check-line    安全验证
- ri:fingerprint-line     指纹/生物识别

消息相关：
- ri:notification-3-line  消息通知
- ri:mail-line            邮件消息
- ri:message-3-line       聊天消息

订单/交易：
- ri:file-list-3-line     订单列表
- ri:shopping-cart-line   购物车
- ri:bill-line            账单

收藏/喜欢：
- ri:heart-3-line         我的收藏
- ri:star-line            我的关注

地址/定位：
- ri:map-pin-line         收货地址
- ri:road-map-line        地址管理

钱包/余额：
- ri:wallet-3-line        我的钱包
- ri:money-dollar-circle-line 余额/积分

设置相关：
- ri:settings-3-line      系统设置
- ri:tools-line           工具箱
*/
