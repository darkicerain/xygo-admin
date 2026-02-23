-- ============================================================
-- 对象存储(oss)分组配置项初始化
-- 在系统设置-对象存储中管理这些配置
-- ============================================================

-- 存储驱动选择
INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_driver', '存储驱动', 'select', '本地', '{"options":[{"label":"本地","value":"本地"},{"label":"阿里云OSS","value":"阿里云OSS"},{"label":"腾讯云COS","value":"腾讯云COS"},{"label":"七牛云","value":"七牛云"}]}', '附件上传的存储驱动类型', 1, 0);

-- 通用配置
INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'upload_max_size', '单文件最大大小', 'text', '10mb', NULL, '支持 b、kb、mb、gb，例如 10mb', 2, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'upload_allowed_suffixes', '允许的文件后缀', 'text', 'jpg,png,bmp,jpeg,gif,webp,zip,rar,wav,mp4,mp3,docx', NULL, '留空则不限制，多个用逗号分隔', 3, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'upload_allowed_mime_types', '允许的MIME类型', 'text', '', NULL, '留空表示不限制，例如 image/png,image/jpeg', 4, 0);

-- 阿里云 OSS
INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_aliyun_endpoint', '阿里云 endpoint', 'text', '', NULL, '如 oss-cn-hangzhou.aliyuncs.com', 10, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_aliyun_access_key_id', '阿里云 AccessKeyId', 'text', '', NULL, '请输入阿里云 AccessKeyId', 11, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_aliyun_access_key_secret', '阿里云 AccessKeySecret', 'password', '', NULL, '请输入阿里云 AccessKeySecret', 12, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_aliyun_bucket', '阿里云 bucket', 'text', '', NULL, '请输入阿里云 bucket', 13, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_aliyun_domain', '阿里云 domain', 'text', '', NULL, '建议配置为自定义域名/CDN，如 https://static.example.com', 14, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_aliyun_prefix', '阿里云 root', 'text', 'upload/', NULL, '可选，例如 uploads/，留空则存储根目录', 15, 0);

-- 腾讯云 COS
INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_tencent_secret_id', '腾讯云 SecretId', 'text', '', NULL, '请输入腾讯云 SecretId', 20, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_tencent_secret_key', '腾讯云 SecretKey', 'password', '', NULL, '请输入腾讯云 SecretKey', 21, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_tencent_bucket', '腾讯云 bucket', 'text', '', NULL, '如 mybucket-1250000000', 22, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_tencent_region', '腾讯云 region', 'text', '', NULL, '如 ap-guangzhou', 23, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_tencent_domain', '腾讯云 domain', 'text', '', NULL, '建议配置为自定义域名/CDN，如 https://static.example.com', 24, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_tencent_prefix', '腾讯云 root', 'text', 'upload/', NULL, '可选，例如 uploads/，留空则存储根目录', 25, 0);

-- 七牛云
INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_qiniu_access_key', '七牛 AccessKey', 'text', '', NULL, '请输入七牛 AccessKey', 30, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_qiniu_secret_key', '七牛 SecretKey', 'password', '', NULL, '请输入七牛 SecretKey', 31, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_qiniu_bucket', '七牛 bucket', 'text', '', NULL, '请输入七牛 bucket', 32, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_qiniu_domain', '七牛 domain', 'text', '', NULL, '绑定域名，如 https://img.xxx.com', 33, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_qiniu_prefix', '七牛 root', 'text', 'upload/', NULL, '可选，例如 uploads/，留空则存储根目录', 34, 0);

INSERT IGNORE INTO `xy_sys_config` (`group`, `key`, `name`, `type`, `value`, `options`, `remark`, `sort`, `allow_del`)
VALUES ('oss', 'oss_qiniu_zone', '七牛存储区域', 'select', 'huadong', '{"options":[{"label":"华东","value":"huadong"},{"label":"华北","value":"huabei"},{"label":"华南","value":"huanan"},{"label":"北美","value":"beimei"},{"label":"新加坡","value":"xinjiapo"}]}', '选择七牛云存储区域', 35, 0);
