-- 社区帖子收藏表
CREATE TABLE IF NOT EXISTS xy_community_collect (
    id         bigserial    PRIMARY KEY,
    member_id  bigint       NOT NULL DEFAULT 0,
    post_id    bigint       NOT NULL DEFAULT 0,
    created_at bigint       NOT NULL DEFAULT 0
);
CREATE UNIQUE INDEX IF NOT EXISTS idx_community_collect_unique ON xy_community_collect (member_id, post_id);
CREATE INDEX IF NOT EXISTS idx_community_collect_member ON xy_community_collect (member_id);

-- 帖子表新增悬赏积分字段（如果不存在）
ALTER TABLE xy_community_post ADD COLUMN IF NOT EXISTS reward_score int NOT NULL DEFAULT 0;
