-- ====================================================
-- 配置分组初始化 SQL
-- ====================================================
-- 说明：将配置分组信息存储在 key='config_group' 的配置项中
-- 执行此 SQL 前请确保 xy_sys_config 表已存在
-- ====================================================

-- 方式一：如果记录不存在，使用 INSERT
INSERT INTO `xy_sys_config` (
  `group`, 
  `group_name`, 
  `name`, 
  `key`, 
  `value`, 
  `type`, 
  `options`, 
  `rules`, 
  `sort`, 
  `remark`, 
  `created_by`,
  `updated_by`,
  `create_time`, 
  `update_time`
) VALUES (
  'dictionary',
  '字典配置',
  '配置分组字典',
  'config_group',
  '[{"group":"basics","groupName":"基础设置","icon":"ri:settings-3-line","description":"系统常规信息配置","sort":0},{"group":"mail","groupName":"邮件配置","icon":"ri:mail-line","description":"邮箱账号信息配置","sort":10},{"group":"oss","groupName":"对象存储","icon":"ri:cloud-line","description":"对象存储配置","sort":20},{"group":"security","groupName":"安全设置","icon":"ri:shield-line","description":"安全相关配置","sort":30}]',
  'array',
  '{"fields":[{"key":"group","type":"text","label":"分组标识","placeholder":"如 basics/mail/oss"},{"key":"groupName","type":"text","label":"分组名称","placeholder":"显示名称"},{"key":"icon","type":"text","label":"图标","placeholder":"如 ri:settings-3-line"},{"key":"description","type":"text","label":"描述","placeholder":"分组描述信息"},{"key":"sort","min":0,"type":"number","label":"排序","placeholder":"越大越靠后"}]}',
  NULL,
  10,
  '配置分组字典（支持动态添加、编辑、删除）',
  0,
  0,
  UNIX_TIMESTAMP(),
  UNIX_TIMESTAMP()
);

-- ====================================================
-- 方式二：如果记录已存在，使用 UPDATE 更新
-- ====================================================
UPDATE `xy_sys_config` 
SET 
  `value` = '[{"group":"basics","groupName":"基础设置","icon":"ri:settings-3-line","description":"系统常规信息配置","sort":0},{"group":"mail","groupName":"邮件配置","icon":"ri:mail-line","description":"邮箱账号信息配置","sort":10},{"group":"oss","groupName":"对象存储","icon":"ri:cloud-line","description":"对象存储配置","sort":20},{"group":"security","groupName":"安全设置","icon":"ri:shield-line","description":"安全相关配置","sort":30}]',
  `options` = '{"fields":[{"key":"group","type":"text","label":"分组标识","placeholder":"如 basics/mail/oss"},{"key":"groupName","type":"text","label":"分组名称","placeholder":"显示名称"},{"key":"icon","type":"text","label":"图标","placeholder":"如 ri:settings-3-line"},{"key":"description","type":"text","label":"描述","placeholder":"分组描述信息"},{"key":"sort","min":0,"type":"number","label":"排序","placeholder":"越大越靠后"}]}',
  `update_time` = UNIX_TIMESTAMP()
WHERE `key` = 'config_group';

-- ====================================================
-- 配置分组说明
-- ====================================================
-- value 字段存储的 JSON 数组结构：
-- [
--   {
--     "group": "basics",              // 分组标识（唯一）
--     "groupName": "基础设置",          // 分组名称
--     "icon": "ri:settings-3-line",   // 图标
--     "description": "系统常规信息配置", // 描述
--     "sort": 0                        // 排序
--   },
--   ...
-- ]
--
-- 通过以下接口操作配置分组：
-- 1. GET  /admin/config/group/list   - 获取配置分组列表
-- 2. POST /admin/config/group/save   - 保存配置分组（添加/编辑）
-- 3. POST /admin/config/group/delete - 删除配置分组
-- ====================================================

-- 推荐的图标：
-- basics   -> ri:settings-3-line   (基础设置)
-- mail     -> ri:mail-line          (邮件配置)
-- oss      -> ri:cloud-line         (对象存储)
-- security -> ri:shield-line        (安全设置)
-- wechat   -> ri:wechat-line        (微信配置)
-- payment  -> ri:bank-card-line     (支付配置)
-- log      -> ri:file-list-line     (日志配置)
-- token    -> ri:key-line           (令牌配置)
-- upload   -> ri:upload-cloud-line  (上传配置)
-- storage  -> ri:folder-line        (资源路径)
