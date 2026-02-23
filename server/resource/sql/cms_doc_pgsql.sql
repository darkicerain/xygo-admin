-- ============================================================
-- CMS 文档模块建表脚本（PostgreSQL 版本）
-- 表前缀: xy_
-- ============================================================

--
-- Name: xy_cms_doc_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xy_cms_doc_category (
    id bigint NOT NULL,
    pid bigint DEFAULT 0 NOT NULL,
    title character varying(100) DEFAULT ''::character varying NOT NULL,
    icon character varying(100) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);

COMMENT ON TABLE public.xy_cms_doc_category IS '文档分类表';
COMMENT ON COLUMN public.xy_cms_doc_category.id IS '分类ID';
COMMENT ON COLUMN public.xy_cms_doc_category.pid IS '父分类ID(0=顶级)';
COMMENT ON COLUMN public.xy_cms_doc_category.title IS '分类名称';
COMMENT ON COLUMN public.xy_cms_doc_category.icon IS '图标';
COMMENT ON COLUMN public.xy_cms_doc_category.sort IS '排序(越大越靠前)';
COMMENT ON COLUMN public.xy_cms_doc_category.status IS '状态:1=正常,2=禁用';
COMMENT ON COLUMN public.xy_cms_doc_category.remark IS '备注';
COMMENT ON COLUMN public.xy_cms_doc_category.created_at IS '创建时间';
COMMENT ON COLUMN public.xy_cms_doc_category.updated_at IS '更新时间';

--
-- Name: xy_cms_doc_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.xy_cms_doc_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.xy_cms_doc_category_id_seq OWNED BY public.xy_cms_doc_category.id;

ALTER TABLE ONLY public.xy_cms_doc_category ALTER COLUMN id SET DEFAULT nextval('public.xy_cms_doc_category_id_seq'::regclass);

--
-- Name: xy_cms_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xy_cms_doc (
    id bigint NOT NULL,
    category_id bigint DEFAULT 0 NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    slug character varying(200) DEFAULT ''::character varying NOT NULL,
    cover character varying(500) DEFAULT ''::character varying NOT NULL,
    summary character varying(500) DEFAULT ''::character varying NOT NULL,
    content text,
    author character varying(64) DEFAULT ''::character varying NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    is_top smallint DEFAULT 0 NOT NULL,
    tags character varying(500) DEFAULT ''::character varying NOT NULL,
    created_by bigint DEFAULT 0 NOT NULL,
    updated_by bigint DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL,
    deleted_at bigint DEFAULT 0 NOT NULL
);

COMMENT ON TABLE public.xy_cms_doc IS '文档内容表';
COMMENT ON COLUMN public.xy_cms_doc.id IS '文档ID';
COMMENT ON COLUMN public.xy_cms_doc.category_id IS '分类ID';
COMMENT ON COLUMN public.xy_cms_doc.title IS '文档标题';
COMMENT ON COLUMN public.xy_cms_doc.slug IS 'URL标识(唯一)';
COMMENT ON COLUMN public.xy_cms_doc.cover IS '封面图';
COMMENT ON COLUMN public.xy_cms_doc.summary IS '摘要';
COMMENT ON COLUMN public.xy_cms_doc.content IS '文档内容(Markdown)';
COMMENT ON COLUMN public.xy_cms_doc.author IS '作者';
COMMENT ON COLUMN public.xy_cms_doc.views IS '浏览量';
COMMENT ON COLUMN public.xy_cms_doc.sort IS '排序(越大越靠前)';
COMMENT ON COLUMN public.xy_cms_doc.status IS '状态:1=已发布,2=草稿,3=下架';
COMMENT ON COLUMN public.xy_cms_doc.is_top IS '是否置顶:0=否,1=是';
COMMENT ON COLUMN public.xy_cms_doc.tags IS '标签(JSON数组)';
COMMENT ON COLUMN public.xy_cms_doc.created_by IS '创建人ID';
COMMENT ON COLUMN public.xy_cms_doc.updated_by IS '更新人ID';
COMMENT ON COLUMN public.xy_cms_doc.created_at IS '创建时间';
COMMENT ON COLUMN public.xy_cms_doc.updated_at IS '更新时间';
COMMENT ON COLUMN public.xy_cms_doc.deleted_at IS '删除时间(软删除)';

--
-- Name: xy_cms_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.xy_cms_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.xy_cms_doc_id_seq OWNED BY public.xy_cms_doc.id;

ALTER TABLE ONLY public.xy_cms_doc ALTER COLUMN id SET DEFAULT nextval('public.xy_cms_doc_id_seq'::regclass);

--
-- Constraints
--

ALTER TABLE ONLY public.xy_cms_doc_category
    ADD CONSTRAINT xy_cms_doc_category_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.xy_cms_doc
    ADD CONSTRAINT xy_cms_doc_pkey PRIMARY KEY (id);

--
-- Indexes
--

CREATE INDEX idx_cms_doc_category_pid ON public.xy_cms_doc_category USING btree (pid);
CREATE INDEX idx_cms_doc_category_status_sort ON public.xy_cms_doc_category USING btree (status, sort);

CREATE UNIQUE INDEX uk_cms_doc_slug ON public.xy_cms_doc USING btree (slug);
CREATE INDEX idx_cms_doc_category_id ON public.xy_cms_doc USING btree (category_id);
CREATE INDEX idx_cms_doc_status ON public.xy_cms_doc USING btree (status);
CREATE INDEX idx_cms_doc_sort ON public.xy_cms_doc USING btree (sort);
CREATE INDEX idx_cms_doc_created_at ON public.xy_cms_doc USING btree (created_at);
CREATE INDEX idx_cms_doc_deleted_at ON public.xy_cms_doc USING btree (deleted_at);

--
-- Sequence values
--

SELECT pg_catalog.setval('public.xy_cms_doc_category_id_seq', 1, false);
SELECT pg_catalog.setval('public.xy_cms_doc_id_seq', 1, false);
