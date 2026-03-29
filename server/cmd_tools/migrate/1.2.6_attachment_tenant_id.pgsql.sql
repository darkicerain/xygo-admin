-- Migration: 1.2.6
-- Description: 附件表增加 tenant_id 字段，支持按租户隔离

ALTER TABLE xy_sys_attachment ADD COLUMN IF NOT EXISTS tenant_id bigint NOT NULL DEFAULT 0;
COMMENT ON COLUMN xy_sys_attachment.tenant_id IS '所属租户ID（0=平台）';
CREATE INDEX IF NOT EXISTS idx_att_tenant ON xy_sys_attachment USING btree (tenant_id);
