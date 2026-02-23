SET client_encoding TO 'UTF8';

-- 社区搜索词记录表（用于热门搜索词统计）
CREATE TABLE IF NOT EXISTS xy_community_search_log (
    id         bigserial    PRIMARY KEY,
    keyword    varchar(100) NOT NULL,
    member_id  bigint       NOT NULL DEFAULT 0,  -- 0=游客
    created_at bigint       NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_community_search_log_keyword    ON xy_community_search_log (keyword);
CREATE INDEX IF NOT EXISTS idx_community_search_log_created_at ON xy_community_search_log (created_at);
