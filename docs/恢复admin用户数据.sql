-- 恢复admin用户的基本数据
-- 方案1：使用admin/admin密码（简单）
-- Salt：空字符串
-- 密码哈希：md5("admin") = "21232f297a57a5a743894a0e4a801fc3"

UPDATE `xy_admin_user` 
SET 
    `username` = 'admin',
    `nickname` = '超级管理员',
    `real_name` = '系统管理员',
    `password` = '21232f297a57a5a743894a0e4a801fc3',  -- md5("admin")
    `salt` = '',
    `gender` = 1,
    `mobile` = '15524812851',
    `email` = '751300685@qq.com',
    `address` = '辽宁省-大连市-开发区',
    `remark` = '一个又懒又爱又帅气得男人',
    `avatar` = '',
    `dept_id` = 0,
    `pid` = 0,
    `is_super` = 1,
    `status` = 1,
    `create_time` = UNIX_TIMESTAMP(),
    `update_time` = UNIX_TIMESTAMP()
WHERE `id` = 1;

-- 验证数据
SELECT * FROM `xy_admin_user` WHERE `id` = 1;
