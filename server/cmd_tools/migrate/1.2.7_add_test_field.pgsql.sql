-- Migration: 1.2.7
-- Description: 测试字段 - 给 sys_config 表加 test_field

ALTER TABLE xy_sys_config ADD COLUMN IF NOT EXISTS test_field varchar(32) NOT NULL DEFAULT '';
COMMENT ON COLUMN xy_sys_config.test_field IS '测试字段（v1.2.7）';
