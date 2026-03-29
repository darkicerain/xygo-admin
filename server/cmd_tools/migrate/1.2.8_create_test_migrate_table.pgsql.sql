-- Migration: 1.2.8
-- Description: 迁移测试 - 创建测试表

CREATE TABLE IF NOT EXISTS xy_test_migrate (
    id bigserial PRIMARY KEY,
    name varchar(64) NOT NULL DEFAULT '',
    status smallint NOT NULL DEFAULT 1,
    created_at bigint
);
COMMENT ON TABLE xy_test_migrate IS '迁移测试表（可删除）';
