-- Migration: 1.2.7
-- Description: 回滚测试 - 删除附件表的 tenant_id 字段和索引

DROP INDEX IF EXISTS idx_att_tenant;
ALTER TABLE xy_sys_attachment DROP COLUMN IF EXISTS tenant_id;
