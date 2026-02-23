-- ============================================================
-- 社区问答模块建表脚本（PostgreSQL 版本）
-- 表前缀: xy_
-- ============================================================

-- ============================================================
-- 1. xy_community_category 帖子分类表
-- ============================================================

CREATE TABLE public.xy_community_category (
    id bigint NOT NULL,
    title character varying(100) DEFAULT ''::character varying NOT NULL,
    icon character varying(100) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);

COMMENT ON TABLE public.xy_community_category IS '社区帖子分类表';
COMMENT ON COLUMN public.xy_community_category.id IS '分类ID';
COMMENT ON COLUMN public.xy_community_category.title IS '分类名称';
COMMENT ON COLUMN public.xy_community_category.icon IS '图标';
COMMENT ON COLUMN public.xy_community_category.sort IS '排序(越大越靠前)';
COMMENT ON COLUMN public.xy_community_category.status IS '状态:1=正常,2=禁用';
COMMENT ON COLUMN public.xy_community_category.created_at IS '创建时间';
COMMENT ON COLUMN public.xy_community_category.updated_at IS '更新时间';

CREATE SEQUENCE public.xy_community_category_id_seq
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.xy_community_category_id_seq OWNED BY public.xy_community_category.id;
ALTER TABLE ONLY public.xy_community_category ALTER COLUMN id SET DEFAULT nextval('public.xy_community_category_id_seq'::regclass);
ALTER TABLE ONLY public.xy_community_category ADD CONSTRAINT xy_community_category_pkey PRIMARY KEY (id);

CREATE INDEX idx_community_category_status_sort ON public.xy_community_category USING btree (status, sort);

-- ============================================================
-- 2. xy_community_post 帖子表
-- ============================================================

CREATE TABLE public.xy_community_post (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    category_id bigint DEFAULT 0 NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    content text,
    tags character varying(500) DEFAULT ''::character varying NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    reply_count integer DEFAULT 0 NOT NULL,
    like_count integer DEFAULT 0 NOT NULL,
    is_top smallint DEFAULT 0 NOT NULL,
    is_essence smallint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    last_reply_at bigint DEFAULT 0 NOT NULL,
    last_reply_member_id bigint DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL,
    deleted_at bigint DEFAULT 0 NOT NULL
);

COMMENT ON TABLE public.xy_community_post IS '社区帖子表';
COMMENT ON COLUMN public.xy_community_post.id IS '帖子ID';
COMMENT ON COLUMN public.xy_community_post.member_id IS '发帖会员ID';
COMMENT ON COLUMN public.xy_community_post.category_id IS '分类ID';
COMMENT ON COLUMN public.xy_community_post.title IS '标题';
COMMENT ON COLUMN public.xy_community_post.content IS '内容(Markdown)';
COMMENT ON COLUMN public.xy_community_post.tags IS '标签(JSON数组)';
COMMENT ON COLUMN public.xy_community_post.views IS '浏览量';
COMMENT ON COLUMN public.xy_community_post.reply_count IS '回复数';
COMMENT ON COLUMN public.xy_community_post.like_count IS '点赞数';
COMMENT ON COLUMN public.xy_community_post.is_top IS '是否置顶:0=否,1=是';
COMMENT ON COLUMN public.xy_community_post.is_essence IS '是否精华:0=否,1=是';
COMMENT ON COLUMN public.xy_community_post.status IS '状态:1=正常,2=待审核,3=隐藏';
COMMENT ON COLUMN public.xy_community_post.last_reply_at IS '最后回复时间';
COMMENT ON COLUMN public.xy_community_post.last_reply_member_id IS '最后回复人ID';
COMMENT ON COLUMN public.xy_community_post.created_at IS '创建时间';
COMMENT ON COLUMN public.xy_community_post.updated_at IS '更新时间';
COMMENT ON COLUMN public.xy_community_post.deleted_at IS '删除时间(软删除)';

CREATE SEQUENCE public.xy_community_post_id_seq
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.xy_community_post_id_seq OWNED BY public.xy_community_post.id;
ALTER TABLE ONLY public.xy_community_post ALTER COLUMN id SET DEFAULT nextval('public.xy_community_post_id_seq'::regclass);
ALTER TABLE ONLY public.xy_community_post ADD CONSTRAINT xy_community_post_pkey PRIMARY KEY (id);

CREATE INDEX idx_community_post_member_id ON public.xy_community_post USING btree (member_id);
CREATE INDEX idx_community_post_category_id ON public.xy_community_post USING btree (category_id);
CREATE INDEX idx_community_post_status ON public.xy_community_post USING btree (status);
CREATE INDEX idx_community_post_is_top ON public.xy_community_post USING btree (is_top);
CREATE INDEX idx_community_post_created_at ON public.xy_community_post USING btree (created_at);
CREATE INDEX idx_community_post_last_reply_at ON public.xy_community_post USING btree (last_reply_at);
CREATE INDEX idx_community_post_deleted_at ON public.xy_community_post USING btree (deleted_at);

-- ============================================================
-- 3. xy_community_reply 帖子回复表
-- ============================================================

CREATE TABLE public.xy_community_reply (
    id bigint NOT NULL,
    post_id bigint DEFAULT 0 NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    content text,
    like_count integer DEFAULT 0 NOT NULL,
    is_accepted smallint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL,
    deleted_at bigint DEFAULT 0 NOT NULL
);

COMMENT ON TABLE public.xy_community_reply IS '社区帖子回复表';
COMMENT ON COLUMN public.xy_community_reply.id IS '回复ID';
COMMENT ON COLUMN public.xy_community_reply.post_id IS '帖子ID';
COMMENT ON COLUMN public.xy_community_reply.member_id IS '回复会员ID';
COMMENT ON COLUMN public.xy_community_reply.parent_id IS '父回复ID(0=直接回复帖子)';
COMMENT ON COLUMN public.xy_community_reply.content IS '回复内容(Markdown)';
COMMENT ON COLUMN public.xy_community_reply.like_count IS '点赞数';
COMMENT ON COLUMN public.xy_community_reply.is_accepted IS '是否被采纳:0=否,1=是';
COMMENT ON COLUMN public.xy_community_reply.status IS '状态:1=正常,2=待审核,3=隐藏';
COMMENT ON COLUMN public.xy_community_reply.created_at IS '创建时间';
COMMENT ON COLUMN public.xy_community_reply.updated_at IS '更新时间';
COMMENT ON COLUMN public.xy_community_reply.deleted_at IS '删除时间(软删除)';

CREATE SEQUENCE public.xy_community_reply_id_seq
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.xy_community_reply_id_seq OWNED BY public.xy_community_reply.id;
ALTER TABLE ONLY public.xy_community_reply ALTER COLUMN id SET DEFAULT nextval('public.xy_community_reply_id_seq'::regclass);
ALTER TABLE ONLY public.xy_community_reply ADD CONSTRAINT xy_community_reply_pkey PRIMARY KEY (id);

CREATE INDEX idx_community_reply_post_id ON public.xy_community_reply USING btree (post_id);
CREATE INDEX idx_community_reply_member_id ON public.xy_community_reply USING btree (member_id);
CREATE INDEX idx_community_reply_parent_id ON public.xy_community_reply USING btree (parent_id);
CREATE INDEX idx_community_reply_deleted_at ON public.xy_community_reply USING btree (deleted_at);

-- ============================================================
-- 4. xy_community_like 点赞记录表
-- ============================================================

CREATE TABLE public.xy_community_like (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    target_type smallint DEFAULT 0 NOT NULL,
    target_id bigint DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL
);

COMMENT ON TABLE public.xy_community_like IS '社区点赞记录表';
COMMENT ON COLUMN public.xy_community_like.id IS '记录ID';
COMMENT ON COLUMN public.xy_community_like.member_id IS '会员ID';
COMMENT ON COLUMN public.xy_community_like.target_type IS '目标类型:1=帖子,2=回复';
COMMENT ON COLUMN public.xy_community_like.target_id IS '目标ID';
COMMENT ON COLUMN public.xy_community_like.created_at IS '创建时间';

CREATE SEQUENCE public.xy_community_like_id_seq
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER SEQUENCE public.xy_community_like_id_seq OWNED BY public.xy_community_like.id;
ALTER TABLE ONLY public.xy_community_like ALTER COLUMN id SET DEFAULT nextval('public.xy_community_like_id_seq'::regclass);
ALTER TABLE ONLY public.xy_community_like ADD CONSTRAINT xy_community_like_pkey PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_community_like_unique ON public.xy_community_like USING btree (member_id, target_type, target_id);
CREATE INDEX idx_community_like_target ON public.xy_community_like USING btree (target_type, target_id);

-- ============================================================
-- Sequence 初始值
-- ============================================================

SELECT pg_catalog.setval('public.xy_community_category_id_seq', 1, false);
SELECT pg_catalog.setval('public.xy_community_post_id_seq', 1, false);
SELECT pg_catalog.setval('public.xy_community_reply_id_seq', 1, false);
SELECT pg_catalog.setval('public.xy_community_like_id_seq', 1, false);
