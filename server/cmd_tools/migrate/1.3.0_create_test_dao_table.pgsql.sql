-- Migration: 1.3.0
-- Description: 测试 gf gen dao 联动 - 创建测试表

CREATE TABLE IF NOT EXISTS xy_test_dao (
    id bigserial PRIMARY KEY,
    title varchar(128) NOT NULL DEFAULT '',
    content text,
    sort integer NOT NULL DEFAULT 0,
    status smallint NOT NULL DEFAULT 1,
    created_at bigint,
    updated_at bigint
);
COMMENT ON TABLE xy_test_dao IS 'DAO生成测试表（可删除）';
