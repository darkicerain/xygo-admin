--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: xygonew; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA xygonew;


ALTER SCHEMA xygonew OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: xy_admin_chat_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_chat_message (
    id bigint NOT NULL,
    session_id bigint DEFAULT 0 NOT NULL,
    sender_id bigint DEFAULT 0 NOT NULL,
    type smallint DEFAULT 1 NOT NULL,
    content text NOT NULL,
    created_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_admin_chat_message OWNER TO postgres;

--
-- Name: TABLE xy_admin_chat_message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_chat_message IS '聊天消息表';


--
-- Name: COLUMN xy_admin_chat_message.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_message.id IS '消息ID';


--
-- Name: COLUMN xy_admin_chat_message.session_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_message.session_id IS '会话ID';


--
-- Name: COLUMN xy_admin_chat_message.sender_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_message.sender_id IS '发送者ID';


--
-- Name: COLUMN xy_admin_chat_message.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_message.type IS '消息类型:1=文字,2=图片,3=系统消息';


--
-- Name: COLUMN xy_admin_chat_message.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_message.content IS '消息内容(图片时存URL)';


--
-- Name: COLUMN xy_admin_chat_message.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_message.created_at IS '发送时间';


--
-- Name: xy_admin_chat_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_chat_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_chat_message_id_seq OWNER TO postgres;

--
-- Name: xy_admin_chat_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_chat_message_id_seq OWNED BY public.xy_admin_chat_message.id;


--
-- Name: xy_admin_chat_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_chat_session (
    id bigint NOT NULL,
    type smallint DEFAULT 1 NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    creator_id bigint DEFAULT 0 NOT NULL,
    last_message character varying(500) DEFAULT ''::character varying NOT NULL,
    last_message_time integer DEFAULT 0 NOT NULL,
    member_count integer DEFAULT 0 NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    updated_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_admin_chat_session OWNER TO postgres;

--
-- Name: TABLE xy_admin_chat_session; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_chat_session IS '聊天会话表';


--
-- Name: COLUMN xy_admin_chat_session.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.id IS '会话ID';


--
-- Name: COLUMN xy_admin_chat_session.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.type IS '类型:1=单聊,2=群聊';


--
-- Name: COLUMN xy_admin_chat_session.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.name IS '群名称(单聊为空)';


--
-- Name: COLUMN xy_admin_chat_session.avatar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.avatar IS '群头像';


--
-- Name: COLUMN xy_admin_chat_session.creator_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.creator_id IS '创建者ID';


--
-- Name: COLUMN xy_admin_chat_session.last_message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.last_message IS '最后消息预览';


--
-- Name: COLUMN xy_admin_chat_session.last_message_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.last_message_time IS '最后消息时间戳';


--
-- Name: COLUMN xy_admin_chat_session.member_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.member_count IS '成员数';


--
-- Name: COLUMN xy_admin_chat_session.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.created_at IS '创建时间';


--
-- Name: COLUMN xy_admin_chat_session.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session.updated_at IS '更新时间';


--
-- Name: xy_admin_chat_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_chat_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_chat_session_id_seq OWNER TO postgres;

--
-- Name: xy_admin_chat_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_chat_session_id_seq OWNED BY public.xy_admin_chat_session.id;


--
-- Name: xy_admin_chat_session_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_chat_session_member (
    id bigint NOT NULL,
    session_id bigint DEFAULT 0 NOT NULL,
    user_id bigint DEFAULT 0 NOT NULL,
    role smallint DEFAULT 1 NOT NULL,
    unread_count integer DEFAULT 0 NOT NULL,
    last_read_msg_id bigint DEFAULT 0 NOT NULL,
    is_muted smallint DEFAULT 0 NOT NULL,
    is_deleted smallint DEFAULT 0 NOT NULL,
    joined_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_admin_chat_session_member OWNER TO postgres;

--
-- Name: TABLE xy_admin_chat_session_member; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_chat_session_member IS '聊天会话成员表';


--
-- Name: COLUMN xy_admin_chat_session_member.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.id IS '主键';


--
-- Name: COLUMN xy_admin_chat_session_member.session_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.session_id IS '会话ID';


--
-- Name: COLUMN xy_admin_chat_session_member.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.user_id IS '用户ID';


--
-- Name: COLUMN xy_admin_chat_session_member.role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.role IS '角色:1=成员,2=管理员,3=群主';


--
-- Name: COLUMN xy_admin_chat_session_member.unread_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.unread_count IS '未读消息数';


--
-- Name: COLUMN xy_admin_chat_session_member.last_read_msg_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.last_read_msg_id IS '最后已读消息ID';


--
-- Name: COLUMN xy_admin_chat_session_member.is_muted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.is_muted IS '是否免打扰:0=否,1=是';


--
-- Name: COLUMN xy_admin_chat_session_member.is_deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.is_deleted IS '是否删除会话:0=否,1=是';


--
-- Name: COLUMN xy_admin_chat_session_member.joined_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_chat_session_member.joined_at IS '加入时间';


--
-- Name: xy_admin_chat_session_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_chat_session_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_chat_session_member_id_seq OWNER TO postgres;

--
-- Name: xy_admin_chat_session_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_chat_session_member_id_seq OWNED BY public.xy_admin_chat_session_member.id;


--
-- Name: xy_admin_dept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_dept (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    name character varying(50) NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(500),
    create_by bigint DEFAULT 0,
    create_time bigint,
    update_time bigint
);


ALTER TABLE public.xy_admin_dept OWNER TO postgres;

--
-- Name: TABLE xy_admin_dept; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_dept IS '部门管理';


--
-- Name: COLUMN xy_admin_dept.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.id IS '部门ID';


--
-- Name: COLUMN xy_admin_dept.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.parent_id IS '上级部门ID';


--
-- Name: COLUMN xy_admin_dept.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.name IS '部门名称';


--
-- Name: COLUMN xy_admin_dept.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.sort IS '排序';


--
-- Name: COLUMN xy_admin_dept.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.status IS '状态:0禁用,1启用';


--
-- Name: COLUMN xy_admin_dept.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.remark IS '备注';


--
-- Name: COLUMN xy_admin_dept.create_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.create_by IS '创建人';


--
-- Name: COLUMN xy_admin_dept.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.create_time IS '创建时间';


--
-- Name: COLUMN xy_admin_dept.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept.update_time IS '更新时间';


--
-- Name: xy_admin_dept_closure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_dept_closure (
    id bigint NOT NULL,
    ancestor bigint NOT NULL,
    descendant bigint NOT NULL,
    level integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_admin_dept_closure OWNER TO postgres;

--
-- Name: TABLE xy_admin_dept_closure; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_dept_closure IS '部门闭包表';


--
-- Name: COLUMN xy_admin_dept_closure.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept_closure.id IS 'ID';


--
-- Name: COLUMN xy_admin_dept_closure.ancestor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept_closure.ancestor IS '祖先部门ID';


--
-- Name: COLUMN xy_admin_dept_closure.descendant; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept_closure.descendant IS '后代部门ID';


--
-- Name: COLUMN xy_admin_dept_closure.level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_dept_closure.level IS '层级深度';


--
-- Name: xy_admin_dept_closure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_dept_closure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_dept_closure_id_seq OWNER TO postgres;

--
-- Name: xy_admin_dept_closure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_dept_closure_id_seq OWNED BY public.xy_admin_dept_closure.id;


--
-- Name: xy_admin_dept_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_dept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_dept_id_seq OWNER TO postgres;

--
-- Name: xy_admin_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_dept_id_seq OWNED BY public.xy_admin_dept.id;


--
-- Name: xy_admin_field_perm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_field_perm (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    module character varying(50) DEFAULT ''::character varying NOT NULL,
    resource character varying(100) NOT NULL,
    field_name character varying(100) NOT NULL,
    field_label character varying(100),
    perm_type smallint DEFAULT 2 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(255),
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE public.xy_admin_field_perm OWNER TO postgres;

--
-- Name: TABLE xy_admin_field_perm; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_field_perm IS '字段权限配置表';


--
-- Name: COLUMN xy_admin_field_perm.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.id IS '主键';


--
-- Name: COLUMN xy_admin_field_perm.role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.role_id IS '角色ID';


--
-- Name: COLUMN xy_admin_field_perm.module; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.module IS '模块名称（如：system、org）';


--
-- Name: COLUMN xy_admin_field_perm.resource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.resource IS '资源标识（表名或页面标识，如：admin_user、user_list）';


--
-- Name: COLUMN xy_admin_field_perm.field_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.field_name IS '字段名称（如：mobile、salary）';


--
-- Name: COLUMN xy_admin_field_perm.field_label; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.field_label IS '字段显示名称（用于界面展示）';


--
-- Name: COLUMN xy_admin_field_perm.perm_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.perm_type IS '权限类型：0=不可见，1=只读，2=可编辑';


--
-- Name: COLUMN xy_admin_field_perm.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.status IS '状态：0=禁用，1=启用';


--
-- Name: COLUMN xy_admin_field_perm.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.remark IS '备注';


--
-- Name: COLUMN xy_admin_field_perm.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.create_time IS '创建时间';


--
-- Name: COLUMN xy_admin_field_perm.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_field_perm.update_time IS '更新时间';


--
-- Name: xy_admin_field_perm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_field_perm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_field_perm_id_seq OWNER TO postgres;

--
-- Name: xy_admin_field_perm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_field_perm_id_seq OWNED BY public.xy_admin_field_perm.id;


--
-- Name: xy_admin_login_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_login_log (
    id bigint NOT NULL,
    user_id bigint DEFAULT 0 NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    ip character varying(64) DEFAULT ''::character varying NOT NULL,
    location character varying(255) DEFAULT ''::character varying NOT NULL,
    user_agent character varying(500) DEFAULT ''::character varying NOT NULL,
    browser character varying(128) DEFAULT ''::character varying NOT NULL,
    os character varying(128) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    message character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE public.xy_admin_login_log OWNER TO postgres;

--
-- Name: TABLE xy_admin_login_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_login_log IS '管理员登录日志';


--
-- Name: COLUMN xy_admin_login_log.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.id IS '日志ID';


--
-- Name: COLUMN xy_admin_login_log.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.user_id IS '管理员ID（0=未知用户）';


--
-- Name: COLUMN xy_admin_login_log.username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.username IS '登录账号';


--
-- Name: COLUMN xy_admin_login_log.ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.ip IS '登录IP';


--
-- Name: COLUMN xy_admin_login_log.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.location IS '登录地点';


--
-- Name: COLUMN xy_admin_login_log.user_agent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.user_agent IS 'User-Agent';


--
-- Name: COLUMN xy_admin_login_log.browser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.browser IS '浏览器';


--
-- Name: COLUMN xy_admin_login_log.os; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.os IS '操作系统';


--
-- Name: COLUMN xy_admin_login_log.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.status IS '状态：0=失败 1=成功';


--
-- Name: COLUMN xy_admin_login_log.message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.message IS '提示消息';


--
-- Name: COLUMN xy_admin_login_log.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_login_log.created_at IS '创建时间';


--
-- Name: xy_admin_login_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_login_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_login_log_id_seq OWNER TO postgres;

--
-- Name: xy_admin_login_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_login_log_id_seq OWNED BY public.xy_admin_login_log.id;


--
-- Name: xy_admin_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_menu (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    type smallint DEFAULT 1 NOT NULL,
    title character varying(50) NOT NULL,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    path character varying(100) DEFAULT ''::character varying NOT NULL,
    component character varying(100) DEFAULT ''::character varying NOT NULL,
    resource character varying(50) DEFAULT ''::character varying,
    icon character varying(50) DEFAULT ''::character varying NOT NULL,
    hidden smallint DEFAULT 0 NOT NULL,
    keep_alive smallint DEFAULT 0 NOT NULL,
    redirect character varying(100) DEFAULT ''::character varying NOT NULL,
    frame_src character varying(255) DEFAULT ''::character varying NOT NULL,
    perms text,
    is_frame smallint DEFAULT 0 NOT NULL,
    affix smallint DEFAULT 0 NOT NULL,
    show_badge smallint DEFAULT 0 NOT NULL,
    badge_text character varying(50) DEFAULT ''::character varying NOT NULL,
    active_path character varying(255) DEFAULT ''::character varying NOT NULL,
    hide_tab smallint DEFAULT 0 NOT NULL,
    is_full_page smallint DEFAULT 0 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_by bigint DEFAULT 0 NOT NULL,
    updated_by bigint DEFAULT 0 NOT NULL,
    create_time integer NOT NULL,
    update_time integer NOT NULL
);


ALTER TABLE public.xy_admin_menu OWNER TO postgres;

--
-- Name: TABLE xy_admin_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_menu IS '后台菜单/权限表';


--
-- Name: COLUMN xy_admin_menu.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.id IS '菜单ID';


--
-- Name: COLUMN xy_admin_menu.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.parent_id IS '上级菜单ID';


--
-- Name: COLUMN xy_admin_menu.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.type IS '类型:1=目录,2=菜单,3=按钮';


--
-- Name: COLUMN xy_admin_menu.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.title IS '标题(菜单名称)';


--
-- Name: COLUMN xy_admin_menu.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.name IS '前端路由name';


--
-- Name: COLUMN xy_admin_menu.path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.path IS '路由路径';


--
-- Name: COLUMN xy_admin_menu.component; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.component IS '前端组件路径';


--
-- Name: COLUMN xy_admin_menu.resource; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.resource IS '关联的数据资源（表名，用于字段权限）';


--
-- Name: COLUMN xy_admin_menu.icon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.icon IS '图标';


--
-- Name: COLUMN xy_admin_menu.hidden; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.hidden IS '是否隐藏:0=否,1=是';


--
-- Name: COLUMN xy_admin_menu.keep_alive; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.keep_alive IS '是否缓存:0=否,1=是';


--
-- Name: COLUMN xy_admin_menu.redirect; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.redirect IS '重定向地址';


--
-- Name: COLUMN xy_admin_menu.frame_src; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.frame_src IS '内嵌iframe地址';


--
-- Name: COLUMN xy_admin_menu.perms; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.perms IS '权限点列表(JSON数组,内容为 METHOD+PATH 字符串)';


--
-- Name: COLUMN xy_admin_menu.is_frame; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.is_frame IS '是否内嵌:0=否,1=是';


--
-- Name: COLUMN xy_admin_menu.affix; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.affix IS '是否固定标签:0=否,1=是';


--
-- Name: COLUMN xy_admin_menu.show_badge; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.show_badge IS '是否显示徽章:0=否,1=是';


--
-- Name: COLUMN xy_admin_menu.badge_text; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.badge_text IS '徽章文本';


--
-- Name: COLUMN xy_admin_menu.active_path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.active_path IS '激活高亮路径';


--
-- Name: COLUMN xy_admin_menu.hide_tab; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.hide_tab IS '是否隐藏标签:0=否,1=是';


--
-- Name: COLUMN xy_admin_menu.is_full_page; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.is_full_page IS '是否全屏页面:0=否,1=是';


--
-- Name: COLUMN xy_admin_menu.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.sort IS '排序(越大越靠后)';


--
-- Name: COLUMN xy_admin_menu.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.status IS '状态:0=禁用,1=启用';


--
-- Name: COLUMN xy_admin_menu.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.remark IS '备注';


--
-- Name: COLUMN xy_admin_menu.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.created_by IS '创建人ID';


--
-- Name: COLUMN xy_admin_menu.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.updated_by IS '更新人ID';


--
-- Name: COLUMN xy_admin_menu.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.create_time IS '创建时间';


--
-- Name: COLUMN xy_admin_menu.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_menu.update_time IS '更新时间';


--
-- Name: xy_admin_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_menu_id_seq OWNER TO postgres;

--
-- Name: xy_admin_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_menu_id_seq OWNED BY public.xy_admin_menu.id;


--
-- Name: xy_admin_notice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_notice (
    id bigint NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    type smallint DEFAULT 1 NOT NULL,
    content text,
    tag character varying(50) DEFAULT ''::character varying NOT NULL,
    sender_id bigint DEFAULT 0 NOT NULL,
    receiver_id bigint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    read_count integer DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_admin_notice OWNER TO postgres;

--
-- Name: TABLE xy_admin_notice; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_notice IS '通知消息表';


--
-- Name: COLUMN xy_admin_notice.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.id IS '主键';


--
-- Name: COLUMN xy_admin_notice.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.title IS '标题';


--
-- Name: COLUMN xy_admin_notice.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.type IS '类型:1=通知,2=公告,3=私信';


--
-- Name: COLUMN xy_admin_notice.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.content IS '内容(HTML)';


--
-- Name: COLUMN xy_admin_notice.tag; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.tag IS '标签(info/success/warning/danger)';


--
-- Name: COLUMN xy_admin_notice.sender_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.sender_id IS '发送人ID(0=系统)';


--
-- Name: COLUMN xy_admin_notice.receiver_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.receiver_id IS '接收人ID(0=全员)';


--
-- Name: COLUMN xy_admin_notice.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.status IS '状态:1=正常,2=关闭';


--
-- Name: COLUMN xy_admin_notice.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.sort IS '排序';


--
-- Name: COLUMN xy_admin_notice.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.remark IS '备注';


--
-- Name: COLUMN xy_admin_notice.read_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.read_count IS '已读人数';


--
-- Name: COLUMN xy_admin_notice.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.created_at IS '创建时间';


--
-- Name: COLUMN xy_admin_notice.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice.updated_at IS '更新时间';


--
-- Name: xy_admin_notice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_notice_id_seq OWNER TO postgres;

--
-- Name: xy_admin_notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_notice_id_seq OWNED BY public.xy_admin_notice.id;


--
-- Name: xy_admin_notice_read; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_notice_read (
    id bigint NOT NULL,
    notice_id bigint NOT NULL,
    user_id bigint NOT NULL,
    read_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_admin_notice_read OWNER TO postgres;

--
-- Name: TABLE xy_admin_notice_read; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_notice_read IS '通知已读记录表';


--
-- Name: COLUMN xy_admin_notice_read.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice_read.id IS '主键';


--
-- Name: COLUMN xy_admin_notice_read.notice_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice_read.notice_id IS '通知ID';


--
-- Name: COLUMN xy_admin_notice_read.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice_read.user_id IS '用户ID';


--
-- Name: COLUMN xy_admin_notice_read.read_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_notice_read.read_at IS '阅读时间';


--
-- Name: xy_admin_notice_read_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_notice_read_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_notice_read_id_seq OWNER TO postgres;

--
-- Name: xy_admin_notice_read_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_notice_read_id_seq OWNED BY public.xy_admin_notice_read.id;


--
-- Name: xy_admin_operation_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_operation_log (
    id bigint NOT NULL,
    user_id bigint DEFAULT 0 NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    module character varying(64) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    method character varying(10) DEFAULT ''::character varying NOT NULL,
    url character varying(500) DEFAULT ''::character varying NOT NULL,
    ip character varying(64) DEFAULT ''::character varying NOT NULL,
    location character varying(255) DEFAULT ''::character varying NOT NULL,
    user_agent character varying(500) DEFAULT ''::character varying NOT NULL,
    request_body text,
    response_body text,
    error_message character varying(1000) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    elapsed integer DEFAULT 0 NOT NULL,
    created_at bigint
);


ALTER TABLE public.xy_admin_operation_log OWNER TO postgres;

--
-- Name: TABLE xy_admin_operation_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_operation_log IS '管理员操作日志';


--
-- Name: COLUMN xy_admin_operation_log.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.id IS '日志ID';


--
-- Name: COLUMN xy_admin_operation_log.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.user_id IS '操作人ID';


--
-- Name: COLUMN xy_admin_operation_log.username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.username IS '操作人账号';


--
-- Name: COLUMN xy_admin_operation_log.module; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.module IS '模块名称（如：用户管理、角色管理）';


--
-- Name: COLUMN xy_admin_operation_log.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.title IS '操作标题/接口描述';


--
-- Name: COLUMN xy_admin_operation_log.method; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.method IS 'HTTP方法（GET/POST/PUT/DELETE）';


--
-- Name: COLUMN xy_admin_operation_log.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.url IS '请求URL';


--
-- Name: COLUMN xy_admin_operation_log.ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.ip IS '操作IP';


--
-- Name: COLUMN xy_admin_operation_log.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.location IS '操作地点';


--
-- Name: COLUMN xy_admin_operation_log.user_agent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.user_agent IS 'User-Agent';


--
-- Name: COLUMN xy_admin_operation_log.request_body; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.request_body IS '请求参数（JSON）';


--
-- Name: COLUMN xy_admin_operation_log.response_body; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.response_body IS '响应结果（JSON，可选截断存储）';


--
-- Name: COLUMN xy_admin_operation_log.error_message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.error_message IS '错误信息';


--
-- Name: COLUMN xy_admin_operation_log.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.status IS '状态：0=失败 1=成功';


--
-- Name: COLUMN xy_admin_operation_log.elapsed; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.elapsed IS '耗时（毫秒）';


--
-- Name: COLUMN xy_admin_operation_log.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_operation_log.created_at IS '创建时间';


--
-- Name: xy_admin_operation_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_operation_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_operation_log_id_seq OWNER TO postgres;

--
-- Name: xy_admin_operation_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_operation_log_id_seq OWNED BY public.xy_admin_operation_log.id;


--
-- Name: xy_admin_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_post (
    id bigint NOT NULL,
    code character varying(64) NOT NULL,
    name character varying(50) NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(500) DEFAULT ''::character varying,
    created_by bigint DEFAULT 0,
    updated_by bigint DEFAULT 0,
    create_time bigint DEFAULT 0,
    update_time bigint DEFAULT 0
);


ALTER TABLE public.xy_admin_post OWNER TO postgres;

--
-- Name: TABLE xy_admin_post; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_post IS '岗位表';


--
-- Name: COLUMN xy_admin_post.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.id IS '岗位ID';


--
-- Name: COLUMN xy_admin_post.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.code IS '岗位编码';


--
-- Name: COLUMN xy_admin_post.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.name IS '岗位名称';


--
-- Name: COLUMN xy_admin_post.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.sort IS '排序(越小越靠前)';


--
-- Name: COLUMN xy_admin_post.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.status IS '状态:0=禁用,1=启用';


--
-- Name: COLUMN xy_admin_post.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.remark IS '备注';


--
-- Name: COLUMN xy_admin_post.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.created_by IS '创建人ID';


--
-- Name: COLUMN xy_admin_post.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.updated_by IS '更新人ID';


--
-- Name: COLUMN xy_admin_post.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.create_time IS '创建时间';


--
-- Name: COLUMN xy_admin_post.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_post.update_time IS '更新时间';


--
-- Name: xy_admin_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_post_id_seq OWNER TO postgres;

--
-- Name: xy_admin_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_post_id_seq OWNED BY public.xy_admin_post.id;


--
-- Name: xy_admin_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_role (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    data_scope smallint DEFAULT 0 NOT NULL,
    custom_depts text,
    pid bigint DEFAULT 0 NOT NULL,
    level bigint DEFAULT '1'::bigint NOT NULL,
    tree character varying(255) DEFAULT '0'::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_by bigint DEFAULT 0 NOT NULL,
    updated_by bigint DEFAULT 0 NOT NULL,
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE public.xy_admin_role OWNER TO postgres;

--
-- Name: TABLE xy_admin_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_role IS '后台角色表';


--
-- Name: COLUMN xy_admin_role.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.id IS '角色ID';


--
-- Name: COLUMN xy_admin_role.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.name IS '角色名称';


--
-- Name: COLUMN xy_admin_role.key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.key IS '角色标识(英文唯一)';


--
-- Name: COLUMN xy_admin_role.data_scope; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.data_scope IS '数据范围:0=全部,1=本部门,2=本部门及子,3=仅本人,4=自定义部门';


--
-- Name: COLUMN xy_admin_role.custom_depts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.custom_depts IS '自定义数据范围部门ID列表(JSON数组)';


--
-- Name: COLUMN xy_admin_role.pid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.pid IS '上级角色ID';


--
-- Name: COLUMN xy_admin_role.level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.level IS '关系树等级（根为1）';


--
-- Name: COLUMN xy_admin_role.tree; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.tree IS '关系树路径，如 0,1,3';


--
-- Name: COLUMN xy_admin_role.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.sort IS '排序（越小越靠前）';


--
-- Name: COLUMN xy_admin_role.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.status IS '状态:0=禁用,1=启用';


--
-- Name: COLUMN xy_admin_role.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.remark IS '备注';


--
-- Name: COLUMN xy_admin_role.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.created_by IS '创建人ID';


--
-- Name: COLUMN xy_admin_role.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.updated_by IS '更新人ID';


--
-- Name: COLUMN xy_admin_role.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.create_time IS '创建时间';


--
-- Name: COLUMN xy_admin_role.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role.update_time IS '更新时间';


--
-- Name: xy_admin_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_role_id_seq OWNER TO postgres;

--
-- Name: xy_admin_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_role_id_seq OWNED BY public.xy_admin_role.id;


--
-- Name: xy_admin_role_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_role_menu (
    role_id bigint NOT NULL,
    menu_id bigint NOT NULL
);


ALTER TABLE public.xy_admin_role_menu OWNER TO postgres;

--
-- Name: TABLE xy_admin_role_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_role_menu IS '角色-菜单关联表';


--
-- Name: COLUMN xy_admin_role_menu.role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role_menu.role_id IS '角色ID';


--
-- Name: COLUMN xy_admin_role_menu.menu_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_role_menu.menu_id IS '菜单ID';


--
-- Name: xy_admin_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_user (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    nickname character varying(50) DEFAULT ''::character varying NOT NULL,
    real_name character varying(50),
    password character varying(255) NOT NULL,
    gender smallint DEFAULT 0 NOT NULL,
    salt character varying(50) DEFAULT ''::character varying NOT NULL,
    mobile character varying(20) DEFAULT ''::character varying NOT NULL,
    address character varying(255),
    remark character varying(500),
    email character varying(100) DEFAULT ''::character varying NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    dept_id bigint DEFAULT 0 NOT NULL,
    pid bigint DEFAULT 0,
    is_super smallint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    last_login_at bigint,
    last_login_ip character varying(50) DEFAULT ''::character varying NOT NULL,
    created_by bigint DEFAULT 0 NOT NULL,
    updated_by bigint DEFAULT 0 NOT NULL,
    create_time bigint,
    update_time bigint
);


ALTER TABLE public.xy_admin_user OWNER TO postgres;

--
-- Name: TABLE xy_admin_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_user IS '后台管理员表';


--
-- Name: COLUMN xy_admin_user.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.id IS '管理员ID';


--
-- Name: COLUMN xy_admin_user.username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.username IS '登录账号';


--
-- Name: COLUMN xy_admin_user.nickname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.nickname IS '昵称';


--
-- Name: COLUMN xy_admin_user.real_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.real_name IS '真实姓名';


--
-- Name: COLUMN xy_admin_user.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.password IS '密码哈希';


--
-- Name: COLUMN xy_admin_user.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.gender IS '性别0保密 1男 2女';


--
-- Name: COLUMN xy_admin_user.salt; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.salt IS '密码盐';


--
-- Name: COLUMN xy_admin_user.mobile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.mobile IS '手机号';


--
-- Name: COLUMN xy_admin_user.address; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.address IS '地址';


--
-- Name: COLUMN xy_admin_user.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.remark IS '个人简介';


--
-- Name: COLUMN xy_admin_user.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.email IS '邮箱';


--
-- Name: COLUMN xy_admin_user.avatar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.avatar IS '头像';


--
-- Name: COLUMN xy_admin_user.dept_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.dept_id IS '部门ID';


--
-- Name: COLUMN xy_admin_user.pid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.pid IS '上级用户ID（直属上级）';


--
-- Name: COLUMN xy_admin_user.is_super; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.is_super IS '是否超管:0=否,1=是';


--
-- Name: COLUMN xy_admin_user.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.status IS '状态:0=禁用,1=启用';


--
-- Name: COLUMN xy_admin_user.last_login_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.last_login_at IS 'last login time';


--
-- Name: COLUMN xy_admin_user.last_login_ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.last_login_ip IS '最后登录IP';


--
-- Name: COLUMN xy_admin_user.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.created_by IS '创建人ID';


--
-- Name: COLUMN xy_admin_user.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.updated_by IS '更新人ID';


--
-- Name: COLUMN xy_admin_user.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.create_time IS '创建时间';


--
-- Name: COLUMN xy_admin_user.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user.update_time IS '更新时间';


--
-- Name: xy_admin_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_admin_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_admin_user_id_seq OWNER TO postgres;

--
-- Name: xy_admin_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_admin_user_id_seq OWNED BY public.xy_admin_user.id;


--
-- Name: xy_admin_user_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_user_post (
    user_id bigint NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE public.xy_admin_user_post OWNER TO postgres;

--
-- Name: TABLE xy_admin_user_post; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_user_post IS '用户岗位关联表';


--
-- Name: COLUMN xy_admin_user_post.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user_post.user_id IS '用户ID';


--
-- Name: COLUMN xy_admin_user_post.post_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user_post.post_id IS '岗位ID';


--
-- Name: xy_admin_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_admin_user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.xy_admin_user_role OWNER TO postgres;

--
-- Name: TABLE xy_admin_user_role; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_admin_user_role IS '管理员-角色关联表';


--
-- Name: COLUMN xy_admin_user_role.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user_role.user_id IS '管理员ID';


--
-- Name: COLUMN xy_admin_user_role.role_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_admin_user_role.role_id IS '角色ID';


--
-- Name: xy_captcha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_captcha (
    id bigint NOT NULL,
    key character varying(64) DEFAULT ''::character varying NOT NULL,
    code character varying(64) DEFAULT ''::character varying NOT NULL,
    captcha text,
    create_time bigint DEFAULT 0 NOT NULL,
    expire_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_captcha OWNER TO postgres;

--
-- Name: TABLE xy_captcha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_captcha IS '点选验证码';


--
-- Name: COLUMN xy_captcha.key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_captcha.key IS '验证码key（MD5）';


--
-- Name: COLUMN xy_captcha.code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_captcha.code IS '验证码code（MD5）';


--
-- Name: COLUMN xy_captcha.captcha; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_captcha.captcha IS '验证码数据（JSON，包含点位坐标等）';


--
-- Name: COLUMN xy_captcha.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_captcha.create_time IS '创建时间（unix秒）';


--
-- Name: COLUMN xy_captcha.expire_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_captcha.expire_time IS '过期时间（unix秒）';


--
-- Name: xy_captcha_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_captcha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_captcha_id_seq OWNER TO postgres;

--
-- Name: xy_captcha_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_captcha_id_seq OWNED BY public.xy_captcha.id;


--
-- Name: xy_cms_case; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_cms_case (
    id bigint NOT NULL,
    category_id bigint DEFAULT 0 NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    cover character varying(500) DEFAULT ''::character varying NOT NULL,
    summary character varying(500) DEFAULT ''::character varying NOT NULL,
    content text,
    link character varying(500) DEFAULT ''::character varying NOT NULL,
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


ALTER TABLE public.xy_cms_case OWNER TO postgres;

--
-- Name: TABLE xy_cms_case; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_cms_case IS '案例内容表';


--
-- Name: COLUMN xy_cms_case.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.id IS '案例ID';


--
-- Name: COLUMN xy_cms_case.category_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.category_id IS '分类ID';


--
-- Name: COLUMN xy_cms_case.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.title IS '案例标题';


--
-- Name: COLUMN xy_cms_case.cover; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.cover IS '封面图';


--
-- Name: COLUMN xy_cms_case.summary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.summary IS '摘要';


--
-- Name: COLUMN xy_cms_case.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.content IS '案例详情(Markdown)';


--
-- Name: COLUMN xy_cms_case.link; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.link IS '外部链接';


--
-- Name: COLUMN xy_cms_case.views; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.views IS '浏览量';


--
-- Name: COLUMN xy_cms_case.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.sort IS '排序(越大越靠前)';


--
-- Name: COLUMN xy_cms_case.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.status IS '状态:1=已发布,2=草稿,3=下架';


--
-- Name: COLUMN xy_cms_case.is_top; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.is_top IS '是否置顶:0=否,1=是';


--
-- Name: COLUMN xy_cms_case.tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.tags IS '标签(JSON数组)';


--
-- Name: COLUMN xy_cms_case.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.created_by IS '创建人ID';


--
-- Name: COLUMN xy_cms_case.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.updated_by IS '更新人ID';


--
-- Name: COLUMN xy_cms_case.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.created_at IS '创建时间';


--
-- Name: COLUMN xy_cms_case.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.updated_at IS '更新时间';


--
-- Name: COLUMN xy_cms_case.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case.deleted_at IS '删除时间(软删除)';


--
-- Name: xy_cms_case_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_cms_case_category (
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


ALTER TABLE public.xy_cms_case_category OWNER TO postgres;

--
-- Name: TABLE xy_cms_case_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_cms_case_category IS '案例分类表';


--
-- Name: COLUMN xy_cms_case_category.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.id IS '分类ID';


--
-- Name: COLUMN xy_cms_case_category.pid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.pid IS '父分类ID(0=顶级)';


--
-- Name: COLUMN xy_cms_case_category.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.title IS '分类名称';


--
-- Name: COLUMN xy_cms_case_category.icon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.icon IS '图标';


--
-- Name: COLUMN xy_cms_case_category.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.sort IS '排序(越大越靠前)';


--
-- Name: COLUMN xy_cms_case_category.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.status IS '状态:1=正常,2=禁用';


--
-- Name: COLUMN xy_cms_case_category.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.remark IS '备注';


--
-- Name: COLUMN xy_cms_case_category.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.created_at IS '创建时间';


--
-- Name: COLUMN xy_cms_case_category.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_case_category.updated_at IS '更新时间';


--
-- Name: xy_cms_case_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_cms_case_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_cms_case_category_id_seq OWNER TO postgres;

--
-- Name: xy_cms_case_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_cms_case_category_id_seq OWNED BY public.xy_cms_case_category.id;


--
-- Name: xy_cms_case_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_cms_case_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_cms_case_id_seq OWNER TO postgres;

--
-- Name: xy_cms_case_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_cms_case_id_seq OWNED BY public.xy_cms_case.id;


--
-- Name: xy_cms_doc; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.xy_cms_doc OWNER TO postgres;

--
-- Name: TABLE xy_cms_doc; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_cms_doc IS '文档内容表';


--
-- Name: COLUMN xy_cms_doc.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.id IS '文档ID';


--
-- Name: COLUMN xy_cms_doc.category_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.category_id IS '分类ID';


--
-- Name: COLUMN xy_cms_doc.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.title IS '文档标题';


--
-- Name: COLUMN xy_cms_doc.slug; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.slug IS 'URL标识(唯一)';


--
-- Name: COLUMN xy_cms_doc.cover; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.cover IS '封面图';


--
-- Name: COLUMN xy_cms_doc.summary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.summary IS '摘要';


--
-- Name: COLUMN xy_cms_doc.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.content IS '文档内容(Markdown)';


--
-- Name: COLUMN xy_cms_doc.author; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.author IS '作者';


--
-- Name: COLUMN xy_cms_doc.views; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.views IS '浏览量';


--
-- Name: COLUMN xy_cms_doc.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.sort IS '排序(越大越靠前)';


--
-- Name: COLUMN xy_cms_doc.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.status IS '状态:1=已发布,2=草稿,3=下架';


--
-- Name: COLUMN xy_cms_doc.is_top; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.is_top IS '是否置顶:0=否,1=是';


--
-- Name: COLUMN xy_cms_doc.tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.tags IS '标签(JSON数组)';


--
-- Name: COLUMN xy_cms_doc.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.created_by IS '创建人ID';


--
-- Name: COLUMN xy_cms_doc.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.updated_by IS '更新人ID';


--
-- Name: COLUMN xy_cms_doc.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.created_at IS '创建时间';


--
-- Name: COLUMN xy_cms_doc.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.updated_at IS '更新时间';


--
-- Name: COLUMN xy_cms_doc.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc.deleted_at IS '删除时间(软删除)';


--
-- Name: xy_cms_doc_category; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.xy_cms_doc_category OWNER TO postgres;

--
-- Name: TABLE xy_cms_doc_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_cms_doc_category IS '文档分类表';


--
-- Name: COLUMN xy_cms_doc_category.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.id IS '分类ID';


--
-- Name: COLUMN xy_cms_doc_category.pid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.pid IS '父分类ID(0=顶级)';


--
-- Name: COLUMN xy_cms_doc_category.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.title IS '分类名称';


--
-- Name: COLUMN xy_cms_doc_category.icon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.icon IS '图标';


--
-- Name: COLUMN xy_cms_doc_category.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.sort IS '排序(越大越靠前)';


--
-- Name: COLUMN xy_cms_doc_category.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.status IS '状态:1=正常,2=禁用';


--
-- Name: COLUMN xy_cms_doc_category.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.remark IS '备注';


--
-- Name: COLUMN xy_cms_doc_category.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.created_at IS '创建时间';


--
-- Name: COLUMN xy_cms_doc_category.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_cms_doc_category.updated_at IS '更新时间';


--
-- Name: xy_cms_doc_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_cms_doc_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_cms_doc_category_id_seq OWNER TO postgres;

--
-- Name: xy_cms_doc_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_cms_doc_category_id_seq OWNED BY public.xy_cms_doc_category.id;


--
-- Name: xy_cms_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_cms_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_cms_doc_id_seq OWNER TO postgres;

--
-- Name: xy_cms_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_cms_doc_id_seq OWNED BY public.xy_cms_doc.id;


--
-- Name: xy_community_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_community_category (
    id bigint NOT NULL,
    title character varying(100) DEFAULT ''::character varying NOT NULL,
    icon character varying(100) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_community_category OWNER TO postgres;

--
-- Name: TABLE xy_community_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_community_category IS '社区帖子分类表';


--
-- Name: COLUMN xy_community_category.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_category.id IS '分类ID';


--
-- Name: COLUMN xy_community_category.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_category.title IS '分类名称';


--
-- Name: COLUMN xy_community_category.icon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_category.icon IS '图标';


--
-- Name: COLUMN xy_community_category.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_category.sort IS '排序(越大越靠前)';


--
-- Name: COLUMN xy_community_category.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_category.status IS '状态:1=正常,2=禁用';


--
-- Name: COLUMN xy_community_category.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_category.created_at IS '创建时间';


--
-- Name: COLUMN xy_community_category.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_category.updated_at IS '更新时间';


--
-- Name: xy_community_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_community_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_community_category_id_seq OWNER TO postgres;

--
-- Name: xy_community_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_community_category_id_seq OWNED BY public.xy_community_category.id;


--
-- Name: xy_community_collect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_community_collect (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    post_id bigint DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_community_collect OWNER TO postgres;

--
-- Name: xy_community_collect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_community_collect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_community_collect_id_seq OWNER TO postgres;

--
-- Name: xy_community_collect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_community_collect_id_seq OWNED BY public.xy_community_collect.id;


--
-- Name: xy_community_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_community_like (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    target_type smallint DEFAULT 0 NOT NULL,
    target_id bigint DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_community_like OWNER TO postgres;

--
-- Name: TABLE xy_community_like; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_community_like IS '社区点赞记录表';


--
-- Name: COLUMN xy_community_like.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_like.id IS '记录ID';


--
-- Name: COLUMN xy_community_like.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_like.member_id IS '会员ID';


--
-- Name: COLUMN xy_community_like.target_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_like.target_type IS '目标类型:1=帖子,2=回复';


--
-- Name: COLUMN xy_community_like.target_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_like.target_id IS '目标ID';


--
-- Name: COLUMN xy_community_like.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_like.created_at IS '创建时间';


--
-- Name: xy_community_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_community_like_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_community_like_id_seq OWNER TO postgres;

--
-- Name: xy_community_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_community_like_id_seq OWNED BY public.xy_community_like.id;


--
-- Name: xy_community_post; Type: TABLE; Schema: public; Owner: postgres
--

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
    deleted_at bigint DEFAULT 0 NOT NULL,
    reward_score integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_community_post OWNER TO postgres;

--
-- Name: TABLE xy_community_post; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_community_post IS '社区帖子表';


--
-- Name: COLUMN xy_community_post.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.id IS '帖子ID';


--
-- Name: COLUMN xy_community_post.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.member_id IS '发帖会员ID';


--
-- Name: COLUMN xy_community_post.category_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.category_id IS '分类ID';


--
-- Name: COLUMN xy_community_post.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.title IS '标题';


--
-- Name: COLUMN xy_community_post.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.content IS '内容(Markdown)';


--
-- Name: COLUMN xy_community_post.tags; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.tags IS '标签(JSON数组)';


--
-- Name: COLUMN xy_community_post.views; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.views IS '浏览量';


--
-- Name: COLUMN xy_community_post.reply_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.reply_count IS '回复数';


--
-- Name: COLUMN xy_community_post.like_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.like_count IS '点赞数';


--
-- Name: COLUMN xy_community_post.is_top; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.is_top IS '是否置顶:0=否,1=是';


--
-- Name: COLUMN xy_community_post.is_essence; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.is_essence IS '是否精华:0=否,1=是';


--
-- Name: COLUMN xy_community_post.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.status IS '状态:1=正常,2=待审核,3=隐藏';


--
-- Name: COLUMN xy_community_post.last_reply_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.last_reply_at IS '最后回复时间';


--
-- Name: COLUMN xy_community_post.last_reply_member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.last_reply_member_id IS '最后回复人ID';


--
-- Name: COLUMN xy_community_post.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.created_at IS '创建时间';


--
-- Name: COLUMN xy_community_post.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.updated_at IS '更新时间';


--
-- Name: COLUMN xy_community_post.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_post.deleted_at IS '删除时间(软删除)';


--
-- Name: xy_community_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_community_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_community_post_id_seq OWNER TO postgres;

--
-- Name: xy_community_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_community_post_id_seq OWNED BY public.xy_community_post.id;


--
-- Name: xy_community_reply; Type: TABLE; Schema: public; Owner: postgres
--

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


ALTER TABLE public.xy_community_reply OWNER TO postgres;

--
-- Name: TABLE xy_community_reply; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_community_reply IS '社区帖子回复表';


--
-- Name: COLUMN xy_community_reply.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.id IS '回复ID';


--
-- Name: COLUMN xy_community_reply.post_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.post_id IS '帖子ID';


--
-- Name: COLUMN xy_community_reply.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.member_id IS '回复会员ID';


--
-- Name: COLUMN xy_community_reply.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.parent_id IS '父回复ID(0=直接回复帖子)';


--
-- Name: COLUMN xy_community_reply.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.content IS '回复内容(Markdown)';


--
-- Name: COLUMN xy_community_reply.like_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.like_count IS '点赞数';


--
-- Name: COLUMN xy_community_reply.is_accepted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.is_accepted IS '是否被采纳:0=否,1=是';


--
-- Name: COLUMN xy_community_reply.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.status IS '状态:1=正常,2=待审核,3=隐藏';


--
-- Name: COLUMN xy_community_reply.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.created_at IS '创建时间';


--
-- Name: COLUMN xy_community_reply.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.updated_at IS '更新时间';


--
-- Name: COLUMN xy_community_reply.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_community_reply.deleted_at IS '删除时间(软删除)';


--
-- Name: xy_community_reply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_community_reply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_community_reply_id_seq OWNER TO postgres;

--
-- Name: xy_community_reply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_community_reply_id_seq OWNED BY public.xy_community_reply.id;


--
-- Name: xy_community_search_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_community_search_log (
    id bigint NOT NULL,
    keyword character varying(100) NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_community_search_log OWNER TO postgres;

--
-- Name: xy_community_search_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_community_search_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_community_search_log_id_seq OWNER TO postgres;

--
-- Name: xy_community_search_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_community_search_log_id_seq OWNED BY public.xy_community_search_log.id;


--
-- Name: xy_demo_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_demo_article (
    id bigint NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    cover character varying(500) DEFAULT ''::character varying NOT NULL,
    summary character varying(500) DEFAULT ''::character varying NOT NULL,
    content text,
    author character varying(50) DEFAULT ''::character varying NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_demo_article OWNER TO postgres;

--
-- Name: TABLE xy_demo_article; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_demo_article IS '示例文章';


--
-- Name: COLUMN xy_demo_article.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.id IS '主键';


--
-- Name: COLUMN xy_demo_article.category_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.category_id IS '分类ID';


--
-- Name: COLUMN xy_demo_article.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.title IS '标题';


--
-- Name: COLUMN xy_demo_article.cover; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.cover IS '封面图';


--
-- Name: COLUMN xy_demo_article.summary; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.summary IS '摘要';


--
-- Name: COLUMN xy_demo_article.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.content IS '内容';


--
-- Name: COLUMN xy_demo_article.author; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.author IS '作者';


--
-- Name: COLUMN xy_demo_article.views; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.views IS '浏览量';


--
-- Name: COLUMN xy_demo_article.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.sort IS '排序';


--
-- Name: COLUMN xy_demo_article.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.status IS '状态:1=启用,0=禁用';


--
-- Name: COLUMN xy_demo_article.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.created_at IS '创建时间';


--
-- Name: COLUMN xy_demo_article.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_article.updated_at IS '更新时间';


--
-- Name: xy_demo_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_demo_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_demo_article_id_seq OWNER TO postgres;

--
-- Name: xy_demo_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_demo_article_id_seq OWNED BY public.xy_demo_article.id;


--
-- Name: xy_demo_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_demo_category (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    icon character varying(100) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_demo_category OWNER TO postgres;

--
-- Name: TABLE xy_demo_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_demo_category IS '示例分类';


--
-- Name: COLUMN xy_demo_category.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.id IS '主键';


--
-- Name: COLUMN xy_demo_category.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.parent_id IS '父级ID';


--
-- Name: COLUMN xy_demo_category.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.name IS '分类名称';


--
-- Name: COLUMN xy_demo_category.icon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.icon IS '图标';


--
-- Name: COLUMN xy_demo_category.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.sort IS '排序';


--
-- Name: COLUMN xy_demo_category.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.status IS '状态:1=启用,0=禁用';


--
-- Name: COLUMN xy_demo_category.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.remark IS '备注';


--
-- Name: COLUMN xy_demo_category.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.created_at IS '创建时间';


--
-- Name: COLUMN xy_demo_category.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_demo_category.updated_at IS '更新时间';


--
-- Name: xy_demo_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_demo_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_demo_category_id_seq OWNER TO postgres;

--
-- Name: xy_demo_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_demo_category_id_seq OWNED BY public.xy_demo_category.id;


--
-- Name: xy_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member (
    id bigint NOT NULL,
    username character varying(32) DEFAULT ''::character varying NOT NULL,
    password character varying(128) DEFAULT ''::character varying NOT NULL,
    mobile character varying(20) DEFAULT ''::character varying NOT NULL,
    email character varying(64) DEFAULT ''::character varying NOT NULL,
    nickname character varying(64) DEFAULT ''::character varying NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    gender smallint DEFAULT 0 NOT NULL,
    birthday date,
    money numeric(10,2) DEFAULT 0.00 NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    level smallint DEFAULT 1 NOT NULL,
    group_id bigint DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    last_login_ip character varying(50) DEFAULT ''::character varying NOT NULL,
    last_login_at bigint,
    login_count integer DEFAULT 0 NOT NULL,
    created_at bigint,
    updated_at bigint,
    deleted_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_member OWNER TO postgres;

--
-- Name: TABLE xy_member; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member IS '会员表';


--
-- Name: COLUMN xy_member.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.id IS '会员ID';


--
-- Name: COLUMN xy_member.username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.username IS '用户名';


--
-- Name: COLUMN xy_member.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.password IS '密码（bcrypt加密）';


--
-- Name: COLUMN xy_member.mobile; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.mobile IS '手机号';


--
-- Name: COLUMN xy_member.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.email IS '邮箱';


--
-- Name: COLUMN xy_member.nickname; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.nickname IS '昵称';


--
-- Name: COLUMN xy_member.avatar; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.avatar IS '头像';


--
-- Name: COLUMN xy_member.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.gender IS '性别：0=未知 1=男 2=女';


--
-- Name: COLUMN xy_member.birthday; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.birthday IS '生日';


--
-- Name: COLUMN xy_member.money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.money IS '余额';


--
-- Name: COLUMN xy_member.score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.score IS '积分';


--
-- Name: COLUMN xy_member.level; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.level IS '会员等级';


--
-- Name: COLUMN xy_member.group_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.group_id IS '会员分组ID';


--
-- Name: COLUMN xy_member.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.status IS '状态：0=禁用 1=正常';


--
-- Name: COLUMN xy_member.last_login_ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.last_login_ip IS '最后登录IP';


--
-- Name: COLUMN xy_member.last_login_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.last_login_at IS 'last login time';


--
-- Name: COLUMN xy_member.login_count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.login_count IS '登录次数';


--
-- Name: COLUMN xy_member.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.created_at IS '创建时间';


--
-- Name: COLUMN xy_member.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.updated_at IS '更新时间';


--
-- Name: COLUMN xy_member.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member.deleted_at IS 'deleted time';


--
-- Name: xy_member_checkin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_checkin (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    checkin_date bigint,
    score integer DEFAULT 0 NOT NULL,
    continuous_days integer DEFAULT 1 NOT NULL,
    created_at bigint
);


ALTER TABLE public.xy_member_checkin OWNER TO postgres;

--
-- Name: TABLE xy_member_checkin; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_checkin IS '会员签到记录';


--
-- Name: COLUMN xy_member_checkin.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_checkin.member_id IS '会员ID';


--
-- Name: COLUMN xy_member_checkin.checkin_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_checkin.checkin_date IS '签到日期';


--
-- Name: COLUMN xy_member_checkin.score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_checkin.score IS '本次获得积分';


--
-- Name: COLUMN xy_member_checkin.continuous_days; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_checkin.continuous_days IS '连续签到天数';


--
-- Name: COLUMN xy_member_checkin.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_checkin.created_at IS '签到时间';


--
-- Name: xy_member_checkin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_checkin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_checkin_id_seq OWNER TO postgres;

--
-- Name: xy_member_checkin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_checkin_id_seq OWNED BY public.xy_member_checkin.id;


--
-- Name: xy_member_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_group (
    id bigint NOT NULL,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    rules text,
    status smallint DEFAULT 1 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE public.xy_member_group OWNER TO postgres;

--
-- Name: TABLE xy_member_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_group IS '会员分组表';


--
-- Name: COLUMN xy_member_group.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.id IS '分组ID';


--
-- Name: COLUMN xy_member_group.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.name IS '分组名称';


--
-- Name: COLUMN xy_member_group.rules; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.rules IS '权限规则（菜单ID列表，逗号分隔）';


--
-- Name: COLUMN xy_member_group.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.status IS '状态：0=禁用 1=正常';


--
-- Name: COLUMN xy_member_group.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.sort IS '排序';


--
-- Name: COLUMN xy_member_group.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.remark IS '备注';


--
-- Name: COLUMN xy_member_group.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.created_at IS '创建时间';


--
-- Name: COLUMN xy_member_group.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_group.updated_at IS '更新时间';


--
-- Name: xy_member_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_group_id_seq OWNER TO postgres;

--
-- Name: xy_member_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_group_id_seq OWNED BY public.xy_member_group.id;


--
-- Name: xy_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_id_seq OWNER TO postgres;

--
-- Name: xy_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_id_seq OWNED BY public.xy_member.id;


--
-- Name: xy_member_login_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_login_log (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    username character varying(32) DEFAULT ''::character varying NOT NULL,
    ip character varying(50) DEFAULT ''::character varying NOT NULL,
    user_agent character varying(512) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    message character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE public.xy_member_login_log OWNER TO postgres;

--
-- Name: TABLE xy_member_login_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_login_log IS '会员登录日志表';


--
-- Name: COLUMN xy_member_login_log.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.id IS 'ID';


--
-- Name: COLUMN xy_member_login_log.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.member_id IS '会员ID';


--
-- Name: COLUMN xy_member_login_log.username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.username IS '用户名';


--
-- Name: COLUMN xy_member_login_log.ip; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.ip IS '登录IP';


--
-- Name: COLUMN xy_member_login_log.user_agent; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.user_agent IS 'User-Agent';


--
-- Name: COLUMN xy_member_login_log.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.status IS '状态:0=成功,1=失败';


--
-- Name: COLUMN xy_member_login_log.message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.message IS '提示信息';


--
-- Name: COLUMN xy_member_login_log.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_login_log.created_at IS '创建时间';


--
-- Name: xy_member_login_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_login_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_login_log_id_seq OWNER TO postgres;

--
-- Name: xy_member_login_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_login_log_id_seq OWNED BY public.xy_member_login_log.id;


--
-- Name: xy_member_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_menu (
    id bigint NOT NULL,
    pid bigint DEFAULT 0 NOT NULL,
    title character varying(32) DEFAULT ''::character varying NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    path character varying(128) DEFAULT ''::character varying NOT NULL,
    component character varying(255) DEFAULT ''::character varying NOT NULL,
    icon character varying(64) DEFAULT ''::character varying NOT NULL,
    menu_type character varying(20) DEFAULT 'tab'::character varying NOT NULL,
    url character varying(500) DEFAULT ''::character varying NOT NULL,
    no_login_valid smallint DEFAULT 0 NOT NULL,
    extend character varying(20) DEFAULT 'none'::character varying NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    type character varying(20) DEFAULT 'menu'::character varying NOT NULL,
    permission character varying(64) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE public.xy_member_menu OWNER TO postgres;

--
-- Name: TABLE xy_member_menu; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_menu IS '会员菜单表';


--
-- Name: COLUMN xy_member_menu.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.id IS '菜单ID';


--
-- Name: COLUMN xy_member_menu.pid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.pid IS '父级ID';


--
-- Name: COLUMN xy_member_menu.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.title IS '菜单名称';


--
-- Name: COLUMN xy_member_menu.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.name IS '路由名称';


--
-- Name: COLUMN xy_member_menu.path; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.path IS '路由路径';


--
-- Name: COLUMN xy_member_menu.component; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.component IS 'Vue组件路径（相对于views/frontend/）';


--
-- Name: COLUMN xy_member_menu.icon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.icon IS '图标';


--
-- Name: COLUMN xy_member_menu.menu_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.menu_type IS '菜单打开方式：tab=标签页, link=外链, iframe=内嵌';


--
-- Name: COLUMN xy_member_menu.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.url IS '外链/iframe地址';


--
-- Name: COLUMN xy_member_menu.no_login_valid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.no_login_valid IS '未登录是否有效：0=否 1=是（公开路由）';


--
-- Name: COLUMN xy_member_menu.extend; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.extend IS '扩展属性：none=无, add_rules_only=仅添加为路由, add_menu_only=仅添加为菜单';


--
-- Name: COLUMN xy_member_menu.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.remark IS '备注';


--
-- Name: COLUMN xy_member_menu.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.type IS '类型：route=普通路由, menu_dir=会员中心菜单目录, menu=会员中心菜单项, nav=顶栏菜单项, nav_user_menu=顶栏会员菜单下拉, button=页面按钮';


--
-- Name: COLUMN xy_member_menu.permission; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.permission IS '权限标识';


--
-- Name: COLUMN xy_member_menu.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.sort IS '排序';


--
-- Name: COLUMN xy_member_menu.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.status IS '状态：0=禁用 1=正常';


--
-- Name: COLUMN xy_member_menu.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.created_at IS '创建时间';


--
-- Name: COLUMN xy_member_menu.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_menu.updated_at IS '更新时间';


--
-- Name: xy_member_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_menu_id_seq OWNER TO postgres;

--
-- Name: xy_member_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_menu_id_seq OWNED BY public.xy_member_menu.id;


--
-- Name: xy_member_money_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_money_log (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    money integer DEFAULT 0 NOT NULL,
    before integer DEFAULT 0 NOT NULL,
    after integer DEFAULT 0 NOT NULL,
    memo character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE public.xy_member_money_log OWNER TO postgres;

--
-- Name: TABLE xy_member_money_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_money_log IS '会员余额变动日志';


--
-- Name: COLUMN xy_member_money_log.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_money_log.member_id IS '会员ID';


--
-- Name: COLUMN xy_member_money_log.money; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_money_log.money IS '变动金额（分，正数=增加，负数=减少）';


--
-- Name: COLUMN xy_member_money_log.before; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_money_log.before IS '变动前余额（分）';


--
-- Name: COLUMN xy_member_money_log.after; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_money_log.after IS '变动后余额（分）';


--
-- Name: COLUMN xy_member_money_log.memo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_money_log.memo IS '变动说明';


--
-- Name: COLUMN xy_member_money_log.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_money_log.created_at IS '创建时间';


--
-- Name: xy_member_money_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_money_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_money_log_id_seq OWNER TO postgres;

--
-- Name: xy_member_money_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_money_log_id_seq OWNED BY public.xy_member_money_log.id;


--
-- Name: xy_member_notice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_notice (
    id bigint NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    content text,
    type character varying(20) DEFAULT 'system'::character varying NOT NULL,
    target character varying(20) DEFAULT 'all'::character varying NOT NULL,
    target_id bigint DEFAULT 0 NOT NULL,
    sender character varying(50) DEFAULT '系统'::character varying NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint
);


ALTER TABLE public.xy_member_notice OWNER TO postgres;

--
-- Name: TABLE xy_member_notice; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_notice IS '会员通知';


--
-- Name: COLUMN xy_member_notice.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.title IS '通知标题';


--
-- Name: COLUMN xy_member_notice.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.content IS '通知内容';


--
-- Name: COLUMN xy_member_notice.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.type IS '通知类型:system=系统通知,announce=公告,feature=功能更新,maintain=维护通知';


--
-- Name: COLUMN xy_member_notice.target; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.target IS '目标:all=全部会员,group=指定分组';


--
-- Name: COLUMN xy_member_notice.target_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.target_id IS '目标分组ID（target=group时有效）';


--
-- Name: COLUMN xy_member_notice.sender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.sender IS '发送者';


--
-- Name: COLUMN xy_member_notice.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.status IS '状态:0=草稿,1=已发布';


--
-- Name: COLUMN xy_member_notice.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice.created_at IS '创建时间';


--
-- Name: xy_member_notice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_notice_id_seq OWNER TO postgres;

--
-- Name: xy_member_notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_notice_id_seq OWNED BY public.xy_member_notice.id;


--
-- Name: xy_member_notice_read; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_notice_read (
    id bigint NOT NULL,
    notice_id bigint DEFAULT 0 NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    read_at bigint
);


ALTER TABLE public.xy_member_notice_read OWNER TO postgres;

--
-- Name: TABLE xy_member_notice_read; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_notice_read IS '会员通知已读记录';


--
-- Name: COLUMN xy_member_notice_read.notice_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice_read.notice_id IS '通知ID';


--
-- Name: COLUMN xy_member_notice_read.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice_read.member_id IS '会员ID';


--
-- Name: COLUMN xy_member_notice_read.read_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_notice_read.read_at IS '阅读时间';


--
-- Name: xy_member_notice_read_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_notice_read_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_notice_read_id_seq OWNER TO postgres;

--
-- Name: xy_member_notice_read_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_notice_read_id_seq OWNED BY public.xy_member_notice_read.id;


--
-- Name: xy_member_score_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_member_score_log (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    before integer DEFAULT 0 NOT NULL,
    after integer DEFAULT 0 NOT NULL,
    memo character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE public.xy_member_score_log OWNER TO postgres;

--
-- Name: TABLE xy_member_score_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_member_score_log IS '会员积分变动日志';


--
-- Name: COLUMN xy_member_score_log.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_score_log.member_id IS '会员ID';


--
-- Name: COLUMN xy_member_score_log.score; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_score_log.score IS '变动积分（正数=增加，负数=减少）';


--
-- Name: COLUMN xy_member_score_log.before; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_score_log.before IS '变动前积分';


--
-- Name: COLUMN xy_member_score_log.after; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_score_log.after IS '变动后积分';


--
-- Name: COLUMN xy_member_score_log.memo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_score_log.memo IS '变动说明';


--
-- Name: COLUMN xy_member_score_log.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_member_score_log.created_at IS '创建时间';


--
-- Name: xy_member_score_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_member_score_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_member_score_log_id_seq OWNER TO postgres;

--
-- Name: xy_member_score_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_member_score_log_id_seq OWNED BY public.xy_member_score_log.id;


--
-- Name: xy_sys_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_sys_attachment (
    id bigint NOT NULL,
    topic character varying(20) DEFAULT ''::character varying NOT NULL,
    user_id bigint DEFAULT 0 NOT NULL,
    url character varying(255) DEFAULT ''::character varying NOT NULL,
    width integer DEFAULT 0 NOT NULL,
    height integer DEFAULT 0 NOT NULL,
    name character varying(120) DEFAULT ''::character varying NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    mimetype character varying(100) DEFAULT ''::character varying NOT NULL,
    quote integer DEFAULT 0 NOT NULL,
    storage character varying(50) DEFAULT 'local'::character varying NOT NULL,
    sha1 character varying(40) DEFAULT ''::character varying NOT NULL,
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE public.xy_sys_attachment OWNER TO postgres;

--
-- Name: TABLE xy_sys_attachment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_sys_attachment IS '附件表';


--
-- Name: COLUMN xy_sys_attachment.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.id IS 'ID';


--
-- Name: COLUMN xy_sys_attachment.topic; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.topic IS '分组/主题标识';


--
-- Name: COLUMN xy_sys_attachment.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.user_id IS '上传用户ID（预留）';


--
-- Name: COLUMN xy_sys_attachment.url; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.url IS '物理路径（相对路径）';


--
-- Name: COLUMN xy_sys_attachment.width; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.width IS '宽度';


--
-- Name: COLUMN xy_sys_attachment.height; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.height IS '高度';


--
-- Name: COLUMN xy_sys_attachment.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.name IS '原始名称';


--
-- Name: COLUMN xy_sys_attachment.size; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.size IS '大小（字节）';


--
-- Name: COLUMN xy_sys_attachment.mimetype; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.mimetype IS 'MIME类型';


--
-- Name: COLUMN xy_sys_attachment.quote; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.quote IS '上传(引用)次数';


--
-- Name: COLUMN xy_sys_attachment.storage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.storage IS '存储方式：local=本地';


--
-- Name: COLUMN xy_sys_attachment.sha1; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.sha1 IS 'sha1摘要';


--
-- Name: COLUMN xy_sys_attachment.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.create_time IS '创建时间';


--
-- Name: COLUMN xy_sys_attachment.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_attachment.update_time IS '更新时间';


--
-- Name: xy_sys_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_sys_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_sys_attachment_id_seq OWNER TO postgres;

--
-- Name: xy_sys_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_sys_attachment_id_seq OWNED BY public.xy_sys_attachment.id;


--
-- Name: xy_sys_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_sys_config (
    id bigint NOT NULL,
    "group" character varying(64) DEFAULT ''::character varying NOT NULL,
    group_name character varying(64) DEFAULT ''::character varying NOT NULL,
    name character varying(128) DEFAULT ''::character varying NOT NULL,
    key character varying(128) DEFAULT ''::character varying NOT NULL,
    value text,
    type character varying(32) DEFAULT 'text'::character varying NOT NULL,
    options jsonb,
    rules jsonb,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    allow_del smallint DEFAULT 0 NOT NULL,
    created_by bigint,
    updated_by bigint,
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE public.xy_sys_config OWNER TO postgres;

--
-- Name: TABLE xy_sys_config; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_sys_config IS '系统配置（定义+当前值）';


--
-- Name: COLUMN xy_sys_config.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.id IS '主键';


--
-- Name: COLUMN xy_sys_config."group"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config."group" IS '分组标识，如 basics/mail/oss';


--
-- Name: COLUMN xy_sys_config.group_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.group_name IS '分组名称';


--
-- Name: COLUMN xy_sys_config.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.name IS '配置项显示名';


--
-- Name: COLUMN xy_sys_config.key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.key IS '配置键（唯一）';


--
-- Name: COLUMN xy_sys_config.value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.value IS '配置值（字符串/JSON）';


--
-- Name: COLUMN xy_sys_config.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.type IS '控件类型:text/textarea/number/switch/select/radio/checkbox/json/object/array/color/upload';


--
-- Name: COLUMN xy_sys_config.options; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.options IS '组件参数/选项 JSON';


--
-- Name: COLUMN xy_sys_config.rules; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.rules IS '校验规则 JSON';


--
-- Name: COLUMN xy_sys_config.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.sort IS '排序(大靠后)';


--
-- Name: COLUMN xy_sys_config.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.remark IS '备注';


--
-- Name: COLUMN xy_sys_config.allow_del; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.allow_del IS '允许删除:0=否,1=是';


--
-- Name: COLUMN xy_sys_config.created_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.created_by IS '创建人';


--
-- Name: COLUMN xy_sys_config.updated_by; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.updated_by IS '更新人';


--
-- Name: COLUMN xy_sys_config.create_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.create_time IS '创建时间';


--
-- Name: COLUMN xy_sys_config.update_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_config.update_time IS '更新时间';


--
-- Name: xy_sys_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_sys_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_sys_config_id_seq OWNER TO postgres;

--
-- Name: xy_sys_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_sys_config_id_seq OWNED BY public.xy_sys_config.id;


--
-- Name: xy_sys_cron; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_sys_cron (
    id bigint NOT NULL,
    group_id bigint DEFAULT 0 NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    params character varying(1000) DEFAULT ''::character varying NOT NULL,
    pattern character varying(100) DEFAULT ''::character varying NOT NULL,
    policy smallint DEFAULT 1 NOT NULL,
    count integer DEFAULT 0 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(500) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_sys_cron OWNER TO postgres;

--
-- Name: TABLE xy_sys_cron; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_sys_cron IS '定时任务表';


--
-- Name: COLUMN xy_sys_cron.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.id IS '任务ID';


--
-- Name: COLUMN xy_sys_cron.group_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.group_id IS '分组ID';


--
-- Name: COLUMN xy_sys_cron.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.title IS '任务标题';


--
-- Name: COLUMN xy_sys_cron.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.name IS '任务标识（唯一，对应代码注册名）';


--
-- Name: COLUMN xy_sys_cron.params; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.params IS '任务参数（逗号分隔）';


--
-- Name: COLUMN xy_sys_cron.pattern; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.pattern IS 'Cron表达式';


--
-- Name: COLUMN xy_sys_cron.policy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.policy IS '策略:1并行,2单例,3单次,4固定次数';


--
-- Name: COLUMN xy_sys_cron.count; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.count IS '固定次数（policy=4时有效）';


--
-- Name: COLUMN xy_sys_cron.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.sort IS '排序';


--
-- Name: COLUMN xy_sys_cron.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.remark IS '备注';


--
-- Name: COLUMN xy_sys_cron.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.status IS '状态:0禁用,1启用';


--
-- Name: COLUMN xy_sys_cron.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.created_at IS '创建时间';


--
-- Name: COLUMN xy_sys_cron.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron.updated_at IS '更新时间';


--
-- Name: xy_sys_cron_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_sys_cron_group (
    id bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(500) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_sys_cron_group OWNER TO postgres;

--
-- Name: TABLE xy_sys_cron_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_sys_cron_group IS '定时任务分组表';


--
-- Name: COLUMN xy_sys_cron_group.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_group.id IS '分组ID';


--
-- Name: COLUMN xy_sys_cron_group.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_group.name IS '分组名称';


--
-- Name: COLUMN xy_sys_cron_group.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_group.sort IS '排序（越小越靠前）';


--
-- Name: COLUMN xy_sys_cron_group.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_group.remark IS '备注';


--
-- Name: COLUMN xy_sys_cron_group.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_group.status IS '状态:0禁用,1启用';


--
-- Name: COLUMN xy_sys_cron_group.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_group.created_at IS '创建时间';


--
-- Name: COLUMN xy_sys_cron_group.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_group.updated_at IS '更新时间';


--
-- Name: xy_sys_cron_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_sys_cron_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_sys_cron_group_id_seq OWNER TO postgres;

--
-- Name: xy_sys_cron_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_sys_cron_group_id_seq OWNED BY public.xy_sys_cron_group.id;


--
-- Name: xy_sys_cron_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_sys_cron_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_sys_cron_id_seq OWNER TO postgres;

--
-- Name: xy_sys_cron_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_sys_cron_id_seq OWNED BY public.xy_sys_cron.id;


--
-- Name: xy_sys_cron_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_sys_cron_log (
    id bigint NOT NULL,
    cron_id bigint DEFAULT 0 NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    params character varying(1000) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    output text,
    err_msg text,
    take_ms integer DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_sys_cron_log OWNER TO postgres;

--
-- Name: TABLE xy_sys_cron_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_sys_cron_log IS '定时任务执行日志表';


--
-- Name: COLUMN xy_sys_cron_log.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.id IS '日志ID';


--
-- Name: COLUMN xy_sys_cron_log.cron_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.cron_id IS '任务ID';


--
-- Name: COLUMN xy_sys_cron_log.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.name IS '任务标识';


--
-- Name: COLUMN xy_sys_cron_log.title; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.title IS '任务标题';


--
-- Name: COLUMN xy_sys_cron_log.params; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.params IS '执行参数';


--
-- Name: COLUMN xy_sys_cron_log.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.status IS '状态:1成功,2失败';


--
-- Name: COLUMN xy_sys_cron_log.output; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.output IS '执行输出';


--
-- Name: COLUMN xy_sys_cron_log.err_msg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.err_msg IS '错误信息';


--
-- Name: COLUMN xy_sys_cron_log.take_ms; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.take_ms IS '耗时(毫秒)';


--
-- Name: COLUMN xy_sys_cron_log.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_cron_log.created_at IS '执行时间';


--
-- Name: xy_sys_cron_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_sys_cron_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_sys_cron_log_id_seq OWNER TO postgres;

--
-- Name: xy_sys_cron_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_sys_cron_log_id_seq OWNED BY public.xy_sys_cron_log.id;


--
-- Name: xy_sys_gen_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_sys_gen_codes (
    id bigint NOT NULL,
    gen_type smallint DEFAULT 10 NOT NULL,
    db_name character varying(50) DEFAULT ''::character varying NOT NULL,
    table_name character varying(100) DEFAULT ''::character varying NOT NULL,
    table_comment character varying(200) DEFAULT ''::character varying NOT NULL,
    var_name character varying(100) DEFAULT ''::character varying NOT NULL,
    options jsonb,
    status smallint DEFAULT 2 NOT NULL,
    created_at bigint DEFAULT 0 NOT NULL,
    updated_at bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_sys_gen_codes OWNER TO postgres;

--
-- Name: TABLE xy_sys_gen_codes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_sys_gen_codes IS '代码生成配置主表';


--
-- Name: COLUMN xy_sys_gen_codes.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.id IS '主键';


--
-- Name: COLUMN xy_sys_gen_codes.gen_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.gen_type IS '生成类型:10=普通列表,11=树表';


--
-- Name: COLUMN xy_sys_gen_codes.db_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.db_name IS '数据库名';


--
-- Name: COLUMN xy_sys_gen_codes.table_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.table_name IS '数据表名';


--
-- Name: COLUMN xy_sys_gen_codes.table_comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.table_comment IS '表注释(菜单名)';


--
-- Name: COLUMN xy_sys_gen_codes.var_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.var_name IS '实体名(PascalCase)';


--
-- Name: COLUMN xy_sys_gen_codes.options; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.options IS '生成选项(JSON)';


--
-- Name: COLUMN xy_sys_gen_codes.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.status IS '状态:1=已生成,2=未生成';


--
-- Name: COLUMN xy_sys_gen_codes.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.created_at IS '创建时间戳';


--
-- Name: COLUMN xy_sys_gen_codes.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes.updated_at IS '更新时间戳';


--
-- Name: xy_sys_gen_codes_column; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_sys_gen_codes_column (
    id bigint NOT NULL,
    gen_id bigint DEFAULT 0 NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    go_name character varying(100) DEFAULT ''::character varying NOT NULL,
    ts_name character varying(100) DEFAULT ''::character varying NOT NULL,
    db_type character varying(50) DEFAULT ''::character varying NOT NULL,
    go_type character varying(50) DEFAULT ''::character varying NOT NULL,
    ts_type character varying(50) DEFAULT ''::character varying NOT NULL,
    comment character varying(200) DEFAULT ''::character varying NOT NULL,
    is_pk smallint DEFAULT 0 NOT NULL,
    is_required smallint DEFAULT 0 NOT NULL,
    is_list smallint DEFAULT 1 NOT NULL,
    is_edit smallint DEFAULT 1 NOT NULL,
    is_query smallint DEFAULT 0 NOT NULL,
    query_type character varying(20) DEFAULT 'eq'::character varying NOT NULL,
    design_type character varying(30) NOT NULL,
    extra text,
    form_type character varying(30) DEFAULT 'input'::character varying NOT NULL,
    dict_type character varying(50) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_sys_gen_codes_column OWNER TO postgres;

--
-- Name: TABLE xy_sys_gen_codes_column; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_sys_gen_codes_column IS '代码生成字段配置表';


--
-- Name: COLUMN xy_sys_gen_codes_column.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.id IS '主键';


--
-- Name: COLUMN xy_sys_gen_codes_column.gen_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.gen_id IS '关联gen_codes.id';


--
-- Name: COLUMN xy_sys_gen_codes_column.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.name IS '数据库字段名';


--
-- Name: COLUMN xy_sys_gen_codes_column.go_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.go_name IS 'Go字段名';


--
-- Name: COLUMN xy_sys_gen_codes_column.ts_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.ts_name IS 'TS字段名';


--
-- Name: COLUMN xy_sys_gen_codes_column.db_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.db_type IS '数据库类型';


--
-- Name: COLUMN xy_sys_gen_codes_column.go_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.go_type IS 'Go类型';


--
-- Name: COLUMN xy_sys_gen_codes_column.ts_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.ts_type IS 'TS类型';


--
-- Name: COLUMN xy_sys_gen_codes_column.comment; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.comment IS '字段注释';


--
-- Name: COLUMN xy_sys_gen_codes_column.is_pk; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.is_pk IS '是否主键:0=否,1=是';


--
-- Name: COLUMN xy_sys_gen_codes_column.is_required; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.is_required IS '是否必填:0=否,1=是';


--
-- Name: COLUMN xy_sys_gen_codes_column.is_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.is_list IS '表格列显示:0=否,1=是';


--
-- Name: COLUMN xy_sys_gen_codes_column.is_edit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.is_edit IS '表单编辑显示:0=否,1=是';


--
-- Name: COLUMN xy_sys_gen_codes_column.is_query; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.is_query IS '搜索条件:0=否,1=是';


--
-- Name: COLUMN xy_sys_gen_codes_column.query_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.query_type IS '查询方式:eq/like/between/gt/in';


--
-- Name: COLUMN xy_sys_gen_codes_column.design_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.design_type IS '设计类型(designType)';


--
-- Name: COLUMN xy_sys_gen_codes_column.extra; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.extra IS '扩展配置JSON(关联表配置/表格属性/表单属性等)';


--
-- Name: COLUMN xy_sys_gen_codes_column.form_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.form_type IS '表单组件类型';


--
-- Name: COLUMN xy_sys_gen_codes_column.dict_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.dict_type IS '关联字典';


--
-- Name: COLUMN xy_sys_gen_codes_column.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_sys_gen_codes_column.sort IS '排序';


--
-- Name: xy_sys_gen_codes_column_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_sys_gen_codes_column_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_sys_gen_codes_column_id_seq OWNER TO postgres;

--
-- Name: xy_sys_gen_codes_column_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_sys_gen_codes_column_id_seq OWNED BY public.xy_sys_gen_codes_column.id;


--
-- Name: xy_sys_gen_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_sys_gen_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_sys_gen_codes_id_seq OWNER TO postgres;

--
-- Name: xy_sys_gen_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_sys_gen_codes_id_seq OWNED BY public.xy_sys_gen_codes.id;


--
-- Name: xy_test_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_test_category (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    icon character varying(255) DEFAULT ''::character varying NOT NULL,
    image character varying(500) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE public.xy_test_category OWNER TO postgres;

--
-- Name: TABLE xy_test_category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_test_category IS '测试分类表';


--
-- Name: COLUMN xy_test_category.parent_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.parent_id IS '鐖剁骇ID';


--
-- Name: COLUMN xy_test_category.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.name IS '分类名称';


--
-- Name: COLUMN xy_test_category.icon; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.icon IS '图标';


--
-- Name: COLUMN xy_test_category.image; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.image IS '分类图片';


--
-- Name: COLUMN xy_test_category.sort; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.sort IS '排序';


--
-- Name: COLUMN xy_test_category.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.status IS '状态:0=禁用,1=启用';


--
-- Name: COLUMN xy_test_category.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.remark IS '备注';


--
-- Name: COLUMN xy_test_category.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.created_at IS '创建时间';


--
-- Name: COLUMN xy_test_category.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_category.updated_at IS '更新时间';


--
-- Name: xy_test_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_test_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_test_category_id_seq OWNER TO postgres;

--
-- Name: xy_test_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_test_category_id_seq OWNED BY public.xy_test_category.id;


--
-- Name: xy_test_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_test_code (
    id bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    member_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.xy_test_code OWNER TO postgres;

--
-- Name: TABLE xy_test_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_test_code IS '测试生成';


--
-- Name: COLUMN xy_test_code.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_code.id IS '主键';


--
-- Name: COLUMN xy_test_code.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_code.name IS '名称';


--
-- Name: COLUMN xy_test_code.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_code.member_id IS '关联ID';


--
-- Name: xy_test_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_test_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_test_code_id_seq OWNER TO postgres;

--
-- Name: xy_test_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_test_code_id_seq OWNED BY public.xy_test_code.id;


--
-- Name: xy_test_codec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_test_codec (
    id bigint NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    create_time time without time zone
);


ALTER TABLE public.xy_test_codec OWNER TO postgres;

--
-- Name: TABLE xy_test_codec; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_test_codec IS '测试手动创建';


--
-- Name: COLUMN xy_test_codec.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_codec.id IS '主键';


--
-- Name: COLUMN xy_test_codec.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_codec.status IS '状态:0=关闭,1=开启';


--
-- Name: xy_test_codec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_test_codec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_test_codec_id_seq OWNER TO postgres;

--
-- Name: xy_test_codec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_test_codec_id_seq OWNED BY public.xy_test_codec.id;


--
-- Name: xy_test_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xy_test_order (
    id bigint NOT NULL,
    member_id bigint DEFAULT 0 NOT NULL,
    apply_id bigint DEFAULT 0 NOT NULL,
    amount numeric(10,2) DEFAULT 0.00 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    memo character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE public.xy_test_order OWNER TO postgres;

--
-- Name: TABLE xy_test_order; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.xy_test_order IS '测试订单表';


--
-- Name: COLUMN xy_test_order.member_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_order.member_id IS '卖家ID';


--
-- Name: COLUMN xy_test_order.apply_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_order.apply_id IS '买家ID';


--
-- Name: COLUMN xy_test_order.amount; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_order.amount IS '订单金额';


--
-- Name: COLUMN xy_test_order.status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_order.status IS '状态:0=待处理,1=已完成,2=已取消';


--
-- Name: COLUMN xy_test_order.memo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_order.memo IS '备注';


--
-- Name: COLUMN xy_test_order.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_order.created_at IS '创建时间';


--
-- Name: COLUMN xy_test_order.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.xy_test_order.updated_at IS '更新时间';


--
-- Name: xy_test_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xy_test_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.xy_test_order_id_seq OWNER TO postgres;

--
-- Name: xy_test_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xy_test_order_id_seq OWNED BY public.xy_test_order.id;


--
-- Name: xy_admin_chat_message; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_chat_message (
    id bigint NOT NULL,
    session_id bigint DEFAULT '0'::bigint NOT NULL,
    sender_id bigint DEFAULT '0'::bigint NOT NULL,
    type smallint DEFAULT '1'::smallint NOT NULL,
    content text NOT NULL,
    created_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE xygonew.xy_admin_chat_message OWNER TO postgres;

--
-- Name: xy_admin_chat_message_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_chat_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_chat_message_id_seq OWNER TO postgres;

--
-- Name: xy_admin_chat_message_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_chat_message_id_seq OWNED BY xygonew.xy_admin_chat_message.id;


--
-- Name: xy_admin_chat_session; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_chat_session (
    id bigint NOT NULL,
    type smallint DEFAULT '1'::smallint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    creator_id bigint DEFAULT '0'::bigint NOT NULL,
    last_message character varying(500) DEFAULT ''::character varying NOT NULL,
    last_message_time integer DEFAULT 0 NOT NULL,
    member_count integer DEFAULT 0 NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    updated_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE xygonew.xy_admin_chat_session OWNER TO postgres;

--
-- Name: xy_admin_chat_session_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_chat_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_chat_session_id_seq OWNER TO postgres;

--
-- Name: xy_admin_chat_session_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_chat_session_id_seq OWNED BY xygonew.xy_admin_chat_session.id;


--
-- Name: xy_admin_chat_session_member; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_chat_session_member (
    id bigint NOT NULL,
    session_id bigint DEFAULT '0'::bigint NOT NULL,
    user_id bigint DEFAULT '0'::bigint NOT NULL,
    role smallint DEFAULT '1'::smallint NOT NULL,
    unread_count integer DEFAULT 0 NOT NULL,
    last_read_msg_id bigint DEFAULT '0'::bigint NOT NULL,
    is_muted boolean DEFAULT false NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    joined_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE xygonew.xy_admin_chat_session_member OWNER TO postgres;

--
-- Name: xy_admin_chat_session_member_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_chat_session_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_chat_session_member_id_seq OWNER TO postgres;

--
-- Name: xy_admin_chat_session_member_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_chat_session_member_id_seq OWNED BY xygonew.xy_admin_chat_session_member.id;


--
-- Name: xy_admin_dept; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_dept (
    id bigint NOT NULL,
    parent_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(50) NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    remark character varying(500),
    create_by bigint DEFAULT '0'::bigint,
    create_time bigint,
    update_time bigint
);


ALTER TABLE xygonew.xy_admin_dept OWNER TO postgres;

--
-- Name: xy_admin_dept_closure; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_dept_closure (
    id bigint NOT NULL,
    ancestor bigint NOT NULL,
    descendant bigint NOT NULL,
    level integer DEFAULT 0 NOT NULL
);


ALTER TABLE xygonew.xy_admin_dept_closure OWNER TO postgres;

--
-- Name: xy_admin_dept_closure_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_dept_closure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_dept_closure_id_seq OWNER TO postgres;

--
-- Name: xy_admin_dept_closure_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_dept_closure_id_seq OWNED BY xygonew.xy_admin_dept_closure.id;


--
-- Name: xy_admin_dept_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_dept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_dept_id_seq OWNER TO postgres;

--
-- Name: xy_admin_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_dept_id_seq OWNED BY xygonew.xy_admin_dept.id;


--
-- Name: xy_admin_field_perm; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_field_perm (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    module character varying(50) DEFAULT ''::character varying NOT NULL,
    resource character varying(100) NOT NULL,
    field_name character varying(100) NOT NULL,
    field_label character varying(100),
    perm_type smallint DEFAULT '2'::smallint NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    remark character varying(255),
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE xygonew.xy_admin_field_perm OWNER TO postgres;

--
-- Name: xy_admin_field_perm_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_field_perm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_field_perm_id_seq OWNER TO postgres;

--
-- Name: xy_admin_field_perm_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_field_perm_id_seq OWNED BY xygonew.xy_admin_field_perm.id;


--
-- Name: xy_admin_login_log; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_login_log (
    id bigint NOT NULL,
    user_id bigint DEFAULT '0'::bigint NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    ip character varying(64) DEFAULT ''::character varying NOT NULL,
    location character varying(255) DEFAULT ''::character varying NOT NULL,
    user_agent character varying(500) DEFAULT ''::character varying NOT NULL,
    browser character varying(128) DEFAULT ''::character varying NOT NULL,
    os character varying(128) DEFAULT ''::character varying NOT NULL,
    status boolean DEFAULT true NOT NULL,
    message character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE xygonew.xy_admin_login_log OWNER TO postgres;

--
-- Name: xy_admin_login_log_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_login_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_login_log_id_seq OWNER TO postgres;

--
-- Name: xy_admin_login_log_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_login_log_id_seq OWNED BY xygonew.xy_admin_login_log.id;


--
-- Name: xy_admin_menu; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_menu (
    id bigint NOT NULL,
    parent_id bigint DEFAULT '0'::bigint NOT NULL,
    type smallint DEFAULT '1'::smallint NOT NULL,
    title character varying(50) NOT NULL,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    path character varying(100) DEFAULT ''::character varying NOT NULL,
    component character varying(100) DEFAULT ''::character varying NOT NULL,
    resource character varying(50) DEFAULT ''::character varying,
    icon character varying(50) DEFAULT ''::character varying NOT NULL,
    hidden smallint DEFAULT '0'::smallint NOT NULL,
    keep_alive smallint DEFAULT '0'::smallint NOT NULL,
    redirect character varying(100) DEFAULT ''::character varying NOT NULL,
    frame_src character varying(255) DEFAULT ''::character varying NOT NULL,
    perms text,
    is_frame boolean DEFAULT false NOT NULL,
    affix boolean DEFAULT false NOT NULL,
    show_badge boolean DEFAULT false NOT NULL,
    badge_text character varying(50) DEFAULT ''::character varying NOT NULL,
    active_path character varying(255) DEFAULT ''::character varying NOT NULL,
    hide_tab boolean DEFAULT false NOT NULL,
    is_full_page boolean DEFAULT false NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_by bigint DEFAULT '0'::bigint NOT NULL,
    updated_by bigint DEFAULT '0'::bigint NOT NULL,
    create_time integer NOT NULL,
    update_time integer NOT NULL
);


ALTER TABLE xygonew.xy_admin_menu OWNER TO postgres;

--
-- Name: xy_admin_menu_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_menu_id_seq OWNER TO postgres;

--
-- Name: xy_admin_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_menu_id_seq OWNED BY xygonew.xy_admin_menu.id;


--
-- Name: xy_admin_notice; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_notice (
    id bigint NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    type boolean DEFAULT true NOT NULL,
    content text,
    tag character varying(50) DEFAULT ''::character varying NOT NULL,
    sender_id bigint DEFAULT '0'::bigint NOT NULL,
    receiver_id bigint DEFAULT '0'::bigint NOT NULL,
    status boolean DEFAULT true NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    read_count bigint DEFAULT '0'::bigint NOT NULL,
    created_at bigint DEFAULT '0'::bigint NOT NULL,
    updated_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_admin_notice OWNER TO postgres;

--
-- Name: xy_admin_notice_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_notice_id_seq OWNER TO postgres;

--
-- Name: xy_admin_notice_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_notice_id_seq OWNED BY xygonew.xy_admin_notice.id;


--
-- Name: xy_admin_notice_read; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_notice_read (
    id bigint NOT NULL,
    notice_id bigint NOT NULL,
    user_id bigint NOT NULL,
    read_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_admin_notice_read OWNER TO postgres;

--
-- Name: xy_admin_notice_read_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_notice_read_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_notice_read_id_seq OWNER TO postgres;

--
-- Name: xy_admin_notice_read_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_notice_read_id_seq OWNED BY xygonew.xy_admin_notice_read.id;


--
-- Name: xy_admin_operation_log; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_operation_log (
    id bigint NOT NULL,
    user_id bigint DEFAULT '0'::bigint NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    module character varying(64) DEFAULT ''::character varying NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    method character varying(10) DEFAULT ''::character varying NOT NULL,
    url character varying(500) DEFAULT ''::character varying NOT NULL,
    ip character varying(64) DEFAULT ''::character varying NOT NULL,
    location character varying(255) DEFAULT ''::character varying NOT NULL,
    user_agent character varying(500) DEFAULT ''::character varying NOT NULL,
    request_body text,
    response_body text,
    error_message character varying(1000) DEFAULT ''::character varying NOT NULL,
    status boolean DEFAULT true NOT NULL,
    elapsed bigint DEFAULT '0'::bigint NOT NULL,
    created_at bigint
);


ALTER TABLE xygonew.xy_admin_operation_log OWNER TO postgres;

--
-- Name: xy_admin_operation_log_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_operation_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_operation_log_id_seq OWNER TO postgres;

--
-- Name: xy_admin_operation_log_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_operation_log_id_seq OWNED BY xygonew.xy_admin_operation_log.id;


--
-- Name: xy_admin_post; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_post (
    id bigint NOT NULL,
    code character varying(64) NOT NULL,
    name character varying(50) NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    remark character varying(500) DEFAULT ''::character varying,
    created_by bigint DEFAULT '0'::bigint,
    updated_by bigint DEFAULT '0'::bigint,
    create_time bigint DEFAULT '0'::bigint,
    update_time bigint DEFAULT '0'::bigint
);


ALTER TABLE xygonew.xy_admin_post OWNER TO postgres;

--
-- Name: xy_admin_post_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_post_id_seq OWNER TO postgres;

--
-- Name: xy_admin_post_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_post_id_seq OWNED BY xygonew.xy_admin_post.id;


--
-- Name: xy_admin_role; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_role (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    data_scope smallint DEFAULT '0'::smallint NOT NULL,
    custom_depts text,
    pid bigint DEFAULT '0'::bigint NOT NULL,
    level bigint DEFAULT '1'::bigint NOT NULL,
    tree character varying(255) DEFAULT '0'::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_by bigint DEFAULT '0'::bigint NOT NULL,
    updated_by bigint DEFAULT '0'::bigint NOT NULL,
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE xygonew.xy_admin_role OWNER TO postgres;

--
-- Name: xy_admin_role_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_role_id_seq OWNER TO postgres;

--
-- Name: xy_admin_role_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_role_id_seq OWNED BY xygonew.xy_admin_role.id;


--
-- Name: xy_admin_role_menu; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_role_menu (
    role_id bigint NOT NULL,
    menu_id bigint NOT NULL
);


ALTER TABLE xygonew.xy_admin_role_menu OWNER TO postgres;

--
-- Name: xy_admin_user; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_user (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    nickname character varying(50) DEFAULT ''::character varying NOT NULL,
    real_name character varying(50),
    password character varying(255) NOT NULL,
    gender boolean DEFAULT false NOT NULL,
    salt character varying(50) DEFAULT ''::character varying NOT NULL,
    mobile character varying(20) DEFAULT ''::character varying NOT NULL,
    address character varying(255),
    remark character varying(500),
    email character varying(100) DEFAULT ''::character varying NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    dept_id bigint DEFAULT '0'::bigint NOT NULL,
    pid bigint DEFAULT '0'::bigint,
    is_super smallint DEFAULT '0'::smallint NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    last_login_at bigint,
    last_login_ip character varying(50) DEFAULT ''::character varying NOT NULL,
    created_by bigint DEFAULT '0'::bigint NOT NULL,
    updated_by bigint DEFAULT '0'::bigint NOT NULL,
    create_time bigint,
    update_time bigint
);


ALTER TABLE xygonew.xy_admin_user OWNER TO postgres;

--
-- Name: xy_admin_user_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_admin_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_admin_user_id_seq OWNER TO postgres;

--
-- Name: xy_admin_user_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_admin_user_id_seq OWNED BY xygonew.xy_admin_user.id;


--
-- Name: xy_admin_user_post; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_user_post (
    user_id bigint NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE xygonew.xy_admin_user_post OWNER TO postgres;

--
-- Name: xy_admin_user_role; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_admin_user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE xygonew.xy_admin_user_role OWNER TO postgres;

--
-- Name: xy_captcha; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_captcha (
    id bigint NOT NULL,
    key character varying(64) DEFAULT ''::character varying NOT NULL,
    code character varying(64) DEFAULT ''::character varying NOT NULL,
    captcha text,
    create_time bigint DEFAULT '0'::bigint NOT NULL,
    expire_time bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_captcha OWNER TO postgres;

--
-- Name: xy_captcha_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_captcha_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_captcha_id_seq OWNER TO postgres;

--
-- Name: xy_captcha_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_captcha_id_seq OWNED BY xygonew.xy_captcha.id;


--
-- Name: xy_demo_article; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_demo_article (
    id bigint NOT NULL,
    category_id bigint DEFAULT '0'::bigint NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    cover character varying(500) DEFAULT ''::character varying NOT NULL,
    summary character varying(500) DEFAULT ''::character varying NOT NULL,
    content text,
    author character varying(50) DEFAULT ''::character varying NOT NULL,
    views bigint DEFAULT '0'::bigint NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at bigint DEFAULT '0'::bigint NOT NULL,
    updated_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_demo_article OWNER TO postgres;

--
-- Name: xy_demo_article_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_demo_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_demo_article_id_seq OWNER TO postgres;

--
-- Name: xy_demo_article_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_demo_article_id_seq OWNED BY xygonew.xy_demo_article.id;


--
-- Name: xy_demo_category; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_demo_category (
    id bigint NOT NULL,
    parent_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    icon character varying(100) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint DEFAULT '0'::bigint NOT NULL,
    updated_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_demo_category OWNER TO postgres;

--
-- Name: xy_demo_category_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_demo_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_demo_category_id_seq OWNER TO postgres;

--
-- Name: xy_demo_category_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_demo_category_id_seq OWNED BY xygonew.xy_demo_category.id;


--
-- Name: xy_member; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member (
    id bigint NOT NULL,
    username character varying(32) DEFAULT ''::character varying NOT NULL,
    password character varying(128) DEFAULT ''::character varying NOT NULL,
    mobile character varying(20) DEFAULT ''::character varying NOT NULL,
    email character varying(64) DEFAULT ''::character varying NOT NULL,
    nickname character varying(64) DEFAULT ''::character varying NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    gender boolean DEFAULT false NOT NULL,
    birthday date,
    money numeric(10,2) DEFAULT 0.00 NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    level smallint DEFAULT '1'::smallint NOT NULL,
    group_id bigint DEFAULT '0'::bigint NOT NULL,
    status boolean DEFAULT true NOT NULL,
    last_login_ip character varying(50) DEFAULT ''::character varying NOT NULL,
    last_login_at bigint,
    login_count bigint DEFAULT '0'::bigint NOT NULL,
    created_at bigint,
    updated_at bigint,
    deleted_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_member OWNER TO postgres;

--
-- Name: xy_member_checkin; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_checkin (
    id bigint NOT NULL,
    member_id bigint DEFAULT '0'::bigint NOT NULL,
    checkin_date bigint,
    score integer DEFAULT 0 NOT NULL,
    continuous_days integer DEFAULT 1 NOT NULL,
    created_at bigint
);


ALTER TABLE xygonew.xy_member_checkin OWNER TO postgres;

--
-- Name: xy_member_checkin_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_checkin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_checkin_id_seq OWNER TO postgres;

--
-- Name: xy_member_checkin_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_checkin_id_seq OWNED BY xygonew.xy_member_checkin.id;


--
-- Name: xy_member_group; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_group (
    id bigint NOT NULL,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    rules text,
    status boolean DEFAULT true NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE xygonew.xy_member_group OWNER TO postgres;

--
-- Name: xy_member_group_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_group_id_seq OWNER TO postgres;

--
-- Name: xy_member_group_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_group_id_seq OWNED BY xygonew.xy_member_group.id;


--
-- Name: xy_member_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_id_seq OWNER TO postgres;

--
-- Name: xy_member_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_id_seq OWNED BY xygonew.xy_member.id;


--
-- Name: xy_member_login_log; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_login_log (
    id bigint NOT NULL,
    member_id bigint DEFAULT '0'::bigint NOT NULL,
    username character varying(32) DEFAULT ''::character varying NOT NULL,
    ip character varying(50) DEFAULT ''::character varying NOT NULL,
    user_agent character varying(512) DEFAULT ''::character varying NOT NULL,
    status boolean DEFAULT true NOT NULL,
    message character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE xygonew.xy_member_login_log OWNER TO postgres;

--
-- Name: xy_member_login_log_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_login_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_login_log_id_seq OWNER TO postgres;

--
-- Name: xy_member_login_log_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_login_log_id_seq OWNED BY xygonew.xy_member_login_log.id;


--
-- Name: xy_member_menu; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_menu (
    id bigint NOT NULL,
    pid bigint DEFAULT '0'::bigint NOT NULL,
    title character varying(32) DEFAULT ''::character varying NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    path character varying(128) DEFAULT ''::character varying NOT NULL,
    component character varying(255) DEFAULT ''::character varying NOT NULL,
    icon character varying(64) DEFAULT ''::character varying NOT NULL,
    menu_type character varying(20) DEFAULT 'tab'::character varying NOT NULL,
    url character varying(500) DEFAULT ''::character varying NOT NULL,
    no_login_valid boolean DEFAULT false NOT NULL,
    extend character varying(20) DEFAULT 'none'::character varying NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    type character varying(20) DEFAULT 'menu'::character varying NOT NULL,
    permission character varying(64) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE xygonew.xy_member_menu OWNER TO postgres;

--
-- Name: xy_member_menu_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_menu_id_seq OWNER TO postgres;

--
-- Name: xy_member_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_menu_id_seq OWNED BY xygonew.xy_member_menu.id;


--
-- Name: xy_member_money_log; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_money_log (
    id bigint NOT NULL,
    member_id bigint DEFAULT '0'::bigint NOT NULL,
    money integer DEFAULT 0 NOT NULL,
    before integer DEFAULT 0 NOT NULL,
    after integer DEFAULT 0 NOT NULL,
    memo character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE xygonew.xy_member_money_log OWNER TO postgres;

--
-- Name: xy_member_money_log_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_money_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_money_log_id_seq OWNER TO postgres;

--
-- Name: xy_member_money_log_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_money_log_id_seq OWNED BY xygonew.xy_member_money_log.id;


--
-- Name: xy_member_notice; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_notice (
    id bigint NOT NULL,
    title character varying(255) DEFAULT ''::character varying NOT NULL,
    content text,
    type character varying(20) DEFAULT 'system'::character varying NOT NULL,
    target character varying(20) DEFAULT 'all'::character varying NOT NULL,
    target_id bigint DEFAULT '0'::bigint NOT NULL,
    sender character varying(50) DEFAULT '系统'::character varying NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created_at bigint
);


ALTER TABLE xygonew.xy_member_notice OWNER TO postgres;

--
-- Name: xy_member_notice_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_notice_id_seq OWNER TO postgres;

--
-- Name: xy_member_notice_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_notice_id_seq OWNED BY xygonew.xy_member_notice.id;


--
-- Name: xy_member_notice_read; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_notice_read (
    id bigint NOT NULL,
    notice_id bigint DEFAULT '0'::bigint NOT NULL,
    member_id bigint DEFAULT '0'::bigint NOT NULL,
    read_at bigint
);


ALTER TABLE xygonew.xy_member_notice_read OWNER TO postgres;

--
-- Name: xy_member_notice_read_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_notice_read_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_notice_read_id_seq OWNER TO postgres;

--
-- Name: xy_member_notice_read_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_notice_read_id_seq OWNED BY xygonew.xy_member_notice_read.id;


--
-- Name: xy_member_score_log; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_member_score_log (
    id bigint NOT NULL,
    member_id bigint DEFAULT '0'::bigint NOT NULL,
    score integer DEFAULT 0 NOT NULL,
    before integer DEFAULT 0 NOT NULL,
    after integer DEFAULT 0 NOT NULL,
    memo character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint
);


ALTER TABLE xygonew.xy_member_score_log OWNER TO postgres;

--
-- Name: xy_member_score_log_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_member_score_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_member_score_log_id_seq OWNER TO postgres;

--
-- Name: xy_member_score_log_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_member_score_log_id_seq OWNED BY xygonew.xy_member_score_log.id;


--
-- Name: xy_sys_attachment; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_sys_attachment (
    id bigint NOT NULL,
    topic character varying(20) DEFAULT ''::character varying NOT NULL,
    user_id bigint DEFAULT '0'::bigint NOT NULL,
    url character varying(255) DEFAULT ''::character varying NOT NULL,
    width bigint DEFAULT '0'::bigint NOT NULL,
    height bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(120) DEFAULT ''::character varying NOT NULL,
    size bigint DEFAULT '0'::bigint NOT NULL,
    mimetype character varying(100) DEFAULT ''::character varying NOT NULL,
    quote bigint DEFAULT '0'::bigint NOT NULL,
    storage character varying(50) DEFAULT 'local'::character varying NOT NULL,
    sha1 character varying(40) DEFAULT ''::character varying NOT NULL,
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE xygonew.xy_sys_attachment OWNER TO postgres;

--
-- Name: xy_sys_attachment_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_sys_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_sys_attachment_id_seq OWNER TO postgres;

--
-- Name: xy_sys_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_sys_attachment_id_seq OWNED BY xygonew.xy_sys_attachment.id;


--
-- Name: xy_sys_config; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_sys_config (
    id bigint NOT NULL,
    "group" character varying(64) DEFAULT ''::character varying NOT NULL,
    group_name character varying(64) DEFAULT ''::character varying NOT NULL,
    name character varying(128) DEFAULT ''::character varying NOT NULL,
    key character varying(128) DEFAULT ''::character varying NOT NULL,
    value text,
    type character varying(32) DEFAULT 'text'::character varying NOT NULL,
    options json,
    rules json,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    allow_del boolean DEFAULT false NOT NULL,
    created_by bigint,
    updated_by bigint,
    create_time bigint NOT NULL,
    update_time bigint NOT NULL
);


ALTER TABLE xygonew.xy_sys_config OWNER TO postgres;

--
-- Name: xy_sys_config_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_sys_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_sys_config_id_seq OWNER TO postgres;

--
-- Name: xy_sys_config_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_sys_config_id_seq OWNED BY xygonew.xy_sys_config.id;


--
-- Name: xy_sys_cron; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_sys_cron (
    id bigint NOT NULL,
    group_id bigint DEFAULT '0'::bigint NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    params character varying(1000) DEFAULT ''::character varying NOT NULL,
    pattern character varying(100) DEFAULT ''::character varying NOT NULL,
    policy smallint DEFAULT '1'::smallint NOT NULL,
    count integer DEFAULT 0 NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(500) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    created_at bigint DEFAULT '0'::bigint NOT NULL,
    updated_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_sys_cron OWNER TO postgres;

--
-- Name: xy_sys_cron_group; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_sys_cron_group (
    id bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    remark character varying(500) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    created_at bigint DEFAULT '0'::bigint NOT NULL,
    updated_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_sys_cron_group OWNER TO postgres;

--
-- Name: xy_sys_cron_group_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_sys_cron_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_sys_cron_group_id_seq OWNER TO postgres;

--
-- Name: xy_sys_cron_group_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_sys_cron_group_id_seq OWNED BY xygonew.xy_sys_cron_group.id;


--
-- Name: xy_sys_cron_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_sys_cron_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_sys_cron_id_seq OWNER TO postgres;

--
-- Name: xy_sys_cron_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_sys_cron_id_seq OWNED BY xygonew.xy_sys_cron.id;


--
-- Name: xy_sys_cron_log; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_sys_cron_log (
    id bigint NOT NULL,
    cron_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    title character varying(200) DEFAULT ''::character varying NOT NULL,
    params character varying(1000) DEFAULT ''::character varying NOT NULL,
    status smallint DEFAULT '1'::smallint NOT NULL,
    output text,
    err_msg text,
    take_ms integer DEFAULT 0 NOT NULL,
    created_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_sys_cron_log OWNER TO postgres;

--
-- Name: xy_sys_cron_log_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_sys_cron_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_sys_cron_log_id_seq OWNER TO postgres;

--
-- Name: xy_sys_cron_log_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_sys_cron_log_id_seq OWNED BY xygonew.xy_sys_cron_log.id;


--
-- Name: xy_sys_gen_codes; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_sys_gen_codes (
    id bigint NOT NULL,
    gen_type smallint DEFAULT '10'::smallint NOT NULL,
    db_name character varying(50) DEFAULT ''::character varying NOT NULL,
    table_name character varying(100) DEFAULT ''::character varying NOT NULL,
    table_comment character varying(200) DEFAULT ''::character varying NOT NULL,
    var_name character varying(100) DEFAULT ''::character varying NOT NULL,
    options json,
    status smallint DEFAULT '2'::smallint NOT NULL,
    created_at bigint DEFAULT '0'::bigint NOT NULL,
    updated_at bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_sys_gen_codes OWNER TO postgres;

--
-- Name: xy_sys_gen_codes_column; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_sys_gen_codes_column (
    id bigint NOT NULL,
    gen_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    go_name character varying(100) DEFAULT ''::character varying NOT NULL,
    ts_name character varying(100) DEFAULT ''::character varying NOT NULL,
    db_type character varying(50) DEFAULT ''::character varying NOT NULL,
    go_type character varying(50) DEFAULT ''::character varying NOT NULL,
    ts_type character varying(50) DEFAULT ''::character varying NOT NULL,
    comment character varying(200) DEFAULT ''::character varying NOT NULL,
    is_pk smallint DEFAULT '0'::smallint NOT NULL,
    is_required smallint DEFAULT '0'::smallint NOT NULL,
    is_list smallint DEFAULT '1'::smallint NOT NULL,
    is_edit smallint DEFAULT '1'::smallint NOT NULL,
    is_query smallint DEFAULT '0'::smallint NOT NULL,
    query_type character varying(20) DEFAULT 'eq'::character varying NOT NULL,
    design_type character varying(30) NOT NULL,
    extra text,
    form_type character varying(30) DEFAULT 'input'::character varying NOT NULL,
    dict_type character varying(50) DEFAULT ''::character varying NOT NULL,
    sort bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_sys_gen_codes_column OWNER TO postgres;

--
-- Name: xy_sys_gen_codes_column_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_sys_gen_codes_column_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_sys_gen_codes_column_id_seq OWNER TO postgres;

--
-- Name: xy_sys_gen_codes_column_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_sys_gen_codes_column_id_seq OWNED BY xygonew.xy_sys_gen_codes_column.id;


--
-- Name: xy_sys_gen_codes_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_sys_gen_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_sys_gen_codes_id_seq OWNER TO postgres;

--
-- Name: xy_sys_gen_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_sys_gen_codes_id_seq OWNED BY xygonew.xy_sys_gen_codes.id;


--
-- Name: xy_test_category; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_test_category (
    id bigint NOT NULL,
    parent_id bigint DEFAULT '0'::bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    icon character varying(255) DEFAULT ''::character varying NOT NULL,
    image character varying(500) DEFAULT ''::character varying NOT NULL,
    sort integer DEFAULT 0 NOT NULL,
    status boolean DEFAULT true NOT NULL,
    remark character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE xygonew.xy_test_category OWNER TO postgres;

--
-- Name: xy_test_category_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_test_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_test_category_id_seq OWNER TO postgres;

--
-- Name: xy_test_category_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_test_category_id_seq OWNED BY xygonew.xy_test_category.id;


--
-- Name: xy_test_code; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_test_code (
    id bigint NOT NULL,
    name character varying(100) DEFAULT ''::character varying NOT NULL,
    member_id bigint DEFAULT '0'::bigint NOT NULL
);


ALTER TABLE xygonew.xy_test_code OWNER TO postgres;

--
-- Name: xy_test_code_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_test_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_test_code_id_seq OWNER TO postgres;

--
-- Name: xy_test_code_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_test_code_id_seq OWNED BY xygonew.xy_test_code.id;


--
-- Name: xy_test_codec; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_test_codec (
    id bigint NOT NULL,
    status boolean DEFAULT false NOT NULL,
    create_time time without time zone
);


ALTER TABLE xygonew.xy_test_codec OWNER TO postgres;

--
-- Name: xy_test_codec_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_test_codec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_test_codec_id_seq OWNER TO postgres;

--
-- Name: xy_test_codec_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_test_codec_id_seq OWNED BY xygonew.xy_test_codec.id;


--
-- Name: xy_test_order; Type: TABLE; Schema: xygonew; Owner: postgres
--

CREATE TABLE xygonew.xy_test_order (
    id bigint NOT NULL,
    member_id bigint DEFAULT '0'::bigint NOT NULL,
    apply_id bigint DEFAULT '0'::bigint NOT NULL,
    amount numeric(10,2) DEFAULT 0.00 NOT NULL,
    status boolean DEFAULT false NOT NULL,
    memo character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at bigint,
    updated_at bigint
);


ALTER TABLE xygonew.xy_test_order OWNER TO postgres;

--
-- Name: xy_test_order_id_seq; Type: SEQUENCE; Schema: xygonew; Owner: postgres
--

CREATE SEQUENCE xygonew.xy_test_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE xygonew.xy_test_order_id_seq OWNER TO postgres;

--
-- Name: xy_test_order_id_seq; Type: SEQUENCE OWNED BY; Schema: xygonew; Owner: postgres
--

ALTER SEQUENCE xygonew.xy_test_order_id_seq OWNED BY xygonew.xy_test_order.id;


--
-- Name: xy_admin_chat_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_chat_message ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_chat_message_id_seq'::regclass);


--
-- Name: xy_admin_chat_session id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_chat_session ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_chat_session_id_seq'::regclass);


--
-- Name: xy_admin_chat_session_member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_chat_session_member ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_chat_session_member_id_seq'::regclass);


--
-- Name: xy_admin_dept id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_dept ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_dept_id_seq'::regclass);


--
-- Name: xy_admin_dept_closure id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_dept_closure ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_dept_closure_id_seq'::regclass);


--
-- Name: xy_admin_field_perm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_field_perm ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_field_perm_id_seq'::regclass);


--
-- Name: xy_admin_login_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_login_log ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_login_log_id_seq'::regclass);


--
-- Name: xy_admin_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_menu ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_menu_id_seq'::regclass);


--
-- Name: xy_admin_notice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_notice ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_notice_id_seq'::regclass);


--
-- Name: xy_admin_notice_read id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_notice_read ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_notice_read_id_seq'::regclass);


--
-- Name: xy_admin_operation_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_operation_log ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_operation_log_id_seq'::regclass);


--
-- Name: xy_admin_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_post ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_post_id_seq'::regclass);


--
-- Name: xy_admin_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_role ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_role_id_seq'::regclass);


--
-- Name: xy_admin_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_user ALTER COLUMN id SET DEFAULT nextval('public.xy_admin_user_id_seq'::regclass);


--
-- Name: xy_captcha id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_captcha ALTER COLUMN id SET DEFAULT nextval('public.xy_captcha_id_seq'::regclass);


--
-- Name: xy_cms_case id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_case ALTER COLUMN id SET DEFAULT nextval('public.xy_cms_case_id_seq'::regclass);


--
-- Name: xy_cms_case_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_case_category ALTER COLUMN id SET DEFAULT nextval('public.xy_cms_case_category_id_seq'::regclass);


--
-- Name: xy_cms_doc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_doc ALTER COLUMN id SET DEFAULT nextval('public.xy_cms_doc_id_seq'::regclass);


--
-- Name: xy_cms_doc_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_doc_category ALTER COLUMN id SET DEFAULT nextval('public.xy_cms_doc_category_id_seq'::regclass);


--
-- Name: xy_community_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_category ALTER COLUMN id SET DEFAULT nextval('public.xy_community_category_id_seq'::regclass);


--
-- Name: xy_community_collect id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_collect ALTER COLUMN id SET DEFAULT nextval('public.xy_community_collect_id_seq'::regclass);


--
-- Name: xy_community_like id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_like ALTER COLUMN id SET DEFAULT nextval('public.xy_community_like_id_seq'::regclass);


--
-- Name: xy_community_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_post ALTER COLUMN id SET DEFAULT nextval('public.xy_community_post_id_seq'::regclass);


--
-- Name: xy_community_reply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_reply ALTER COLUMN id SET DEFAULT nextval('public.xy_community_reply_id_seq'::regclass);


--
-- Name: xy_community_search_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_search_log ALTER COLUMN id SET DEFAULT nextval('public.xy_community_search_log_id_seq'::regclass);


--
-- Name: xy_demo_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_demo_article ALTER COLUMN id SET DEFAULT nextval('public.xy_demo_article_id_seq'::regclass);


--
-- Name: xy_demo_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_demo_category ALTER COLUMN id SET DEFAULT nextval('public.xy_demo_category_id_seq'::regclass);


--
-- Name: xy_member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member ALTER COLUMN id SET DEFAULT nextval('public.xy_member_id_seq'::regclass);


--
-- Name: xy_member_checkin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_checkin ALTER COLUMN id SET DEFAULT nextval('public.xy_member_checkin_id_seq'::regclass);


--
-- Name: xy_member_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_group ALTER COLUMN id SET DEFAULT nextval('public.xy_member_group_id_seq'::regclass);


--
-- Name: xy_member_login_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_login_log ALTER COLUMN id SET DEFAULT nextval('public.xy_member_login_log_id_seq'::regclass);


--
-- Name: xy_member_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_menu ALTER COLUMN id SET DEFAULT nextval('public.xy_member_menu_id_seq'::regclass);


--
-- Name: xy_member_money_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_money_log ALTER COLUMN id SET DEFAULT nextval('public.xy_member_money_log_id_seq'::regclass);


--
-- Name: xy_member_notice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_notice ALTER COLUMN id SET DEFAULT nextval('public.xy_member_notice_id_seq'::regclass);


--
-- Name: xy_member_notice_read id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_notice_read ALTER COLUMN id SET DEFAULT nextval('public.xy_member_notice_read_id_seq'::regclass);


--
-- Name: xy_member_score_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_score_log ALTER COLUMN id SET DEFAULT nextval('public.xy_member_score_log_id_seq'::regclass);


--
-- Name: xy_sys_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_attachment ALTER COLUMN id SET DEFAULT nextval('public.xy_sys_attachment_id_seq'::regclass);


--
-- Name: xy_sys_config id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_config ALTER COLUMN id SET DEFAULT nextval('public.xy_sys_config_id_seq'::regclass);


--
-- Name: xy_sys_cron id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_cron ALTER COLUMN id SET DEFAULT nextval('public.xy_sys_cron_id_seq'::regclass);


--
-- Name: xy_sys_cron_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_cron_group ALTER COLUMN id SET DEFAULT nextval('public.xy_sys_cron_group_id_seq'::regclass);


--
-- Name: xy_sys_cron_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_cron_log ALTER COLUMN id SET DEFAULT nextval('public.xy_sys_cron_log_id_seq'::regclass);


--
-- Name: xy_sys_gen_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_gen_codes ALTER COLUMN id SET DEFAULT nextval('public.xy_sys_gen_codes_id_seq'::regclass);


--
-- Name: xy_sys_gen_codes_column id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_gen_codes_column ALTER COLUMN id SET DEFAULT nextval('public.xy_sys_gen_codes_column_id_seq'::regclass);


--
-- Name: xy_test_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_category ALTER COLUMN id SET DEFAULT nextval('public.xy_test_category_id_seq'::regclass);


--
-- Name: xy_test_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_code ALTER COLUMN id SET DEFAULT nextval('public.xy_test_code_id_seq'::regclass);


--
-- Name: xy_test_codec id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_codec ALTER COLUMN id SET DEFAULT nextval('public.xy_test_codec_id_seq'::regclass);


--
-- Name: xy_test_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_order ALTER COLUMN id SET DEFAULT nextval('public.xy_test_order_id_seq'::regclass);


--
-- Name: xy_admin_chat_message id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_chat_message ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_chat_message_id_seq'::regclass);


--
-- Name: xy_admin_chat_session id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_chat_session ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_chat_session_id_seq'::regclass);


--
-- Name: xy_admin_chat_session_member id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_chat_session_member ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_chat_session_member_id_seq'::regclass);


--
-- Name: xy_admin_dept id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_dept ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_dept_id_seq'::regclass);


--
-- Name: xy_admin_dept_closure id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_dept_closure ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_dept_closure_id_seq'::regclass);


--
-- Name: xy_admin_field_perm id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_field_perm ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_field_perm_id_seq'::regclass);


--
-- Name: xy_admin_login_log id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_login_log ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_login_log_id_seq'::regclass);


--
-- Name: xy_admin_menu id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_menu ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_menu_id_seq'::regclass);


--
-- Name: xy_admin_notice id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_notice ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_notice_id_seq'::regclass);


--
-- Name: xy_admin_notice_read id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_notice_read ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_notice_read_id_seq'::regclass);


--
-- Name: xy_admin_operation_log id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_operation_log ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_operation_log_id_seq'::regclass);


--
-- Name: xy_admin_post id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_post ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_post_id_seq'::regclass);


--
-- Name: xy_admin_role id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_role ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_role_id_seq'::regclass);


--
-- Name: xy_admin_user id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_admin_user ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_admin_user_id_seq'::regclass);


--
-- Name: xy_captcha id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_captcha ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_captcha_id_seq'::regclass);


--
-- Name: xy_demo_article id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_demo_article ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_demo_article_id_seq'::regclass);


--
-- Name: xy_demo_category id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_demo_category ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_demo_category_id_seq'::regclass);


--
-- Name: xy_member id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_id_seq'::regclass);


--
-- Name: xy_member_checkin id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_checkin ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_checkin_id_seq'::regclass);


--
-- Name: xy_member_group id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_group ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_group_id_seq'::regclass);


--
-- Name: xy_member_login_log id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_login_log ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_login_log_id_seq'::regclass);


--
-- Name: xy_member_menu id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_menu ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_menu_id_seq'::regclass);


--
-- Name: xy_member_money_log id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_money_log ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_money_log_id_seq'::regclass);


--
-- Name: xy_member_notice id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_notice ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_notice_id_seq'::regclass);


--
-- Name: xy_member_notice_read id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_notice_read ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_notice_read_id_seq'::regclass);


--
-- Name: xy_member_score_log id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_member_score_log ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_member_score_log_id_seq'::regclass);


--
-- Name: xy_sys_attachment id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_sys_attachment ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_sys_attachment_id_seq'::regclass);


--
-- Name: xy_sys_config id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_sys_config ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_sys_config_id_seq'::regclass);


--
-- Name: xy_sys_cron id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_sys_cron ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_sys_cron_id_seq'::regclass);


--
-- Name: xy_sys_cron_group id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_sys_cron_group ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_sys_cron_group_id_seq'::regclass);


--
-- Name: xy_sys_cron_log id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_sys_cron_log ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_sys_cron_log_id_seq'::regclass);


--
-- Name: xy_sys_gen_codes id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_sys_gen_codes ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_sys_gen_codes_id_seq'::regclass);


--
-- Name: xy_sys_gen_codes_column id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_sys_gen_codes_column ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_sys_gen_codes_column_id_seq'::regclass);


--
-- Name: xy_test_category id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_test_category ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_test_category_id_seq'::regclass);


--
-- Name: xy_test_code id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_test_code ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_test_code_id_seq'::regclass);


--
-- Name: xy_test_codec id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_test_codec ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_test_codec_id_seq'::regclass);


--
-- Name: xy_test_order id; Type: DEFAULT; Schema: xygonew; Owner: postgres
--

ALTER TABLE ONLY xygonew.xy_test_order ALTER COLUMN id SET DEFAULT nextval('xygonew.xy_test_order_id_seq'::regclass);


--
-- Data for Name: xy_admin_chat_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_chat_message (id, session_id, sender_id, type, content, created_at) FROM stdin;
1	1	2	1	你好	1770709004
2	1	2	1	我是李小龙	1770709123
3	1	2	1	你试试	1770709436
4	1	2	1	自己当时发完自己看不到 的重新打卡才能看到	1770709475
5	1	2	1	怎么是	1770709490
6	1	2	1	你是谁啊	1770709696
7	1	2	1	我是校长	1770709712
8	1	2	1	你可以看到我们	1770709778
9	1	2	1	你是谁	1770710049
10	1	2	1	我是我	1770710211
11	1	2	1	我也可能是你	1770710222
12	1	2	1	你不是我	1770710429
13	1	2	1	你说话啊	1770710619
14	1	2	1	我来了	1770710634
15	1	1	1	haode	1770710640
16	1	1	2	/attachment/upload/20260210/b17249d2-0d9d-496d-a6a5-1c9c2c603459.webp	1770710651
17	4	0	3	admin2 创建了群聊	1770711683
18	4	2	1	hellow	1770711690
19	4	1	1	laile	1770711703
20	1	1	1	我呢	1770738262
21	1	1	1	这是我	1770738530
22	1	1	1	你是谁	1770796950
23	1	2	1	我是你的人	1770796994
\.


--
-- Data for Name: xy_admin_chat_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_chat_session (id, type, name, avatar, creator_id, last_message, last_message_time, member_count, created_at, updated_at) FROM stdin;
1	1			2	我是你的人	1770796994	2	1770708990	1770796994
2	1			2		1770711417	2	1770711417	1770711417
3	1			2		1770711657	2	1770711657	1770711657
4	2	testgroup		2	laile	1770711703	4	1770711683	1770711703
\.


--
-- Data for Name: xy_admin_chat_session_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_chat_session_member (id, session_id, user_id, role, unread_count, last_read_msg_id, is_muted, is_deleted, joined_at) FROM stdin;
1	1	1	1	0	23	0	0	1770708990
2	1	2	1	0	22	0	0	1770708990
3	2	3	1	0	0	0	0	1770711417
4	2	2	1	0	0	0	0	1770711417
5	3	4	1	0	0	0	0	1770711657
6	3	2	1	0	0	0	0	1770711657
7	4	1	1	0	19	0	0	1770711683
8	4	3	1	2	0	0	0	1770711683
9	4	4	1	2	0	0	0	1770711683
10	4	2	3	0	19	0	0	1770711683
\.


--
-- Data for Name: xy_admin_dept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_dept (id, parent_id, name, sort, status, remark, create_by, create_time, update_time) FROM stdin;
1	0	总公司	1	1	顶级部门	0	1768570149	1768570149
2	1	技术部	1	1	负责技术开发	0	1768570149	1768570149
3	1	市场部	2	1	负责市场推广	0	1768570149	1768570149
4	1	财务部	3	1	负责财务管理	0	1768570149	1768570149
5	2	前端组	1	1	前端开发团队	0	1768570149	1768570149
6	2	后端组	2	1	后端开发团队	0	1768570149	1768570149
7	3	线上推广组	1	1	负责线上营销	0	1768570149	1768570149
8	3	线下推广组	2	1	负责线下活动	0	1768570149	1768570149
\.


--
-- Data for Name: xy_admin_dept_closure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_dept_closure (id, ancestor, descendant, level) FROM stdin;
1	1	1	0
2	1	2	1
3	2	2	0
4	1	3	1
5	3	3	0
6	1	4	1
7	4	4	0
8	1	5	2
9	2	5	1
10	5	5	0
11	1	6	2
12	2	6	1
13	6	6	0
14	1	7	2
15	3	7	1
16	7	7	0
17	1	8	2
18	3	8	1
19	8	8	0
\.


--
-- Data for Name: xy_admin_field_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_field_perm (id, role_id, module, resource, field_name, field_label, perm_type, status, remark, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: xy_admin_login_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_login_log (id, user_id, username, ip, location, user_agent, browser, os, status, message, created_at) FROM stdin;
2	1	admin	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	Edge	Windows	1	登录成功	1770961552
3	1	admin	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	Edge	Windows	1	登录成功	1771485063
4	1	admin	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	Edge	Windows	0	密码错误（剩余4次）	1771498151
5	1	admin	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	Edge	Windows	1	登录成功	1771498161
6	1	admin	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	Edge	Windows	1	登录成功	1771506634
7	1	admin	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	Edge	Windows	0	密码错误（剩余4次）	1771592421
8	1	admin	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	Edge	Windows	1	登录成功	1771592431
\.


--
-- Data for Name: xy_admin_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_menu (id, parent_id, type, title, name, path, component, resource, icon, hidden, keep_alive, redirect, frame_src, perms, is_frame, affix, show_badge, badge_text, active_path, hide_tab, is_full_page, sort, status, remark, created_by, updated_by, create_time, update_time) FROM stdin;
1	0	1	仪表盘	Dashboard	/dashboard	/index/index		ri:pie-chart-line	0	0				0	0	0			0	0	10	1	仪表盘根	0	0	1768549363	1768549363
2	1	2	工作台	Console	console	/dashboard/console		ri:home-smile-2-line	0	0				0	0	0			0	0	11	1	仪表盘-工作台	0	0	1768549363	1768549363
3	1	2	分析页	Analysis	analysis	/dashboard/analysis		ri:align-item-bottom-line	0	0				0	0	0			0	0	12	1	仪表盘-分析	0	0	1768549363	1768549363
4	1	2	电商页	Ecommerce	ecommerce	/dashboard/ecommerce		ri:bar-chart-box-line	0	0				0	0	0			0	0	13	1	仪表盘-电商	0	0	1768549363	1768549363
10	0	1	模板中心	Template	/template	/index/index		ri:apps-2-line	0	0				0	0	0			0	0	20	1	模板根	0	0	1768549363	1768549363
11	10	2	卡片	Cards	cards	/template/cards		ri:wallet-line	0	0				0	0	0			0	0	21	1	模板-卡片	0	0	1768549363	1768549363
12	10	2	横幅	Banners	banners	/template/banners		ri:rectangle-line	0	0				0	0	0			0	0	22	1	模板-横幅	0	0	1768549363	1768549363
13	10	2	图表	Charts	charts	/template/charts		ri:bar-chart-box-line	0	0				0	0	0			0	0	23	1	模板-图表	0	0	1768549363	1768549363
14	10	2	地图	Map	map	/template/map		ri:map-pin-line	0	0				0	0	0			0	0	24	1	模板-地图	0	0	1768549363	1768549363
15	10	2	聊天	Chat	chat	/template/chat		ri:message-3-line	0	0				0	0	0			0	0	25	1	模板-聊天	0	0	1768549363	1768549363
16	10	2	日历	Calendar	calendar	/template/calendar		ri:calendar-2-line	0	0				0	0	0			0	0	26	1	模板-日历	0	0	1768549363	1768549363
17	10	2	定价	Pricing	pricing	/template/pricing		ri:money-cny-box-line	0	0				0	0	0			0	0	27	1	模板-定价	0	0	1768549363	1768549363
20	0	2	组件中心	Widgets	/widgets	/index/index		ri:apps-2-add-line	0	0				0	0	0			0	0	30	1		0	0	1768549363	1768549363
21	20	2	图标	Icon	icon	/widgets/icon		ri:palette-line	0	0				0	0	0			0	0	31	1	组件-图标	0	0	1768549363	1768549363
22	20	2	图片裁剪	ImageCrop	image-crop	/widgets/image-crop		ri:screenshot-line	0	0				0	0	0			0	0	32	1	组件-裁剪	0	0	1768549363	1768549363
23	20	2	Excel	Excel	excel	/widgets/excel		ri:download-2-line	0	0				0	0	0			0	0	33	1	组件-Excel	0	0	1768549363	1768549363
24	20	2	视频	Video	video	/widgets/video		ri:vidicon-line	0	0				0	0	0			0	0	34	1	组件-视频	0	0	1768549363	1768549363
25	20	2	CountTo	CountTo	count-to	/widgets/count-to		ri:anthropic-line	0	0				0	0	0			0	0	35	1	组件-CountTo	0	0	1768549363	1768549363
26	20	2	富文本	WangEditor	wang-editor	/widgets/wang-editor		ri:t-box-line	0	0				0	0	0			0	0	36	1	组件-富文本	0	0	1768549363	1768549363
27	20	2	水印	Watermark	watermark	/widgets/watermark		ri:water-flash-line	0	0				0	0	0			0	0	37	1	组件-水印	0	0	1768549363	1768549363
28	20	2	右键菜单	ContextMenu	context-menu	/widgets/context-menu		ri:menu-2-line	0	0				0	0	0			0	0	38	1	组件-右键	0	0	1768549363	1768549363
29	20	2	二维码	Qrcode	qrcode	/widgets/qrcode		ri:qr-code-line	0	0				0	0	0			0	0	39	1	组件-二维码	0	0	1768549363	1768549363
30	20	2	拖拽	Drag	drag	/widgets/drag		ri:drag-move-fill	0	0				0	0	0			0	0	40	1	组件-拖拽	0	0	1768549363	1768549363
31	20	2	文字滚动	TextScroll	text-scroll	/widgets/text-scroll		ri:input-method-line	0	0				0	0	0			0	0	41	1	组件-文字滚动	0	0	1768549363	1768549363
32	20	2	烟花	Fireworks	fireworks	/widgets/fireworks		ri:magic-line	0	0				0	0	0			0	0	42	1	组件-烟花	0	0	1768549363	1768549363
33	20	2	外链-ElementUI	ElementUI	elementui			ri:apps-2-line	0	0		https://element-plus.org/zh-CN/component/overview.html		1	0	0			0	0	43	1	组件-外链	0	0	1768549363	1768549363
40	0	1	功能示例	Examples	/examples	/index/index		ri:sparkling-line	0	0				0	0	0			0	0	50	1	示例根	0	0	1768549363	1768549363
41	40	1	权限示例	Permission	permission			ri:fingerprint-line	0	0				0	0	0			0	0	51	1	示例-权限	0	0	1768549363	1768549363
42	41	2	切换角色	PermissionSwitchRole	switch-role	/examples/permission/switch-role		ri:contacts-line	0	0				0	0	0			0	0	52	1	权限-切换角色	0	0	1768549363	1768549363
43	41	2	按钮权限	PermissionButtonAuth	button-auth	/examples/permission/button-auth		ri:mouse-line	0	0				0	0	0			0	0	53	1	权限-按钮	0	0	1768549363	1768549363
44	41	2	页面可见性	PermissionPageVisibility	page-visibility	/examples/permission/page-visibility		ri:user-3-line	0	0				0	0	0			0	0	54	1	权限-可见性	0	0	1768549363	1768549363
45	40	2	多标签页	Tabs	tabs	/examples/tabs		ri:price-tag-line	0	0				0	0	0			0	0	55	1	示例-标签	0	0	1768549363	1768549363
46	40	2	表格基础	TablesBasic	tables-basic	/examples/tables/basic		ri:layout-grid-line	0	0				0	0	0			0	0	56	1	示例-表格基础	0	0	1768549363	1768549363
47	40	2	表格综合	Tables	tables	/examples/tables		ri:table-3	0	0				0	0	0			0	0	57	1	示例-表格综合	0	0	1768549363	1768549363
48	40	2	表单综合	Forms	forms	/examples/forms		ri:table-view	0	0				0	0	0			0	0	58	1	示例-表单	0	0	1768549363	1768549363
49	40	2	搜索栏	SearchBar	search-bar	/examples/forms/search-bar		ri:table-line	0	0				0	0	0			0	0	59	1	示例-搜索栏	0	0	1768549363	1768549363
50	40	2	树表格	TablesTree	tables-tree	/examples/tables/tree		ri:layout-2-line	0	0				0	0	0			0	0	60	1	示例-树表	0	0	1768549363	1768549363
51	40	2	Socket 聊天	SocketChat	socket-chat	/examples/socket-chat		ri:shake-hands-line	0	0				0	0	0			0	0	61	1	示例-聊天	0	0	1768549363	1768549363
60	0	1	系统管理	System	/system	/index/index		ri:settings-3-line	0	0				0	0	0			0	0	70	1	系统设置和配置	0	0	1768549363	1768549363
61	140	2	后台用户	User	user	/system/user	admin_user	ri:user-line	0	0				0	0	0			0	0	3	1	后台用户管理	0	0	1768549363	1768549363
62	140	2	角色管理	Role	role	/system/role	admin_role	ri:user-settings-line	0	0				0	0	0			0	0	4	1	角色权限管理	0	0	1768549363	1768549363
63	60	2	用户中心	UserCenter	user-center	/system/user-center		ri:user-line	0	0				0	0	0			0	0	1	1	系统-用户中心	0	0	1768549363	1768549363
64	140	2	菜单管理	Menus	menu	/system/menu	admin_menu	ri:menu-line	0	0				0	0	0			0	0	5	1	菜单权限管理	0	0	1768549363	1768549363
65	60	2	系统设置	SystemConfig	config	/system/config	sys_config	ri:settings-3-line	0	0				0	0	0			0	0	2	1		0	0	1768549363	1768549363
66	60	1	多级菜单	Nested	nested			ri:menu-unfold-3-line	0	0				0	0	0			0	0	10	1	系统-嵌套	0	0	1768549363	1768549363
67	66	2	菜单1	NestedMenu1	menu1	/system/nested/menu1		ri:align-justify	0	0				0	0	0			0	0	77	1	嵌套-1	0	0	1768549363	1768549363
68	66	1	菜单2	NestedMenu2	menu2			ri:align-justify	0	0				0	0	0			0	0	78	1	嵌套-2	0	0	1768549363	1768549363
69	68	2	菜单2-1	NestedMenu2-1	menu2-1	/system/nested/menu2		ri:align-justify	0	0				0	0	0			0	0	79	1	嵌套-2-1	0	0	1768549363	1768549363
70	66	1	菜单3	NestedMenu3	menu3			ri:align-justify	0	0				0	0	0			0	0	80	1	嵌套-3	0	0	1768549363	1768549363
71	70	2	菜单3-1	NestedMenu3-1	menu3-1	/system/nested/menu3			0	0				0	0	0			0	0	81	1	嵌套-3-1	0	0	1768549363	1768549363
72	70	1	菜单3-2	NestedMenu3-2	menu3-2				0	0				0	0	0			0	0	82	1	嵌套-3-2	0	0	1768549363	1768549363
73	72	2	菜单3-2-1	NestedMenu3-2-1	menu3-2-1	/system/nested/menu3/menu3-2			0	0				0	0	0			0	0	83	1	嵌套-3-2-1	0	0	1768549363	1768549363
90	0	1	结果页	Result	/result	/index/index		ri:checkbox-circle-line	0	0				0	0	0			0	0	100	1	结果根	0	0	1768549363	1768549363
91	90	2	成功页	ResultSuccess	success	/result/success		ri:checkbox-circle-line	0	0				0	0	0			0	0	101	1	结果-成功	0	0	1768549363	1768549363
92	90	2	失败页	ResultFail	fail	/result/fail		ri:close-circle-line	0	0				0	0	0			0	0	102	1	结果-失败	0	0	1768549363	1768549363
100	0	1	异常页	Exception	/exception	/index/index		ri:error-warning-line	0	0				0	0	0			0	0	110	1	异常根	0	0	1768549363	1768549363
101	100	2	403	Exception403	403	/exception/403			0	0				0	0	0			0	0	111	1	异常-403	0	0	1768549363	1768549363
102	100	2	404	Exception404	404	/exception/404			0	0				0	0	0			0	0	112	1	异常-404	0	0	1768549363	1768549363
103	100	2	500	Exception500	500	/exception/500			0	0				0	0	0			0	0	113	1	异常-500	0	0	1768549363	1768549363
110	0	1	运维管理	Safeguard	/safeguard	/index/index		ri:shield-check-line	0	0				0	0	0			0	0	120	1	运维根	0	0	1768549363	1768549363
111	110	2	服务器监控	SafeguardServer	server	/safeguard/server		ri:hard-drive-3-line	0	1			["GET /admin/monitor/server"]	0	0	0			0	0	121	1	运维-服务器	0	0	1768549363	1770644180
121	0	2	更新日志	ChangeLog	/change/log	/change/log		ri:gamepad-line	0	0				0	0	1	v3.0.1	1	0	0	999	1		0	0	1768549363	1768549363
122	60	2	附件管理	system/attachment	system/attachment	/system/attachment/index	sys_attachment	ep:folder-opened	0	1			\N	0	0	0			0	0	3	1	附件中心与文件管理	0	0	1768549363	1768549363
123	122	3	查看	system/attachment/index					0	0			system:attachment:list	0	0	0			0	0	1	1		0	0	1768549363	1768549363
124	122	3	编辑	system/attachment/edit					0	0			system:attachment:edit	0	0	0			0	0	2	1		0	0	1768549363	1768549363
125	122	3	删除	system/attachment/del					0	0			system:attachment:del	0	0	0			0	0	3	1		0	0	1768549363	1768549363
126	20	2	图标选择器	IconSelector	icon-selector	/widgets/icon-selector		ri:palette-line	0	1				0	0	0			0	0	33	1	图标选择器组件	0	0	1768549363	1768549363
127	20	2	颜色选择器	ColorPicker	color-picker	/widgets/color-picker		ri:palette-fill	0	1				0	0	0			0	0	34	1	颜色选择器组件	0	0	1768549363	1768549363
128	20	2	图片上传	ImageUpload	image-upload	/widgets/image-upload		ri:image-2-line	0	1				0	0	0			0	0	35	1	图片上传组件	0	0	1768549363	1768549363
129	20	2	文件上传	FileUpload	file-upload	/widgets/file-upload		ri:file-upload-line	0	1				0	0	0			0	0	36	1	文件上传组件	0	0	1768549363	1768549363
130	20	2	数组编辑器	ArrayEditor	array-editor	/widgets/array-editor		ri:list-settings-line	0	1				0	0	0			0	0	37	1	多维数组编辑器组件	0	0	1768549363	1768549363
140	0	1	权限管理	Auth	/auth	/index/index		ri:admin-line	0	0				0	0	0			0	0	65	1	权限管理模块	0	0	1768549363	1768549363
141	140	2	部门管理	Dept	dept	/system/dept	admin_dept	ri:organization-chart	0	1				0	0	0			0	0	1	1	组织架构和部门管理	0	0	1768549363	1768549363
142	140	2	岗位管理	Post	post	/system/post	admin_post	ri:briefcase-line	0	1				0	0	0			0	0	2	1	岗位管理（职位字典）	0	0	1768549363	1768549363
143	0	1	会员管理	Member	/member			ri:user-star-line	0	0			\N	0	0	0			0	0	50	1		0	0	1768748969	1768748969
144	143	2	会员列表	MemberList	list	/member/list/index		ri:team-line	0	0			\N	0	0	0			0	0	10	1		0	0	1768748969	1768748969
145	143	3	添加会员	MemberAdd					0	0			\N	0	0	0			0	0	1	1		0	0	1768748969	1768748969
146	143	3	编辑会员	MemberEdit					0	0			\N	0	0	0			0	0	2	1		0	0	1768748969	1768748969
147	143	3	删除会员	MemberDelete					0	0			\N	0	0	0			0	0	3	1		0	0	1768748969	1768748969
148	143	3	重置密码	MemberResetPassword					0	0			\N	0	0	0			0	0	4	1		0	0	1768748969	1768748969
149	143	2	会员分组	MemberGroup	group	/member/group/index	member_group	ri:group-line	0	1			["POST /admin/member/group/list"]	0	0	0			0	0	20	1	会员分组管理	0	0	1768791091	1768791091
150	149	3	新增分组	MemberGroupAdd			member_group		0	0			["POST /admin/member/group/save"]	0	0	0			0	0	1	1	新增会员分组	0	0	1768791091	1768791091
151	149	3	编辑分组	MemberGroupEdit			member_group		0	0			["POST /admin/member/group/save"]	0	0	0			0	0	2	1	编辑会员分组	0	0	1768791091	1768791091
152	149	3	删除分组	MemberGroupDelete			member_group		0	0			["POST /admin/member/group/delete"]	0	0	0			0	0	3	1	删除会员分组	0	0	1768791091	1768791091
153	143	2	会员菜单	MemberMenu	menu	/member/menu/index	member_menu	ri:menu-line	0	1			["GET /admin/member/menu/tree"]	0	0	0			0	0	30	1	会员前台菜单管理	0	0	1768791091	1768791091
154	153	3	新增菜单	MemberMenuAdd			member_menu		0	0			["POST /admin/member/menu/save"]	0	0	0			0	0	1	1	新增会员菜单	0	0	1768791091	1768791091
155	153	3	编辑菜单	MemberMenuEdit			member_menu		0	0			["POST /admin/member/menu/save"]	0	0	0			0	0	2	1	编辑会员菜单	0	0	1768791091	1768791091
156	153	3	删除菜单	MemberMenuDelete			member_menu		0	0			["POST /admin/member/menu/delete"]	0	0	0			0	0	3	1	删除会员菜单	0	0	1768791091	1768791091
157	110	2	登录日志	LoginLog	login-log	/safeguard/login-log	admin_login_log	ri:login-box-line	0	1			["POST /admin/log/login/list"]	0	0	0			0	0	122	1	管理员登录日志	0	0	1770615724	1770615724
158	157	3	删除日志	LoginLogDelete			admin_login_log		0	0			["POST /admin/log/login/delete"]	0	0	0			0	0	1	1	删除登录日志	0	0	1770615724	1770615724
159	157	3	清空日志	LoginLogClear			admin_login_log		0	0			["POST /admin/log/login/clear"]	0	0	0			0	0	2	1	清空登录日志	0	0	1770615724	1770615724
160	110	2	操作日志	OperationLog	operation-log	/safeguard/operation-log	admin_operation_log	ri:file-text-line	0	1			["POST /admin/log/operation/list"]	0	0	0			0	0	123	1	管理员操作日志	0	0	1770615724	1770615724
161	160	3	查看详情	OperationLogDetail			admin_operation_log		0	0			["GET /admin/log/operation/detail"]	0	0	0			0	0	1	1	查看操作日志详情	0	0	1770615724	1770615724
162	160	3	删除日志	OperationLogDelete			admin_operation_log		0	0			["POST /admin/log/operation/delete"]	0	0	0			0	0	2	1	删除操作日志	0	0	1770615724	1770615724
163	160	3	清空日志	OperationLogClear			admin_operation_log		0	0			["POST /admin/log/operation/clear"]	0	0	0			0	0	3	1	清空操作日志	0	0	1770615724	1770615724
164	110	2	性能分析	SafeguardPerformance	performance	/safeguard/performance	admin_operation_log	ri:line-chart-line	0	0				0	0	0			0	0	124	1		0	0	1770644179	1770644179
165	0	1	开发工具	Develop	/develop	/index/index		ri:code-box-line	0	0				0	0	0			0	0	125	1	开发工具目录	0	0	1770648637	1770648637
166	165	2	代码生成器	GenCodes	gen-codes	/develop/gen-codes/index	sys_gen_codes	ri:magic-line	0	1			["GET /admin/genCodes/selects","GET /admin/genCodes/tableSelect","GET /admin/genCodes/columnList","GET /admin/genCodes/list","GET /admin/genCodes/view","POST /admin/genCodes/edit","POST /admin/genCodes/delete","POST /admin/genCodes/preview","POST /admin/genCodes/build","POST /admin/genCodes/createTable"]	0	0	0			0	0	1	1	代码生成器	0	0	1770648637	1770648637
202	110	2	函数分析	PprofAnalysis	pprof	/safeguard/pprof/index		ri:code-s-slash-line	0	1			["GET /admin/monitor/pprof-top"]	0	0	0			0	0	125	1	函数级CPU/内存热点分析(pprof)	0	0	1770702712	1770702712
220	60	2	通知管理	Notice	notice	/system/notice/index	admin_notice	ri:notification-3-line	0	1			["POST /admin/notice/list"]	0	0	0			0	0	4	1	通知消息管理	0	0	1770700000	1770700000
221	220	3	查看	NoticeView			admin_notice		0	0			["POST /admin/notice/list"]	0	0	0			0	0	1	1	查看通知列表	0	0	1770700000	1770700000
222	220	3	发布/编辑	NoticeEdit			admin_notice		0	0			["POST /admin/notice/edit"]	0	0	0			0	0	2	1	发布或编辑通知	0	0	1770700000	1770700000
223	220	3	删除	NoticeDelete			admin_notice		0	0			["POST /admin/notice/delete"]	0	0	0			0	0	3	1	删除通知	0	0	1770700000	1770700000
240	60	2	定时任务	CronManage	cron	/system/cron/index	sys_cron	ri:timer-line	0	1				0	0	0			0	0	80	1	定时任务管理	0	0	1770717535	1770717535
241	240	3	查看	CronView					0	0			GET /admin/cron/list	0	0	0			0	0	0	1		0	0	1770717535	1770717535
242	240	3	新增/编辑	CronEdit					0	0			POST /admin/cron/save	0	0	0			0	0	0	1		0	0	1770717535	1770717535
243	240	3	删除	CronDelete					0	0			POST /admin/cron/delete	0	0	0			0	0	0	1		0	0	1770717535	1770717535
244	240	3	在线执行	CronOnlineExec					0	0			POST /admin/cron/onlineExec	0	0	0			0	0	0	1		0	0	1770717535	1770717535
250	60	2	消息队列	QueueManage	queue	/system/queue/index		ri:stack-line	0	1				0	0	0			0	0	85	1	消息队列管理	0	0	1770719034	1770719034
418	143	2	登录日志	MemberLoginLog	member-login-log	/member/member-login-log/index		ri:file-list-line	0	1			["GET /admin/member-login-log/list"]	0	0	0			0	0	100	1		0	0	1770873777	1770873777
419	418	3	查看登录日志	MemberLoginLogView					0	0			["GET /admin/member-login-log/view"]	0	0	0			0	0	1	1		0	0	1770873777	1770873777
420	143	2	登录日志详情	MemberLoginLogDetail	member-login-log/detail	/member/member-login-log/detail/index			1	0			["GET /admin/member-login-log/view"]	0	0	0		/member-login-log	0	0	0	1		0	0	1770873777	1770873777
421	418	3	删除登录日志	MemberLoginLogDelete					0	0			["POST /admin/member-login-log/delete"]	0	0	0			0	0	4	1		0	0	1770873777	1770873777
422	418	3	导出登录日志	MemberLoginLogExport					0	0			["GET /admin/member-login-log/export"]	0	0	0			0	0	5	1		0	0	1770873777	1770873777
511	143	2	余额变动日志	MemberMoneyLog	member-money-log	/member/member-money-log/index		ri:file-list-line	0	1			["GET /admin/member-money-log/list"]	0	0	0			0	0	100	1		0	0	1770881561	1770881561
512	511	3	查看余额变动日志	MemberMoneyLogView					0	0			["GET /admin/member-money-log/view"]	0	0	0			0	0	1	1		0	0	1770881561	1770881561
513	511	3	新增余额变动日志	MemberMoneyLogAdd					0	0			["POST /admin/member-money-log/edit"]	0	0	0			0	0	2	1		0	0	1770881561	1770881561
514	511	3	编辑余额变动日志	MemberMoneyLogEdit					0	0			["POST /admin/member-money-log/edit","GET /admin/member-money-log/view"]	0	0	0			0	0	3	1		0	0	1770881561	1770881561
515	511	3	删除余额变动日志	MemberMoneyLogDelete					0	0			["POST /admin/member-money-log/delete"]	0	0	0			0	0	4	1		0	0	1770881561	1770881561
516	511	3	导出余额变动日志	MemberMoneyLogExport					0	0			["GET /admin/member-money-log/export"]	0	0	0			0	0	5	1		0	0	1770881561	1770881561
517	143	2	积分变动日志	MemberScoreLog	member-score-log	/member/member-score-log/index		ri:file-list-line	0	1			["GET /admin/member-score-log/list"]	0	0	0			0	0	100	1		0	0	1770881700	1770881700
617	143	2	会员通知	MemberNotice	member-notice	/member/member-notice/index		ri:notification-line	0	1			["GET /admin/member-notice/list"]	0	0	0			0	0	100	1		0	0	1770904531	1770904531
618	617	3	查看会员通知	MemberNoticeView					0	0			["GET /admin/member-notice/view"]	0	0	0			0	0	1	1		0	0	1770904531	1770904531
619	617	3	新增会员通知	MemberNoticeAdd					0	0			["POST /admin/member-notice/edit"]	0	0	0			0	0	2	1		0	0	1770904531	1770904531
620	617	3	编辑会员通知	MemberNoticeEdit					0	0			["POST /admin/member-notice/edit","GET /admin/member-notice/view"]	0	0	0			0	0	3	1		0	0	1770904531	1770904531
621	617	3	删除会员通知	MemberNoticeDelete					0	0			["POST /admin/member-notice/delete"]	0	0	0			0	0	4	1		0	0	1770904531	1770904531
622	617	3	导出会员通知	MemberNoticeExport					0	0			["GET /admin/member-notice/export"]	0	0	0			0	0	5	1		0	0	1770904531	1770904531
80	0	1	内容管理	Cms	/cms	/index/index		ri:article-line	0	0				0	0	0			0	0	85	1	文档根	0	0	1768549363	1768549363
630	80	2	文档分类	CmsDocCategory	doc-category	/cms/doc-category		ri:folder-line	0	1				0	0	0			0	0	1	1	文档分类管理	0	0	1771490819	1771490819
631	80	2	文档管理	CmsDoc	doc	/cms/doc		ri:file-text-line	0	1				0	0	0			0	0	2	1	文档内容管理	0	0	1771490819	1771490819
632	631	3	新增/编辑	CmsDocSave					0	0			/admin/cms/doc/save	0	0	0			0	0	1	1	新增或编辑文档	0	0	1771490819	1771490819
633	631	3	删除	CmsDocDelete					0	0			/admin/cms/doc/delete	0	0	0			0	0	2	1	删除文档	0	0	1771490819	1771490819
634	630	3	新增/编辑	CmsDocCategorySave					0	0			/admin/cms/docCategory/save	0	0	0			0	0	1	1	新增或编辑分类	0	0	1771490819	1771490819
635	630	3	删除	CmsDocCategoryDelete					0	0			/admin/cms/docCategory/delete	0	0	0			0	0	2	1	删除分类	0	0	1771490819	1771490819
641	80	2	案例管理	CmsCase	case	/cms/case		ri:gallery-line	0	1				0	0	0			0	0	4	1	案例内容管理	0	0	1771506794	1771506794
642	641	3	新增/编辑	CmsCaseSave					0	0			/admin/cms/case/save	0	0	0			0	0	1	1	新增或编辑案例	0	0	1771506794	1771506794
643	641	3	删除	CmsCaseDelete					0	0			/admin/cms/case/delete	0	0	0			0	0	2	1	删除案例	0	0	1771506794	1771506794
644	641	3	管理分类	CmsCaseCategorySave					0	0			/admin/cms/caseCategory/save	0	0	0			0	0	3	1	新增或编辑案例分类	0	0	1771507956	1771507956
645	641	3	删除分类	CmsCaseCategoryDelete					0	0			/admin/cms/caseCategory/delete	0	0	0			0	0	4	1	删除案例分类	0	0	1771507956	1771507956
650	80	2	社区管理	CmsCommunity	community	/cms/community		ri:discuss-line	0	1				0	0	0			0	0	5	1	社区帖子管理	0	0	1771592405	1771592405
651	650	3	编辑帖子	CmsCommunityPostUpdate					0	0			/admin/cms/community/postUpdate	0	0	0			0	0	1	1	编辑帖子(置顶/精华/状态)	0	0	1771592405	1771592405
652	650	3	删除帖子	CmsCommunityPostDelete					0	0			/admin/cms/community/postDelete	0	0	0			0	0	2	1	删除帖子	0	0	1771592405	1771592405
653	650	3	管理分类	CmsCommunityCategory					0	0			/admin/cms/community/categorySave	0	0	0			0	0	3	1	管理社区分类	0	0	1771592405	1771592405
654	650	3	删除回复	CmsCommunityReplyDelete					0	0			/admin/cms/community/replyDelete	0	0	0			0	0	4	1	删除回复	0	0	1771592405	1771592405
\.


--
-- Data for Name: xy_admin_notice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_notice (id, title, type, content, tag, sender_id, receiver_id, status, sort, remark, read_count, created_at, updated_at) FROM stdin;
1	test a notify	1	我来了	info	1	0	1	0		2	1770706024	1770708972
\.


--
-- Data for Name: xy_admin_notice_read; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_notice_read (id, notice_id, user_id, read_at) FROM stdin;
1	1	1	1770706027
2	1	2	1770708972
\.


--
-- Data for Name: xy_admin_operation_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_operation_log (id, user_id, username, module, title, method, url, ip, location, user_agent, request_body, response_body, error_message, status, elapsed, created_at) FROM stdin;
831	1	admin	操作日志	清空日志	POST	/admin/log/operation/clear	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	111	1770909791
832	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	30	1770909794
833	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	176	1770909794
834	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770909800
835	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	4	1770909800
836	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770909808
837	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	1	1770909808
838	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	2	1770909880
839	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	4	1770909880
840	1	admin	登录日志	清空日志	POST	/admin/log/login/clear	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	109	1770909944
841	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	11	1770909994
842	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	17	1770909994
843	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	8	1770910322
844	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	6	1770910322
845	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	11	1770910322
846	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	7	1770910322
847	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	2	1770910353
848	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	5	1770910353
849	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770910356
850	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	7	1770910356
851	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	0	1770910357
852	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	2	1770910357
853	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	4	1770910370
854	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	5	1770910370
855	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	13	1770910370
856	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	12	1770910370
857	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	0	1770910387
858	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	2	1770910387
859	1	admin	menu	POST /admin/menu/save	POST	/admin/menu/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":164,"parentId":110,"type":2,"title":"性能分析","name":"SafeguardPerformance","path":"performance","component":"/safeguard/performance","icon":"ri:line-chart-line","resource":"admin_operation_log","hidden":0,"hideTab":0,"keepAlive":0,"redirect":"","frameSrc":"","perms":"","isFrame":0,"affix":0,"showBadge":0,"badgeText":"","activePath":"","isFullPage":0,"sort":124,"status":1,"remark":""}			1	94	1770910442
860	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770910448
861	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	5	1770910448
862	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770910471
863	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	2	1770910472
864	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770910477
865	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	17	1770910477
866	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770910481
867	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770910481
868	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	0	1770910485
869	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770910485
870	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770910509
871	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	2	1770910509
872	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770910511
873	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	1	1770910511
874	1	admin	会员通知	编辑会员通知	POST	/admin/member-notice/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"title":"test a notify","content":"<p>这是一个测试通知</p>","type":"system","target":"all","targetId":0,"sender":"Xygo","status":1}			1	59	1770910671
875	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":39,"deleteFiles":true,"deleteMenus":true}			1	139	1770911898
876	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":38,"deleteFiles":true,"deleteMenus":true}			1	75	1770911907
899	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912670
900	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770912670
877	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			1	12	1770911986
878	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			1	59	1770911988
879	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			1	636	1770911989
880	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	15	1770911998
881	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":68,"deleteFiles":true,"deleteMenus":true}		DELETE FROM `xy_sys_gen_codes` WHERE `id`=68: context canceled	0	132	1770912378
882	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			1	16	1770912448
901	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	3	1770912755
902	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	5	1770912755
903	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912760
904	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770912760
883	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			1	76	1770912450
884	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			1	564	1770912451
885	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	15	1770912461
886	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	3	1770912511
887	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	4	1770912511
888	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912525
889	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770912525
890	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	0	1770912528
891	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	2	1770912528
892	1	admin	menu	POST /admin/menu/save	POST	/admin/menu/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":164,"parentId":110,"type":2,"title":"性能分析","name":"SafeguardPerformance","path":"performance","component":"/safeguard/performance","icon":"ri:line-chart-line","resource":"admin_operation_log","hidden":0,"hideTab":0,"keepAlive":0,"redirect":"","frameSrc":"","perms":"","isFrame":0,"affix":0,"showBadge":0,"badgeText":"","activePath":"","isFullPage":0,"sort":124,"status":1,"remark":""}			1	3	1770912625
893	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	2	1770912649
894	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	2	1770912649
895	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912654
896	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	2	1770912654
897	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	2	1770912659
898	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770912659
905	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912765
906	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770912765
907	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912768
908	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	4	1770912768
909	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	2	1770912807
910	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	5	1770912807
911	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912811
912	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770912811
913	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912816
914	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	5	1770912816
915	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770912830
916	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	5	1770912830
917	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	2	1770913038
918	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	4	1770913038
919	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			1	1	1770913041
920	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			1	3	1770913041
921	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":68,"deleteFiles":true,"deleteMenus":true}			1	163	1770913411
922	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"last login time\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"login_c...(truncated)			1	98	1770959285
930	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	55	1770959864
946	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13"}		SELECT module, COUNT(*) as "errorCount"\n\t\t FROM xy_admin_operation_log WHERE status = false  AND "created_at" >= 1770912000 AND "created_at" <= 1770998399 AND module != ''\n\t\t GROUP BY module\n\t\t ORDER BY "errorCount" DESC\n\t\t LIMIT 10: pq: 操作符不存在: smallint = boolean	0	109	1770960337
923	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"last login time\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"login_c...(truncated)			1	94	1770959294
924	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"last login time\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"login_c...(truncated)			1	836	1770959295
925	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	42	1770959310
926	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":68,"deleteFiles":true,"deleteMenus":true}			1	74	1770959807
927	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[]\\",\\"relation-fields\\":\\"\\",\\"relation-search-fields\\":\\"\\",\\"relation-export-fields\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":2},{"id":0,"genId":0,"name":"apply_id","goName":"ApplyId","tsName":"applyId","dbType":"int8","goType":"int64","tsType":"number","comment":"买家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[]\\",\\"relation-fields\\":\\"\\",\\"relation-search-fields\\":\\"\\",\\"relation-export-fields\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3},{"id":0,"genId":0,"name":"amount","goName":"Amount","tsName":"amount","dbType":"numeric(10,2)","goType":"float64","tsType":"number","comment":"订单金额","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"","dictType":"","sort":4},{"id":0,"genId":0,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:0=待处理,1=已完成,2=已取消","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"0=待处理,1=已完成,2=已取消\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":5},{"id":0,"genId":0,"name":"memo","goName":"Memo","tsName":"memo","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"input","designType":"string","extra":"","dictType":"","sort":6},{"id":0,"genId":0,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":7},{"id":0,"genId":0,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":8}]}			1	55	1770959843
928	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[]\\",\\"relation-fields\\":\\"\\",\\"relation-search-fields\\":\\"\\",\\"relation-export-fields\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":2},{"id":0,"genId":0,"name":"apply_id","goName":"ApplyId","tsName":"applyId","dbType":"int8","goType":"int64","tsType":"number","comment":"买家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[]\\",\\"relation-fields\\":\\"\\",\\"relation-search-fields\\":\\"\\",\\"relation-export-fields\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3},{"id":0,"genId":0,"name":"amount","goName":"Amount","tsName":"amount","dbType":"numeric(10,2)","goType":"float64","tsType":"number","comment":"订单金额","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"","dictType":"","sort":4},{"id":0,"genId":0,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:0=待处理,1=已完成,2=已取消","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"0=待处理,1=已完成,2=已取消\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":5},{"id":0,"genId":0,"name":"memo","goName":"Memo","tsName":"memo","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"input","designType":"string","extra":"","dictType":"","sort":6},{"id":0,"genId":0,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":7},{"id":0,"genId":0,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":8}]}			1	37	1770959852
929	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[]\\",\\"relation-fields\\":\\"\\",\\"relation-search-fields\\":\\"\\",\\"relation-export-fields\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":2},{"id":0,"genId":0,"name":"apply_id","goName":"ApplyId","tsName":"applyId","dbType":"int8","goType":"int64","tsType":"number","comment":"买家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[]\\",\\"relation-fields\\":\\"\\",\\"relation-search-fields\\":\\"\\",\\"relation-export-fields\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3},{"id":0,"genId":0,"name":"amount","goName":"Amount","tsName":"amount","dbType":"numeric(10,2)","goType":"float64","tsType":"number","comment":"订单金额","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"","dictType":"","sort":4},{"id":0,"genId":0,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:0=待处理,1=已完成,2=已取消","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"0=待处理,1=已完成,2=已取消\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":5},{"id":0,"genId":0,"name":"memo","goName":"Memo","tsName":"memo","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"input","designType":"string","extra":"","dictType":"","sort":6},{"id":0,"genId":0,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":7},{"id":0,"genId":0,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":8}]}			1	896	1770959853
931	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":69,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\",\\"forcedCover\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"pidColumn\\":\\"parent_id\\",\\"titleColumn\\":\\"name\\"}}","columns":[{"id":819,"genId":69,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":1},{"id":820,"genId":69,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"last login time\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\...(truncated)			1	59	1770960002
932	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":69,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\",\\"forcedCover\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"pidColumn\\":\\"parent_id\\",\\"titleColumn\\":\\"name\\"}}","columns":[{"id":819,"genId":69,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":1},{"id":820,"genId":69,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"last login time\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\...(truncated)			1	14	1770960004
933	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":69,"genType":10,"dbName":"","tableName":"xy_test_order","tableComment":"测试订单表","varName":"TestOrder","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\",\\"forcedCover\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"pidColumn\\":\\"parent_id\\",\\"titleColumn\\":\\"name\\"}}","columns":[{"id":819,"genId":69,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":1},{"id":820,"genId":69,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int8","goType":"int64","tsType":"number","comment":"卖家ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"last login time\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\...(truncated)			1	878	1770960005
934	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	59	1770960021
935	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_demo_category","tableComment":"示例分类","varName":"DemoCategory","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":80,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"parent_id","goName":"ParentId","tsName":"parentId","dbType":"int8","goType":"int64","tsType":"number","comment":"父级ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"step\\":1},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"custom\\"}}","dictType":"","sort":2},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"分类名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":3},{"id":0,"genId":0,"name":"icon","goName":"Icon","tsName":"icon","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"图标","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"iconSelector","designType":"icon","extra":"","dictType":"","sort":4},{"id":0,"genId":0,"name":"sort","goName":"Sort","tsName":"sort","dbType":"int4","goType":"int","tsType":"number","comment":"排序","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"weigh","extra":"","dictType":"","sort":5},{"id":0,"genId":0,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:1=启用,0=禁用","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"1=启用,0=禁用\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":6},{"id":0,"genId":0,"name":"remark","goName":"Remark","tsName":"remark","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":7},{"id":0,"genId":0,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":8},{"id":0,"genId":0,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":9}]}			1	5	1770960125
936	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_demo_category","tableComment":"示例分类","varName":"DemoCategory","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":80,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"parent_id","goName":"ParentId","tsName":"parentId","dbType":"int8","goType":"int64","tsType":"number","comment":"父级ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"step\\":1},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"custom\\"}}","dictType":"","sort":2},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"分类名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":3},{"id":0,"genId":0,"name":"icon","goName":"Icon","tsName":"icon","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"图标","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"iconSelector","designType":"icon","extra":"","dictType":"","sort":4},{"id":0,"genId":0,"name":"sort","goName":"Sort","tsName":"sort","dbType":"int4","goType":"int","tsType":"number","comment":"排序","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"weigh","extra":"","dictType":"","sort":5},{"id":0,"genId":0,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:1=启用,0=禁用","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"1=启用,0=禁用\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":6},{"id":0,"genId":0,"name":"remark","goName":"Remark","tsName":"remark","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":7},{"id":0,"genId":0,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":8},{"id":0,"genId":0,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":9}]}			1	112	1770960144
972	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40}			1	66	1771598019
937	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_demo_category","tableComment":"示例分类","varName":"DemoCategory","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":80,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"parent_id","goName":"ParentId","tsName":"parentId","dbType":"int8","goType":"int64","tsType":"number","comment":"父级ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"step\\":1},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"custom\\"}}","dictType":"","sort":2},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"分类名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":3},{"id":0,"genId":0,"name":"icon","goName":"Icon","tsName":"icon","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"图标","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"iconSelector","designType":"icon","extra":"","dictType":"","sort":4},{"id":0,"genId":0,"name":"sort","goName":"Sort","tsName":"sort","dbType":"int4","goType":"int","tsType":"number","comment":"排序","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"weigh","extra":"","dictType":"","sort":5},{"id":0,"genId":0,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:1=启用,0=禁用","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"1=启用,0=禁用\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":6},{"id":0,"genId":0,"name":"remark","goName":"Remark","tsName":"remark","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":7},{"id":0,"genId":0,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":8},{"id":0,"genId":0,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"","dictType":"","sort":9}]}			1	875	1770960145
938	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	47	1770960155
939	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":70,"genType":11,"dbName":"","tableName":"xy_demo_category","tableComment":"示例分类","varName":"DemoCategory","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\",\\"forcedCover\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":80,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"pidColumn\\":\\"parent_id\\",\\"titleColumn\\":\\"name\\"}}","columns":[{"id":835,"genId":70,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":1},{"id":836,"genId":70,"name":"parent_id","goName":"ParentId","tsName":"parentId","dbType":"int8","goType":"int64","tsType":"number","comment":"父级ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"step\\":1},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"custom\\"}}","dictType":"","sort":2},{"id":837,"genId":70,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"分类名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":3},{"id":838,"genId":70,"name":"icon","goName":"Icon","tsName":"icon","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"图标","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"iconSelector","designType":"icon","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":4},{"id":839,"genId":70,"name":"sort","goName":"Sort","tsName":"sort","dbType":"int4","goType":"int","tsType":"number","comment":"排序","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"weigh","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":5},{"id":840,"genId":70,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:1=启用,0=禁用","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"1=启用,0=禁用\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":6},{"id":841,"genId":70,"name":"remark","goName":"Remark","tsName":"remark","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"like","formType":"input","designType":"string","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":7},{"id":842,"genId":70,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":8},{"id":843,"genId":70,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":9}]}			1	5	1770960186
940	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":70,"genType":11,"dbName":"","tableName":"xy_demo_category","tableComment":"示例分类","varName":"DemoCategory","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\",\\"forcedCover\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":80,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"pidColumn\\":\\"parent_id\\",\\"titleColumn\\":\\"name\\"}}","columns":[{"id":835,"genId":70,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":1},{"id":836,"genId":70,"name":"parent_id","goName":"ParentId","tsName":"parentId","dbType":"int8","goType":"int64","tsType":"number","comment":"父级ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"step\\":1},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"custom\\"}}","dictType":"","sort":2},{"id":837,"genId":70,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"分类名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":3},{"id":838,"genId":70,"name":"icon","goName":"Icon","tsName":"icon","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"图标","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"iconSelector","designType":"icon","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":4},{"id":839,"genId":70,"name":"sort","goName":"Sort","tsName":"sort","dbType":"int4","goType":"int","tsType":"number","comment":"排序","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"weigh","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":5},{"id":840,"genId":70,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:1=启用,0=禁用","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"1=启用,0=禁用\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":6},{"id":841,"genId":70,"name":"remark","goName":"Remark","tsName":"remark","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"like","formType":"input","designType":"string","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":7},{"id":842,"genId":70,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":8},{"id":843,"genId":70,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":9}]}			1	96	1770960234
941	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":70,"genType":11,"dbName":"","tableName":"xy_demo_category","tableComment":"示例分类","varName":"DemoCategory","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\",\\"forcedCover\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":80,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"pidColumn\\":\\"parent_id\\",\\"titleColumn\\":\\"name\\"}}","columns":[{"id":835,"genId":70,"name":"id","goName":"Id","tsName":"id","dbType":"int8","goType":"int64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":1},{"id":836,"genId":70,"name":"parent_id","goName":"ParentId","tsName":"parentId","dbType":"int8","goType":"int64","tsType":"number","comment":"父级ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"number","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"step\\":1},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"custom\\"}}","dictType":"","sort":2},{"id":837,"genId":70,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"分类名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":3},{"id":838,"genId":70,"name":"icon","goName":"Icon","tsName":"icon","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"图标","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"iconSelector","designType":"icon","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":4},{"id":839,"genId":70,"name":"sort","goName":"Sort","tsName":"sort","dbType":"int4","goType":"int","tsType":"number","comment":"排序","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"inputNumber","designType":"weigh","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":5},{"id":840,"genId":70,"name":"status","goName":"Status","tsName":"status","dbType":"int2","goType":"int","tsType":"number","comment":"状态:1=启用,0=禁用","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"eq","formType":"radio","designType":"radio","extra":"{\\"_formProps\\":{\\"dict-options\\":\\"1=启用,0=禁用\\",\\"validator\\":[],\\"validatorMsg\\":\\"\\"},\\"_tableProps\\":{\\"render\\":\\"tag\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":6},{"id":841,"genId":70,"name":"remark","goName":"Remark","tsName":"remark","dbType":"varchar(255)","goType":"string","tsType":"string","comment":"备注","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"like","formType":"input","designType":"string","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":7},{"id":842,"genId":70,"name":"created_at","goName":"CreatedAt","tsName":"createdAt","dbType":"int8","goType":"int64","tsType":"number","comment":"创建时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":8},{"id":843,"genId":70,"name":"updated_at","goName":"UpdatedAt","tsName":"updatedAt","dbType":"int8","goType":"int64","tsType":"number","comment":"更新时间","isPk":0,"isRequired":1,"isList":1,"isEdit":0,"isQuery":0,"queryType":"between","formType":"datetime","designType":"timestamp","extra":"{\\"_formProps\\":{},\\"_tableProps\\":{}}","dictType":"","sort":9}]}			1	915	1770960235
942	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				1	53	1770960245
943	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13","limit":20}			1	2	1770960275
944	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13"}		SELECT \n\t\t COUNT(*) as "totalRequests",\n\t\t ROUND((AVG(elapsed))::numeric, 1) as "avgElapsed",\n\t\t SUM(CASE WHEN status = false THEN 1 ELSE 0 END) as "errorCount",\n\t\t SUM(CASE WHEN elapsed > 200 THEN 1 ELSE 0 END) as "slowCount"\n\t\t FROM xy_admin_operation_log WHERE 1=1  AND "created_at" >= 1770912000 AND "created_at" <= 1770998399 LIMIT 1: pq: 操作符不存在: smallint = boolean	0	3	1770960275
945	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13","limit":20}			1	22	1770960337
947	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13","limit":20}			1	162	1770960388
948	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13"}			1	234	1770960388
949	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13","limit":20}			1	0	1770960392
950	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13"}			1	2	1770960392
951	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13"}			1	5	1770960717
952	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13","limit":20}			1	81	1770960717
953	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13","limit":20}			1	9	1770961530
954	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-13","endDate":"2026-02-13"}			1	28	1770961530
955	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"id":70,"deleteFiles":true,"deleteMenus":true}			1	52	1771485090
956	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"id":69,"deleteFiles":true,"deleteMenus":true}			1	109	1771485100
957	1	admin	cms/doc	POST /admin/cms/doc/save	POST	/admin/cms/doc/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"id":1,"categoryId":101,"title":"项目介绍","slug":"introduce","cover":"","summary":"全面了解 XYGo Admin 的技术栈、核心特色与设计理念","content":"# 关于 XYGo Admin\\n\\nXYGo Admin 是一款基于 **GoFrame + Vue3 + Element Plus + Tailwind CSS** 的企业级中后台管理系统。项目采用前后端分离架构，融合现代化设计理念与工程化实践，致力于为开发者提供高效、优雅的开发基础。\\n\\n## 核心特色\\n\\n### 🎨 Clay 拟态设计\\n\\n项目独创的 Clay（黏土拟态）设计体系，通过科学的阴影层次和柔和的光影效果，打造出极具质感的 UI 界面。告别传统管理系统的视觉疲劳，让每一次操作都赏心悦目。\\n\\n### ⚡ 全栈代码生成\\n\\n内置强大的 CRUD 代码生成器，支持：\\n- 可视化建表设计器\\n- 字段配置与类型推断\\n- 一键生成 Go 后端（API + Controller + Logic）+ Vue 前端（列表页 + 弹窗 + 搜索栏）\\n- 自动注册路由、菜单与权限\\n\\n### 🔐 三级权限体系\\n\\n- **角色权限（RBAC）**：基于角色的菜单与接口访问控制\\n- **按钮级权限**：精确到每个操作按钮的显隐控制\\n- **字段级权限**：控制数据字段的可见性与可编辑性\\n\\n### 💬 即时通讯\\n\\n基于 WebSocket 的实时聊天系统，支持单聊、群聊、在线状态检测、消息已读回执。\\n\\n### 📊 系统监控\\n\\n内置服务器监控、性能分析（pprof）、慢接口检测、操作日志审计等运维工具。\\n\\n## 技术栈\\n\\n### 后端\\n\\n| 技术 | 说明 |\\n|------|------|\\n| Go 1.24 | 编程语言 |\\n| GoFrame v2 | Web 框架 |\\n| MySQL / PostgreSQL | 数据库（双驱动支持） |\\n| Redis | 缓存 |\\n| JWT | 身份认证 |\\n| WebSocket | 即时通讯 |\\n| 阿里云 OSS / 七牛 / 腾讯 COS | 对象存储 |\\n\\n### 前端\\n\\n| 技术 | 说明 |\\n|------|------|\\n| Vue 3.5 | 渐进式框架 |\\n| TypeScript 5.6 | 类型安全 |\\n| Vite 7 | 构建工具 |\\n| Element Plus | UI 组件库 |\\n| Tailwind CSS 4 | 原子化 CSS |\\n| Pinia 3 | 状态管理 |\\n| ECharts 6 | 数据可视化 |\\n| vue-i18n | 国际化 |\\n\\n## 浏览器兼容性\\n\\n支持 Chrome、Edge、Firefox、Safari、Opera 等现代浏览器（ES2015+）。\\n\\n## 开源协议\\n\\n本项目基于 **Apache 2.0** 协议开源，无需授权即可商业使用。","author":"XYGo Admin","sort":100,"status":1,"isTop":1,"tags":"[\\"介绍\\",\\"技术栈\\"]","categoryName":"项目介绍","views":20,"createdBy":1,"createdAt":1739980800,"updatedAt":1771500625,"updatedBy":1}			1	14	1771500722
958	1	admin	cms/doc	POST /admin/cms/doc/save	POST	/admin/cms/doc/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"id":4,"categoryId":104,"title":"CRUD 代码生成","slug":"crud-gen","cover":"","summary":"使用内置代码生成器快速创建完整的增删改查功能","content":"# CRUD 代码生成\\n\\n代码生成器是 XYGo Admin 的核心功能之一，可以从数据库表一键生成完整的前后端 CRUD 代码。\\n\\n## 功能概览\\n\\n- 📋 **表选择**：从数据库中选择已有表\\n- 🎨 **建表设计器**：可视化设计新表结构\\n- ⚙️ **字段配置**：配置每个字段的展示方式、验证规则\\n- 👁️ **代码预览**：生成前预览所有代码文件\\n- 🚀 **一键生成**：自动生成并注册到项目中\\n\\n## 使用步骤\\n\\n### 第一步：进入代码生成器\\n\\n在后台管理系统中，导航到 **开发工具 → 代码生成**。\\n\\n### 第二步：选择或创建表\\n\\n**方式一：选择已有表**\\n\\n点击「选择数据表」，从下拉列表中选择要生成代码的表。系统会自动读取表结构和字段信息。\\n\\n**方式二：可视化建表**\\n\\n点击「新建表」，打开建表设计器：\\n- 设置表名、表注释\\n- 添加字段，配置字段名、类型、长度、默认值、注释\\n- 设置索引\\n- 点击「创建」，系统会自动执行 DDL 并同步字段\\n\\n### 第三步：配置字段\\n\\n系统会智能推断每个字段的展示类型（designType），你也可以手动调整：\\n\\n| 展示类型 | 说明 | 适用场景 |\\n|---------|------|----------|\\n| input | 文本输入框 | 普通文本字段 |\\n| textarea | 多行文本 | 备注、描述 |\\n| number | 数字输入 | 数量、金额 |\\n| select | 下拉选择 | 状态、类型 |\\n| switch | 开关 | 是/否字段 |\\n| date | 日期选择 | 日期字段 |\\n| timestamp | 时间戳 | created_at 等 |\\n| editor | 富文本编辑器 | 内容字段 |\\n| image | 图片上传 | 头像、封面 |\\n| remoteSelect | 远程搜索选择 | 关联表字段 |\\n\\n### 第四步：预览与生成\\n\\n点击「预览」可以查看将要生成的所有文件：\\n\\n**后端文件：**\\n- `api/admin/xxx.go` — API 接口定义\\n- `controller/admin/xxx.go` — 控制器\\n- `model/input/adminin/xxx.go` — 输入/输出结构体\\n- `logic/xxx/xxx.go` — 业务逻辑\\n\\n**前端文件：**\\n- `api/backend/xxx.ts` — API 请求\\n- `views/backend/xxx/index.vue` — 列表页\\n- `views/backend/xxx/modules/xxx-dialog.vue` — 编辑弹窗\\n\\n**其他：**\\n- 菜单 SQL — 自动插入菜单和权限数据\\n- `logic.go` — 自动注册 Logic 导入\\n\\n确认无误后点击「生成」，代码会自动写入项目目录。\\n\\n### 第五步：重启服务\\n\\n```bash\\n# 生成 DAO\\ngf gen dao\\n\\n# 生成 Service\\ngf gen service\\n\\n# 重启后端\\ngf run main.go\\n```\\n\\n前端代码会在「发布前端」操作后写入 `web/src/` 目录，热更新会自动生效。\\n\\n## 高级功能\\n\\n### 树表支持\\n\\n如果表中包含 `parent_id` 字段，生成器会自动识别为树形结构，生成树表相关代码。\\n\\n### 字段同步\\n\\n当你修改了数据库表结构后，可以使用「同步字段」功能，系统会对比差异并提示 ADD / DROP / MODIFY 操作。\\n\\n### 关联表\\n\\n支持配置关联表查询，在列表和表单中展示关联数据。","author":"XYGo Admin","sort":70,"status":1,"isTop":0,"tags":"[\\"代码生成\\",\\"CRUD\\"]","categoryName":"CRUD代码生成","views":5,"createdBy":1,"createdAt":1739980800,"updatedAt":1771501919,"updatedBy":1}			1	118	1771502384
959	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40}			1	83	1771592843
960	1	admin	cms/community	POST /admin/cms/community/categoryList	POST	/admin/cms/community/categoryList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0				1	155	1771592843
961	1	admin	cms/community	POST /admin/cms/community/categoryList	POST	/admin/cms/community/categoryList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0				1	1	1771594805
962	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40}			1	73	1771594805
963	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40,"categoryId":1}			1	2	1771594810
964	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40,"categoryId":2}			1	2	1771594810
965	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40,"categoryId":3}			1	3	1771594811
966	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40,"categoryId":4}			1	3	1771594812
967	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40,"categoryId":5}			1	2	1771594812
968	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40,"categoryId":1}			1	3	1771594815
969	1	admin	cms/community	POST /admin/cms/community/postList	POST	/admin/cms/community/postList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"page":1,"pageSize":40}			1	3	1771594816
970	1	admin	cms/community	POST /admin/cms/community/replyList	POST	/admin/cms/community/replyList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	{"postId":1,"page":1,"pageSize":100}			1	2	1771594826
971	1	admin	cms/community	POST /admin/cms/community/categoryList	POST	/admin/cms/community/categoryList	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0				1	40	1771598019
\.


--
-- Data for Name: xy_admin_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_post (id, code, name, sort, status, remark, created_by, updated_by, create_time, update_time) FROM stdin;
1	CEO	董事长	1	1	公司最高管理者	0	0	1768556833	1768556833
2	CTO	技术总监	2	1	技术部门负责人	0	0	1768556833	1768556833
3	CFO	财务总监	3	1	财务部门负责人	0	0	1768556833	1768556833
4	PM	产品经理	4	1	产品规划与设计	0	0	1768556833	1768556833
5	DEV	开发工程师	5	1	软件开发	0	0	1768556833	1768556833
6	QA	测试工程师	6	1	质量保证	0	0	1768556833	1768556833
7	UI	UI设计师	7	1	用户界面设计	0	0	1768556833	1768556833
\.


--
-- Data for Name: xy_admin_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_role (id, name, key, data_scope, custom_depts, pid, level, tree, sort, status, remark, created_by, updated_by, create_time, update_time) FROM stdin;
1	超级管理员	super_admin	0	[]	0	1	0	0	1	系统内置超级管理员11	1	0	1768560139	1768560139
2	运维管理员	ops_admin	2	[]	1	2	0,1	0	1	负责运维与系统配置	1	0	1768560139	1768560139
3	业务管理员	biz_admin	1	[]	1	2	0,1	0	1	负责业务数据管理	1	0	1768560139	1768560139
4	访客	viewer	3		3	3	0,1,3	0	1	只读访问权限	1	0	1768560139	1768560139
5	测试二号管理员	node_add	0	[]	1	2	0,1	0	1	一个测试管理员	0	0	1768560139	1768560139
\.


--
-- Data for Name: xy_admin_role_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_role_menu (role_id, menu_id) FROM stdin;
2	1
4	1
2	2
4	2
2	3
4	3
2	4
4	4
4	61
2	80
2	81
2	82
2	83
2	84
2	110
2	111
4	122
4	123
4	124
4	125
4	141
2	144
2	157
2	158
2	159
2	160
2	161
2	162
2	163
2	164
2	202
\.


--
-- Data for Name: xy_admin_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_user (id, username, nickname, real_name, password, gender, salt, mobile, address, remark, email, avatar, dept_id, pid, is_super, status, last_login_at, last_login_ip, created_by, updated_by, create_time, update_time) FROM stdin;
1	admin	超级管理员	系统管理员	e10adc3949ba59abbe56e057f20f883e	1		15524812851	辽宁省-大连市-开发区	一个又懒又爱又帅气得男人	751300685@qq.com	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp	0	0	1	1	\N		0	0	1768575212	1768575212
2	admin2	测试用户2	\N	7e8bc594d2dfd02d6ba7b51aa34d839e	1	AwDVkR	15241328852	\N	\N	aaaa@qq.com		2	0	0	1	\N		1	1	1770708367	1770708956
3	testzong	测试总公司	\N	222ea6a32ab043cf11315020d5a828f9	1	eSDG3M	13895281214	\N	\N	aaa@qq.com		1	0	0	1	\N		1	1	1770711284	1770711284
4	xingxing	星韵	\N	38a82d3031b16b189ef047fdd897c331	1	6lmWUd	13898521473	\N	\N	bbb@qq.com	/attachment/upload/20260210/0a27edcc-e96c-4b2e-95f9-b69c772cde82.webp	5	0	0	1	\N		1	1	1770711602	1770711828
\.


--
-- Data for Name: xy_admin_user_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_user_post (user_id, post_id) FROM stdin;
2	2
3	1
4	2
\.


--
-- Data for Name: xy_admin_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_admin_user_role (user_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
\.


--
-- Data for Name: xy_captcha; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_captcha (id, key, code, captcha, create_time, expire_time) FROM stdin;
\.


--
-- Data for Name: xy_cms_case; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_cms_case (id, category_id, title, cover, summary, content, link, views, sort, status, is_top, tags, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
1	1	智慧校园小程序		为某高校定制的智慧校园小程序，涵盖课表查询、成绩查询、校园卡充值、图书馆座位预约等功能，日活跃用户超过 8000。	# 智慧校园小程序\n\n## 项目背景\n\n某高校希望为师生提供一站式移动服务平台，减少线下排队和纸质流程。\n\n## 核心功能\n\n- 📅 课表查询与提醒\n- 📊 成绩查询与 GPA 计算\n- 💳 校园卡在线充值\n- 📚 图书馆座位预约\n- 🍽️ 食堂菜单与评价\n\n## 技术亮点\n\n- 基于 uni-app 跨端开发，一套代码同时支持微信/支付宝小程序\n- 后端采用 GoFrame + PostgreSQL，接口响应 < 50ms\n- 集成微信支付完成校园卡充值闭环\n\n## 项目成果\n\n| 指标 | 数据 |\n|------|------|\n| 日活用户 | 8,000+ |\n| 接口平均响应 | 38ms |\n| 用户满意度 | 96% |		1280	10	1	1	["uni-app","微信小程序","GoFrame"]	1	1	1771507103	1771507103	0
2	1	社区团购小程序		为某生鲜电商打造的社区团购小程序，支持团长开团、用户拼团、自提点管理，上线首月 GMV 突破 50 万。	# 社区团购小程序\n\n## 项目背景\n\n客户希望搭建社区团购平台，连接供应商、团长和消费者三方。\n\n## 核心功能\n\n- 🛒 团长开团与商品管理\n- 👥 用户拼团下单\n- 📍 自提点地图导航\n- 📦 供应链订单流转\n- 💰 团长佣金结算\n\n## 技术方案\n\n- 前端：微信原生小程序 + Vant Weapp\n- 后端：GoFrame 微服务架构\n- 使用 Redis 实现库存扣减防超卖\n- 接入微信支付分账实现自动佣金结算		860	8	1	0	["微信小程序","电商","Redis"]	1	1	1771507103	1771507103	0
3	1	预约挂号小程序		为某三甲医院开发的在线预约挂号小程序，支持科室选择、医生排班查询、在线缴费，有效缓解了门诊排队压力。	# 预约挂号小程序\n\n## 核心功能\n\n- 🏥 科室与医生浏览\n- 📋 排班查询与预约\n- 💳 在线缴费\n- 🔔 就诊提醒推送\n- 📄 电子报告查看\n\n## 技术亮点\n\n- 对接医院 HIS 系统实现实时排班同步\n- 采用消息队列处理高并发预约请求\n- 微信模板消息实现就诊前自动提醒		520	6	1	0	["医疗","微信小程序","消息队列"]	1	1	1771507103	1771507103	0
4	2	企业服务号营销平台		为某连锁餐饮品牌搭建的微信服务号营销平台，集成会员体系、优惠券发放、积分商城，粉丝转化率提升 35%。	# 企业服务号营销平台\n\n## 项目背景\n\n某连锁餐饮品牌拥有 200+ 门店，希望通过微信服务号构建私域流量池。\n\n## 核心功能\n\n- 🎫 优惠券自动发放与核销\n- 🏆 会员等级与积分体系\n- 🛍️ 积分商城兑换\n- 📊 粉丝画像分析\n- 📱 扫码点餐入口\n\n## 项目成果\n\n- 粉丝数从 5 万增长至 18 万\n- 优惠券核销率达 42%\n- 月均复购率提升 35%		730	9	1	0	["微信公众号","营销","会员系统"]	1	1	1771507103	1771507103	0
5	2	政务公众号服务平台		为某市政务服务中心开发的微信公众号平台，提供办事指南、在线预约、进度查询等便民服务，月服务量超 10 万人次。	# 政务公众号服务平台\n\n## 核心功能\n\n- 📖 办事指南智能检索\n- 📅 业务在线预约\n- 🔍 办件进度实时查询\n- 💬 智能客服问答\n- 📊 满意度评价\n\n## 技术亮点\n\n- 自然语言处理实现智能办事引导\n- 对接政务数据共享平台\n- 支持身份证 OCR 识别快速填表		1560	7	1	0	["政务","公众号","NLP"]	1	1	1771507103	1771507103	0
6	3	智能健身 APP		为某健身品牌开发的智能健身 APP，集成 AI 动作识别、个性化训练计划、社交打卡功能，注册用户突破 20 万。	# 智能健身 APP\n\n## 项目背景\n\n客户希望打造一款结合 AI 技术的智能健身应用，提升用户训练体验。\n\n## 核心功能\n\n- 🤖 AI 动作识别与纠正\n- 📋 个性化训练计划生成\n- 🏃 运动数据实时记录\n- 👥 社交打卡与排行榜\n- 🎵 训练音乐播放器\n\n## 技术方案\n\n- Flutter 跨平台开发（iOS + Android）\n- TensorFlow Lite 实现端侧动作识别\n- 后端 GoFrame + Redis 实现排行榜实时更新\n\n## 项目成果\n\n| 指标 | 数据 |\n|------|------|\n| 注册用户 | 200,000+ |\n| 日活用户 | 15,000+ |\n| App Store 评分 | 4.8 |		2100	10	1	1	["Flutter","AI","健身"]	1	1	1771507103	1771507103	0
7	3	物业管理 APP		为某大型物业集团开发的智慧物业 APP，覆盖报修、缴费、门禁、公告等场景，服务超过 50 个小区。	# 物业管理 APP\n\n## 核心功能\n\n- 🔧 在线报修与工单追踪\n- 💰 物业费在线缴纳\n- 🚪 蓝牙/二维码门禁\n- 📢 社区公告推送\n- 🅿️ 车位管理与访客通行\n\n## 技术亮点\n\n- React Native 跨平台开发\n- 蓝牙 BLE 协议对接门禁硬件\n- WebSocket 实现工单状态实时推送\n- 集成支付宝/微信支付		980	8	1	0	["React Native","物业","蓝牙"]	1	1	1771507103	1771507103	0
8	3	外卖配送 APP		为某区域外卖平台开发的骑手端与商户端 APP，支持智能派单、路径规划、实时定位追踪。	# 外卖配送 APP\n\n## 核心功能\n\n- 📦 智能派单算法\n- 🗺️ 骑手路径规划\n- 📍 实时位置追踪\n- ⏱️ 配送时效监控\n- 💵 骑手收入结算\n\n## 技术方案\n\n- 骑手端：Flutter\n- 商户端：React Native\n- 后端：GoFrame 微服务\n- 高德地图 SDK 实现路径规划\n- MQTT 协议实现位置实时上报		670	6	1	0	["外卖","地图","MQTT"]	1	1	1771507103	1771507103	0
9	4	企业官网 CMS 系统		为某科技集团打造的企业官网内容管理系统，支持多语言、SEO 优化、可视化页面编辑，助力品牌全球化推广。	# 企业官网 CMS 系统\n\n## 项目背景\n\n客户需要一套支持多语言的企业官网系统，面向全球市场展示品牌形象。\n\n## 核心功能\n\n- 🌍 多语言内容管理（中/英/日）\n- 🎨 可视化页面拖拽编辑\n- 🔍 SEO 自动优化\n- 📰 新闻与产品发布\n- 📊 访问数据统计\n\n## 技术方案\n\n- 前端：Vue 3 + Nuxt 3 SSR\n- 后端：GoFrame + PostgreSQL\n- CDN 加速全球访问\n- 结构化数据标记提升搜索排名\n\n## 项目成果\n\n- Google 搜索排名首页关键词 50+\n- 页面加载速度 < 1.5s\n- 多语言覆盖 15 个国家和地区		1850	10	1	1	["Vue3","Nuxt3","SEO","多语言"]	1	1	1771507103	1771507103	0
10	4	在线教育平台		为某教育机构搭建的在线学习平台，支持直播授课、录播回放、在线考试、学习进度追踪，累计服务学员超 5 万人。	# 在线教育平台\n\n## 核心功能\n\n- 🎥 直播授课与互动\n- 📹 录播课程管理\n- 📝 在线考试与自动阅卷\n- 📈 学习进度追踪\n- 💬 师生互动问答\n- 📜 证书自动生成\n\n## 技术亮点\n\n- WebRTC 实现低延迟直播\n- FFmpeg 自动转码生成多清晰度\n- 基于知识图谱的个性化学习推荐		1420	8	1	0	["教育","直播","WebRTC"]	1	1	1771507103	1771507103	0
11	4	B2B 供应链平台		为某制造业企业开发的 B2B 供应链管理平台，实现采购、库存、物流全链路数字化，采购效率提升 60%。	# B2B 供应链平台\n\n## 核心功能\n\n- 🏭 供应商管理与评级\n- 📋 在线询价与比价\n- 📦 采购订单全流程管理\n- 🚚 物流追踪\n- 📊 数据报表与分析\n\n## 技术方案\n\n- 前端：Vue 3 + Element Plus\n- 后端：GoFrame 微服务架构\n- 工作流引擎实现审批流程自动化\n- ECharts 数据可视化大屏		760	6	1	0	["B2B","供应链","工作流"]	1	1	1771507103	1771507103	0
13	5	智能停车场系统		为某城市停车运营商开发的智能停车管理系统，集成车牌识别、车位引导、无感支付，管理车位超过 1 万个。	# 智能停车场系统\n\n## 核心功能\n\n- 🚗 车牌自动识别\n- 🅿️ 车位实时引导\n- 💳 无感支付（ETC/微信/支付宝）\n- 📊 车流量统计分析\n- 🔔 车位预约与到期提醒\n\n## 技术亮点\n\n- 边缘计算实现车牌识别 < 200ms\n- MQTT + WebSocket 实现车位状态实时同步\n- 对接多家支付渠道实现无感离场		920	8	1	0	["停车","车牌识别","边缘计算"]	1	1	1771507103	1771507103	0
14	5	工业设备远程运维平台		为某装备制造企业开发的工业设备远程运维平台，实现设备状态监控、故障预警、远程诊断，设备停机时间减少 45%。	# 工业设备远程运维平台\n\n## 核心功能\n\n- 🏭 设备运行状态实时监控\n- ⚠️ 故障预警与智能诊断\n- 🔧 远程参数调整\n- 📋 维保工单管理\n- 📈 OEE 设备综合效率分析\n\n## 技术方案\n\n- 数据采集：OPC UA + Modbus 协议\n- 时序存储：InfluxDB\n- 预警引擎：基于规则 + 机器学习\n- 前端：Vue 3 + Three.js 3D 设备模型		540	6	1	0	["工业物联网","OPC UA","Three.js"]	1	1	1771507103	1771507103	0
12	5	智慧农业监控平台		为某农业科技公司开发的智慧农业物联网平台，实时监控温湿度、土壤、光照等环境数据，支持远程控制灌溉和通风设备。	# 智慧农业监控平台\n\n## 项目背景\n\n客户拥有 200+ 个温室大棚，需要实现环境数据实时监控和设备远程控制。\n\n## 核心功能\n\n- 🌡️ 温湿度实时监控\n- 🌱 土壤墒情检测\n- 💧 智能灌溉控制\n- 📹 视频监控接入\n- ⚠️ 异常告警推送\n- 📊 历史数据分析\n\n## 技术方案\n\n- 设备端：ESP32 + MQTT 协议\n- 服务端：GoFrame + TimescaleDB 时序数据库\n- 前端：Vue 3 数据大屏\n- 规则引擎实现自动化控制策略\n\n## 项目成果\n\n| 指标 | 数据 |\n|------|------|\n| 接入设备 | 3,000+ |\n| 数据采集频率 | 5s/次 |\n| 节水效率 | 提升 40% |		1681	10	1	1	["物联网","MQTT","时序数据库"]	1	1	1771507103	1771507120	0
\.


--
-- Data for Name: xy_cms_case_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_cms_case_category (id, pid, title, icon, sort, status, remark, created_at, updated_at) FROM stdin;
1	0	小程序	ri:mini-program-line	5	1		1771506887	1771506887
2	0	公众号	ri:wechat-line	4	1		1771506887	1771506887
3	0	APP	ri:smartphone-line	3	1		1771506887	1771506887
4	0	网站系统	ri:computer-line	2	1		1771506887	1771506887
5	0	物联网	ri:router-line	1	1		1771506887	1771506887
\.


--
-- Data for Name: xy_cms_doc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_cms_doc (id, category_id, title, slug, cover, summary, content, author, views, sort, status, is_top, tags, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
7	202	后台交互流程	interaction		前后端请求流程、JWT 认证机制与接口规范	# 后台交互流程\n\n## 请求流程\n\n前端发起请求到后端响应的完整链路：\n\n```\n前端 API 调用\n  → Axios 拦截器（自动注入 Token）\n    → HTTP 请求\n      → Nginx 反向代理\n        → GoFrame HTTP Server\n          → CORS 中间件\n            → 慢接口监控中间件\n              → 响应包装中间件\n                → 鉴权中间件（JWT 校验）\n                  → 操作日志中间件\n                    → Controller\n                      → Service → Logic → DAO → DB\n```\n\n## JWT 认证\n\n### 后台管理员认证\n\n- Token 类型：Bearer Token\n- Header：`Authorization: Bearer <token>`\n- 有效期：配置文件中设置\n- 刷新机制：Token 过期后返回 code=61，前端自动跳转登录页\n\n### 前台会员认证\n\n- Token 类型：自定义 Header\n- Header：`Xy-User-Token: <token>`\n- 独立于后台管理员 Token，互不影响\n\n### 被踢下线\n\n当管理员在其他设备登录时，当前设备会收到 code=10010，前端弹窗提示并跳转登录页。\n\n## 统一响应格式\n\n所有接口返回统一的 JSON 结构：\n\n```json\n{\n  "code": 0,\n  "message": "success",\n  "data": {},\n  "traceId": "abc123"\n}\n```\n\n| 字段 | 说明 |\n|------|------|\n| code | 业务状态码，0=成功，-1=失败，61=未授权，10010=被踢下线 |\n| message | 提示信息 |\n| data | 业务数据 |\n| traceId | 请求追踪 ID |\n\n## 前端请求封装\n\n项目提供三套请求实例：\n\n```typescript\nimport { adminRequest } from '@/utils/http'\nimport { memberRequest } from '@/utils/http'\nimport { siteRequest } from '@/utils/http'\n\n// 后台管理接口\nconst res = await adminRequest.get({ url: '/user/list' })\n\n// 会员接口\nconst res = await memberRequest.post({ url: '/auth/login', params: data })\n\n// 公共接口（无需登录）\nconst res = await siteRequest.get({ url: '/doc/list' })\n```\n\n### 请求拦截器\n\n- 根据 URL 前缀自动区分后台 Token / 会员 Token\n- 自动从 Store 中读取并注入 Token\n\n### 响应拦截器\n\n- code=0：返回 data 字段\n- code=61：清除 Token，跳转登录页（3 秒防抖）\n- code=10010：弹窗提示被踢下线\n- 其他：ElMessage 提示错误信息\n\n## API 定义规范（后端）\n\n使用 GoFrame 的声明式路由，在 `api/` 目录定义请求和响应结构体：\n\n```go\ntype UserListReq struct {\n    g.Meta   `path:"/user/list" method:"get" tags:"用户管理" summary:"用户列表"`\n    Page     int    `json:"page" d:"1"`\n    PageSize int    `json:"pageSize" d:"20"`\n    Username string `json:"username"`\n}\n\ntype UserListRes struct {\n    List  []entity.AdminUser `json:"list"`\n    Total int                `json:"total"`\n}\n```	XYGo Admin	3	90	1	0	["交互","JWT"]	1	1	1739980800	1771500765	0
6	201	目录结构	structure		详细了解 server 和 web 的完整目录结构	# 目录结构\n\n## 后端目录 server/\n\n```\nserver/\n├── api/                    # API 接口定义\n│   ├── admin/              # 后台管理接口（请求/响应结构体 + g.Meta 路由声明）\n│   ├── member/             # 会员端接口\n│   ├── site/               # 前台公共接口\n│   └── system/             # 系统接口（验证码、健康检查）\n├── internal/               # 内部模块（不可外部引用）\n│   ├── cmd/                # 启动命令（HTTP Server 初始化、路由注册、中间件挂载）\n│   ├── controller/         # 控制器层\n│   │   ├── admin/          # 后台控制器（20+ 文件）\n│   │   ├── member/         # 会员控制器\n│   │   ├── site/           # 前台控制器\n│   │   └── system/         # 系统控制器\n│   ├── logic/              # 业务逻辑层（核心代码）\n│   │   ├── admin/          # 管理员管理\n│   │   ├── chat/           # 即时聊天\n│   │   ├── cmsdoc/         # CMS 文档\n│   │   ├── cron/           # 定时任务\n│   │   ├── dept/           # 部门管理\n│   │   ├── gencodes/       # 代码生成器\n│   │   ├── log/            # 日志管理\n│   │   ├── member/         # 会员（认证/签到/通知/菜单/分组）\n│   │   ├── monitor/        # 系统监控\n│   │   ├── notice/         # 通知公告\n│   │   ├── post/           # 岗位管理\n│   │   ├── sysconfig/      # 系统配置\n│   │   ├── user/           # 后台用户/登录\n│   │   ├── upload.go       # 文件上传\n│   │   └── logic.go        # 统一注册入口\n│   ├── service/            # 服务接口层（gf gen service 自动生成）\n│   ├── model/              # 数据模型\n│   │   ├── entity/         # 数据库实体（gf gen dao 自动生成）\n│   │   ├── do/             # 数据操作对象（自动生成）\n│   │   └── input/          # 输入/输出结构体\n│   │       ├── adminin/    # 后台输入（25 个文件）\n│   │       ├── memberin/   # 会员输入\n│   │       └── form/       # 通用分页结构\n│   ├── dao/                # 数据访问层\n│   │   ├── internal/       # 内层 DAO（自动生成，勿修改）\n│   │   └── *.go            # 外层 DAO（可扩展自定义方法）\n│   ├── middleware/         # 中间件\n│   │   ├── auth.go         # 后台 JWT 鉴权\n│   │   ├── member_auth.go  # 会员鉴权\n│   │   ├── ws_auth.go      # WebSocket 鉴权\n│   │   ├── cors.go         # 跨域处理\n│   │   ├── response.go     # 统一响应包装\n│   │   ├── operation_log.go # 操作日志\n│   │   └── performance.go  # 慢接口监控\n│   ├── library/            # 基础库\n│   │   ├── token/          # JWT 令牌\n│   │   ├── cache/          # 缓存\n│   │   ├── cron/           # 定时任务调度引擎\n│   │   ├── queue/          # 消息队列（Redis/Disk 双驱动）\n│   │   ├── monitor/        # 性能监控\n│   │   ├── storager/       # 存储驱动（本地/OSS/COS/七牛）\n│   │   ├── dbdialect/      # 数据库方言（MySQL/PG 适配）\n│   │   └── security/       # 安全（脱敏/登录保护）\n│   ├── crons/              # 定时任务注册\n│   ├── queues/             # 消息队列消费者注册\n│   ├── field/              # 资源注册\n│   └── websocket/          # WebSocket 基础设施\n├── manifest/\n│   └── config/             # 配置文件\n├── resource/\n│   └── sql/                # SQL 脚本\n├── hack/\n│   └── config.yaml         # GoFrame CLI 配置\n├── go.mod\n└── main.go                 # 入口文件\n```\n\n## 前端目录 web/\n\n```\nweb/\n├── src/\n│   ├── api/                # API 请求\n│   │   ├── backend/        # 后台 API（auth/system/common/cms）\n│   │   └── frontend/       # 前台 API（member/doc）\n│   ├── components/         # 公共组件\n│   │   ├── core/           # 核心组件\n│   │   │   ├── base/       # 基础（Logo）\n│   │   │   ├── charts/     # 图表（9 种 ECharts 组件）\n│   │   │   ├── forms/      # 表单（16 个组件）\n│   │   │   ├── tables/     # 表格（ArtTable/ArtTableHeader）\n│   │   │   ├── layouts/    # 布局（20+ 组件）\n│   │   │   ├── media/      # 媒体（视频播放/图片裁剪）\n│   │   │   └── others/     # 其他（水印/右键菜单）\n│   │   └── business/       # 业务组件\n│   ├── views/              # 页面视图\n│   │   ├── backend/        # 后台页面（12 个模块）\n│   │   └── frontend/       # 前台页面（首页/文档/社区/案例/会员）\n│   ├── router/             # 路由\n│   │   ├── routes/         # 静态路由 + 动态路由\n│   │   ├── modules/        # 后台路由模块\n│   │   ├── guards/         # 路由守卫\n│   │   └── core/           # 路由核心工具\n│   ├── store/              # Pinia 状态管理\n│   ├── locales/            # 国际化（zh/en）\n│   ├── directives/         # 自定义指令（v-auth/v-roles/v-ripple/v-highlight）\n│   ├── utils/              # 工具函数\n│   │   ├── http/           # Axios 封装\n│   │   ├── socket/         # WebSocket 客户端\n│   │   ├── storage/        # 本地存储\n│   │   └── ...             # 导航/UI/表单/表格/系统\n│   ├── types/              # TypeScript 类型定义\n│   └── styles/             # 全局样式\n├── vite.config.ts          # Vite 配置\n├── package.json\n└── tsconfig.json\n```	XYGo Admin	4	100	1	0	["目录","结构"]	1	1	1739980800	1771501328	0
3	103	开发者必读	must-read		了解项目架构、开发规范和注意事项，避免踩坑	# 开发者必读\n\n在开始开发之前，请务必阅读本文档，了解项目的核心架构和开发规范。\n\n## 项目架构\n\nXYGo Admin 采用经典的前后端分离架构：\n\n```\nxygoadmin/\n├── server/          # Go 后端（GoFrame）\n│   ├── api/         # API 接口定义（请求/响应结构体）\n│   ├── internal/\n│   │   ├── cmd/         # 启动命令\n│   │   ├── controller/  # 控制器（路由处理）\n│   │   ├── logic/       # 业务逻辑（核心实现）\n│   │   ├── service/     # 服务接口（自动生成）\n│   │   ├── model/       # 数据模型\n│   │   │   ├── entity/  # 数据库实体（自动生成）\n│   │   │   ├── do/      # 数据操作对象（自动生成）\n│   │   │   └── input/   # 输入/输出结构体\n│   │   ├── dao/         # 数据访问层（自动生成）\n│   │   └── middleware/  # 中间件\n│   └── manifest/\n│       └── config/      # 配置文件\n└── web/             # Vue3 前端\n    └── src/\n        ├── api/         # API 请求封装\n        ├── components/  # 公共组件\n        ├── views/       # 页面视图\n        ├── router/      # 路由配置\n        ├── store/       # 状态管理\n        └── utils/       # 工具函数\n```\n\n## 后端分层架构\n\n请求处理遵循以下流程：\n\n```\nHTTP Request\n  → Middleware（鉴权、日志、响应包装）\n    → Controller（参数校验、调用 Service）\n      → Service（接口定义）\n        → Logic（业务逻辑实现）\n          → DAO（数据库操作）\n            → Database\n```\n\n### 关键规则\n\n1. **Controller 层**：只做参数接收和结果返回，不写业务逻辑\n2. **Logic 层**：所有业务逻辑都在这里实现\n3. **Service 层**：由 `gf gen service` 自动生成，不要手动修改\n4. **DAO 层**：`dao/internal/` 下的文件由 CLI 自动生成，不要修改；扩展方法写在 `dao/` 外层\n5. **Entity/DO**：由 `gf gen dao` 自动生成，不要手动修改\n\n## 前端开发规范\n\n### 组件命名\n\n- 公共组件以 `Art` 前缀命名：`ArtTable`、`ArtSearchBar`、`ArtSvgIcon`\n- 页面组件使用 PascalCase：`UserList.vue`、`DocDialog.vue`\n\n### 图标使用\n\n项目统一使用 **Remix Icon** 图标库，通过 `ArtSvgIcon` 组件引用：\n\n```vue\n<ArtSvgIcon icon="ri:home-line" class="text-xl" />\n```\n\n可在 [Remix Icon 官网](https://remixicon.com/) 搜索图标。\n\n### 网络请求\n\n项目封装了三套请求实例，按场景使用：\n\n| 实例 | 前缀 | Token | 用途 |\n|------|------|-------|------|\n| `adminRequest` | `/admin` | Bearer Token | 后台管理接口 |\n| `memberRequest` | `/member` | Xy-User-Token | 前台会员接口 |\n| `siteRequest` | `/site` | 无 | 前台公共接口 |\n\n### 状态管理\n\n使用 Pinia 3 + 持久化插件，Store 文件放在 `src/store/modules/` 下。\n\n## 数据库规范\n\n- 表名统一使用 `xy_` 前缀\n- 字段命名使用 snake_case\n- 时间字段统一使用 UNIX 时间戳（bigint）\n- 软删除字段：`deleted_at`（0 表示未删除）\n- 必备字段：`id`、`created_at`、`updated_at`\n\n## Git 提交规范\n\n项目使用 commitizen + cz-git，提交格式：\n\n```\nfeat: 新增用户管理模块\nfix: 修复登录页验证码不显示\ndocs: 更新部署文档\nstyle: 调整表格样式\nrefactor: 重构权限校验逻辑\n```	XYGo Admin	6	80	1	0	["架构","规范"]	1	1	1739980800	1771501726	0
4	104	CRUD 代码生成	crud-gen		使用内置代码生成器快速创建完整的增删改查功能	# CRUD 代码生成\n\n代码生成器是 XYGo Admin 的核心功能之一，可以从数据库表一键生成完整的前后端 CRUD 代码。\n\n## 功能概览\n\n- 📋 **表选择**：从数据库中选择已有表\n- 🎨 **建表设计器**：可视化设计新表结构\n- ⚙️ **字段配置**：配置每个字段的展示方式、验证规则\n- 👁️ **代码预览**：生成前预览所有代码文件\n- 🚀 **一键生成**：自动生成并注册到项目中\n\n## 使用步骤\n\n### 第一步：进入代码生成器\n\n在后台管理系统中，导航到 **开发工具 → 代码生成**。\n\n### 第二步：选择或创建表\n\n**方式一：选择已有表**\n\n点击「选择数据表」，从下拉列表中选择要生成代码的表。系统会自动读取表结构和字段信息。\n\n**方式二：可视化建表**\n\n点击「新建表」，打开建表设计器：\n- 设置表名、表注释\n- 添加字段，配置字段名、类型、长度、默认值、注释\n- 设置索引\n- 点击「创建」，系统会自动执行 DDL 并同步字段\n\n### 第三步：配置字段\n\n系统会智能推断每个字段的展示类型（designType），你也可以手动调整：\n\n| 展示类型 | 说明 | 适用场景 |\n|---------|------|----------|\n| input | 文本输入框 | 普通文本字段 |\n| textarea | 多行文本 | 备注、描述 |\n| number | 数字输入 | 数量、金额 |\n| select | 下拉选择 | 状态、类型 |\n| switch | 开关 | 是/否字段 |\n| date | 日期选择 | 日期字段 |\n| timestamp | 时间戳 | created_at 等 |\n| editor | 富文本编辑器 | 内容字段 |\n| image | 图片上传 | 头像、封面 |\n| remoteSelect | 远程搜索选择 | 关联表字段 |\n\n### 第四步：预览与生成\n\n点击「预览」可以查看将要生成的所有文件：\n\n**后端文件：**\n- `api/admin/xxx.go` — API 接口定义\n- `controller/admin/xxx.go` — 控制器\n- `model/input/adminin/xxx.go` — 输入/输出结构体\n- `logic/xxx/xxx.go` — 业务逻辑\n\n**前端文件：**\n- `api/backend/xxx.ts` — API 请求\n- `views/backend/xxx/index.vue` — 列表页\n- `views/backend/xxx/modules/xxx-dialog.vue` — 编辑弹窗\n\n**其他：**\n- 菜单 SQL — 自动插入菜单和权限数据\n- `logic.go` — 自动注册 Logic 导入\n\n确认无误后点击「生成」，代码会自动写入项目目录。\n\n### 第五步：重启服务\n\n```bash\n# 生成 DAO\ngf gen dao\n\n# 生成 Service\ngf gen service\n\n# 重启后端\ngf run main.go\n```\n\n前端代码会在「发布前端」操作后写入 `web/src/` 目录，热更新会自动生效。\n\n## 高级功能\n\n### 树表支持\n\n如果表中包含 `parent_id` 字段，生成器会自动识别为树形结构，生成树表相关代码。\n\n### 字段同步\n\n当你修改了数据库表结构后，可以使用「同步字段」功能，系统会对比差异并提示 ADD / DROP / MODIFY 操作。\n\n### 关联表\n\n支持配置关联表查询，在列表和表单中展示关联数据。	XYGo Admin	6	70	1	0	["代码生成","CRUD"]	1	1	1739980800	1771502400	0
10	205	国际化	i18n		vue-i18n 多语言配置与使用指南	# 国际化\n\nXYGo Admin 基于 `vue-i18n` 实现多语言支持，目前内置简体中文和英文。\n\n## 语言文件\n\n语言包位于 `web/src/locales/` 目录：\n\n```\nlocales/\n├── index.ts          # i18n 实例创建与配置\n└── langs/\n    ├── zh.json       # 简体中文\n    └── en.json       # English\n```\n\n## 配置说明\n\n```typescript\n// locales/index.ts\nimport { createI18n } from 'vue-i18n'\nimport zh from './langs/zh.json'\nimport en from './langs/en.json'\n\nconst i18n = createI18n({\n  locale: 'zh',           // 默认语言\n  fallbackLocale: 'en',   // 回退语言\n  messages: { zh, en }\n})\n```\n\n语言偏好会自动保存到 localStorage，下次访问时恢复。\n\n## 使用方式\n\n### 模板中使用\n\n```vue\n<template>\n  <h1>{{ $t('dashboard.title') }}</h1>\n  <p>{{ $t('common.welcome', { name: username }) }}</p>\n</template>\n```\n\n### 脚本中使用\n\n```typescript\nimport { useI18n } from 'vue-i18n'\n\nconst { t } = useI18n()\nconsole.log(t('common.success'))\n```\n\n## 语言包格式\n\n```json\n{\n  "common": {\n    "success": "操作成功",\n    "failed": "操作失败",\n    "confirm": "确定",\n    "cancel": "取消",\n    "welcome": "欢迎，{name}"\n  },\n  "dashboard": {\n    "title": "控制台"\n  }\n}\n```\n\n## 切换语言\n\n前台布局中提供了语言切换按钮，点击即可切换。切换后会：\n1. 更新 i18n locale\n2. 保存到 localStorage\n3. 更新 Element Plus 的语言包\n\n## 添加新语言\n\n1. 在 `locales/langs/` 下新建语言文件，如 `ja.json`\n2. 在 `locales/index.ts` 中导入并注册\n3. 在语言切换组件中添加选项	XYGo Admin	1	60	1	0	["国际化","i18n"]	1	1	1739980800	1771500829	0
12	301	网络请求	http-request		Axios 封装、三套请求实例与拦截器机制	# 网络请求\n\n## 架构设计\n\n项目基于 Axios 封装了统一的 HTTP 请求层，位于 `web/src/utils/http/`：\n\n```\nutils/http/\n├── index.ts      # 核心封装：Axios 实例、拦截器、请求方法\n├── status.ts     # 业务状态码定义\n└── error.ts      # 自定义 HttpError 类\n```\n\n## 三套请求实例\n\n通过 `createPrefixedApi(prefix)` 工厂函数创建带前缀的请求实例：\n\n```typescript\n// 后台管理接口 — 自动注入 Bearer Token\nexport const adminRequest = createPrefixedApi('/admin')\n\n// 前台会员接口 — 自动注入 Xy-User-Token\nexport const memberRequest = createPrefixedApi('/member')\n\n// 前台公共接口 — 无需 Token\nexport const siteRequest = createPrefixedApi('/site')\n```\n\n每个实例提供 5 个方法：\n\n```typescript\nadminRequest.get<T>({ url, params?, config? })\nadminRequest.post<T>({ url, params?, config? })\nadminRequest.put<T>({ url, params?, config? })\nadminRequest.del<T>({ url, params?, config? })\nadminRequest.request<T>(config)\n```\n\n## 使用示例\n\n```typescript\n// API 文件 — api/backend/cms/doc.ts\nimport { adminRequest } from '@/utils/http'\n\nexport function fetchDocList(params: any) {\n  return adminRequest.get({ url: '/cmsDoc/list', params })\n}\n\nexport function fetchSaveDoc(data: any) {\n  return adminRequest.post({ url: '/cmsDoc/edit', params: data })\n}\n\nexport function fetchDeleteDoc(id: number) {\n  return adminRequest.post({ url: '/cmsDoc/delete', params: { id } })\n}\n```\n\n## 拦截器\n\n### 请求拦截器\n\n- 根据 URL 前缀自动区分 Token 类型\n- `/admin` 开头 → 注入 `Authorization: Bearer <token>`\n- `/member` 开头 → 注入 `Xy-User-Token: <token>`\n- 其他 → 不注入 Token\n\n### 响应拦截器\n\n| 业务码 | 处理方式 |\n|--------|----------|\n| 0 (success) | 返回 `response.data.data` |\n| -1 (error) | ElMessage 提示错误信息 |\n| 61 (unauthorized) | 清除 Token，跳转登录页（3 秒防抖） |\n| 10010 (kickedOut) | 弹窗提示被踢下线 |\n\n## 配置\n\n- baseURL：来自环境变量 `VITE_API_URL`\n- 超时时间：15 秒\n- 失败重试：可配置（默认关闭）	XYGo Admin	1	100	1	0	["HTTP","Axios"]	1	1	1739980800	1771500851	0
15	304	表格组件	table-component		ArtTable 和 ArtTableHeader 组件使用指南	# 表格组件\n\n## ArtTable\n\n`ArtTable` 是对 Element Plus `ElTable` 的封装，提供统一的样式和加载状态。\n\n### 基本用法\n\n```vue\n<template>\n  <ArtTable :loading="loading" :data="tableData">\n    <ElTableColumn prop="title" label="标题" min-width="200" show-overflow-tooltip />\n    <ElTableColumn prop="status" label="状态" width="80" align="center">\n      <template #default="{ row }">\n        <ElTag :type="row.status === 1 ? 'success' : 'danger'" size="small">\n          {{ row.status === 1 ? '正常' : '禁用' }}\n        </ElTag>\n      </template>\n    </ElTableColumn>\n    <ElTableColumn label="操作" width="150" fixed="right">\n      <template #default="{ row }">\n        <ElButton link type="primary" size="small" @click="handleEdit(row)">编辑</ElButton>\n        <ElButton link type="danger" size="small" @click="handleDelete(row.id)">删除</ElButton>\n      </template>\n    </ElTableColumn>\n  </ArtTable>\n</template>\n```\n\n### Props\n\n| 属性 | 类型 | 默认值 | 说明 |\n|------|------|--------|------|\n| data | Array | [] | 表格数据 |\n| loading | Boolean | false | 加载状态 |\n\n## ArtTableHeader\n\n表格头部工具栏，提供刷新按钮和自定义插槽。\n\n```vue\n<template>\n  <ArtTableHeader :loading="loading" @refresh="loadData">\n    <template #left>\n      <ElButton type="primary" @click="handleAdd">新增</ElButton>\n      <ElButton @click="handleExport">导出</ElButton>\n    </template>\n  </ArtTableHeader>\n</template>\n```\n\n### Events\n\n| 事件 | 说明 |\n|------|------|\n| refresh | 点击刷新按钮时触发 |\n\n### Slots\n\n| 插槽 | 说明 |\n|------|------|\n| left | 左侧操作区域 |\n| right | 右侧操作区域 |\n\n## 完整示例\n\n```vue\n<template>\n  <ElCard shadow="never">\n    <ArtTableHeader :loading="loading" @refresh="loadData">\n      <template #left>\n        <ElButton type="primary" v-auth="'add'">新增</ElButton>\n      </template>\n    </ArtTableHeader>\n\n    <ArtTable :loading="loading" :data="tableData">\n      <!-- 列定义 -->\n    </ArtTable>\n\n    <div class="art-pagination">\n      <ElPagination\n        v-model:current-page="page"\n        v-model:page-size="pageSize"\n        :total="total"\n        layout="total, sizes, prev, pager, next, jumper"\n        @size-change="loadData"\n        @current-change="loadData"\n      />\n    </div>\n  </ElCard>\n</template>\n```	XYGo Admin	1	70	1	0	["表格","组件"]	1	1	1739980800	1771500876	0
16	305	表单组件	form-component		Element Plus 表单最佳实践与内置表单组件	# 表单组件\n\n## Element Plus 表单\n\n项目中的表单统一使用 Element Plus 的 `ElForm` 组件，配合 `ElDialog` 实现弹窗编辑。\n\n### 标准表单模式\n\n```vue\n<template>\n  <ElDialog v-model="visible" :title="isEdit ? '编辑' : '新增'" width="600px">\n    <ElForm ref="formRef" :model="formData" :rules="rules" label-width="80px">\n      <ElFormItem label="名称" prop="name">\n        <ElInput v-model="formData.name" placeholder="请输入名称" />\n      </ElFormItem>\n      <ElFormItem label="状态" prop="status">\n        <ElSelect v-model="formData.status">\n          <ElOption label="正常" :value="1" />\n          <ElOption label="禁用" :value="2" />\n        </ElSelect>\n      </ElFormItem>\n    </ElForm>\n    <template #footer>\n      <ElButton @click="visible = false">取消</ElButton>\n      <ElButton type="primary" @click="handleSubmit" :loading="submitting">保存</ElButton>\n    </template>\n  </ElDialog>\n</template>\n```\n\n### 验证规则\n\n```typescript\nconst rules: FormRules = {\n  name: [{ required: true, message: '请输入名称', trigger: 'blur' }],\n  status: [{ required: true, message: '请选择状态', trigger: 'change' }]\n}\n```\n\n## 内置表单组件\n\n| 组件 | 说明 |\n|------|------|\n| ArtSearchBar | 搜索栏组件 |\n| ArtForm | 通用表单生成器 |\n| ArtImageUpload | 图片上传（支持裁剪、多图） |\n| ArtFileUpload | 文件上传 |\n| ArtFileSelector | 从附件库选择文件 |\n| ArtIconSelector | 图标选择器 |\n| ArtColorPicker | 颜色选择器 |\n| ArtArrayEditor | 数组编辑器 |\n| ArtCronDesigner | Cron 表达式设计器 |\n| ArtWangEditor | 富文本编辑器 |\n| ArtClickCaptcha | 点选验证码 |\n| ArtDragVerify | 拖拽验证 |\n| ArtExcelImport | Excel 导入 |\n| ArtExcelExport | Excel 导出 |\n\n## 图片上传示例\n\n```vue\n<ElFormItem label="封面图">\n  <ArtImageUpload v-model="formData.cover" :limit="1" />\n</ElFormItem>\n```\n\n## 富文本编辑器\n\n项目内置两种富文本方案：\n\n- **WangEditor**：适合简单富文本场景\n- **md-editor-v3**：适合 Markdown 文档编辑\n\n```vue\n<!-- WangEditor -->\n<ArtWangEditor v-model="formData.content" />\n\n<!-- Markdown 编辑器 -->\n<MdEditor v-model="formData.content" />\n```	XYGo Admin	1	60	1	0	["表单","组件"]	1	1	1739980800	1771500884	0
17	306	CSS 与样式	css-style		Tailwind CSS 4 + Clay 拟态阴影设计体系	# CSS 与样式\n\n## 技术方案\n\n- **Tailwind CSS 4**：原子化 CSS，通过 `@tailwindcss/vite` 插件集成\n- **SCSS**：全局变量和 Mixin\n- **Clay 拟态设计**：项目独创的阴影体系\n\n## Clay 拟态阴影\n\n项目的核心视觉特色，通过多层阴影模拟黏土质感：\n\n### 阴影变量\n\n```scss\n// 卡片阴影\n.shadow-clay-card {\n  box-shadow:\n    16px 16px 32px rgba(165, 175, 190, 0.3),\n    -10px -10px 24px rgba(255, 255, 255, 0.9),\n    inset 6px 6px 12px rgba(90, 141, 238, 0.03),\n    inset -6px -6px 12px rgba(255, 255, 255, 1);\n}\n\n// 按钮阴影\n.shadow-clay-btn {\n  box-shadow:\n    12px 12px 24px rgba(90, 141, 238, 0.3),\n    -8px -8px 16px rgba(255, 255, 255, 0.4),\n    inset 4px 4px 8px rgba(255, 255, 255, 0.4),\n    inset -4px -4px 8px rgba(0, 0, 0, 0.05);\n}\n\n// 按压效果\n.shadow-clay-pressed {\n  box-shadow:\n    inset 10px 10px 20px #e0e5ec,\n    inset -10px -10px 20px #ffffff;\n}\n\n// 深层阴影（Hero 区域）\n.shadow-clay-deep {\n  box-shadow:\n    30px 30px 60px #d1d9e6,\n    -30px -30px 60px #ffffff,\n    inset 10px 10px 20px rgba(90, 141, 238, 0.05),\n    inset -10px -10px 20px rgba(255, 255, 255, 0.8);\n}\n```\n\n### 配色体系\n\n```scss\n.text-clay-foreground { color: #32325d; }  // 主文字\n.text-clay-muted { color: #8898aa; }       // 次要文字\n.text-clay-accent { color: #5a8dee; }      // 强调色\n.bg-clay-accent { background: #5a8dee; }   // 强调背景\n```\n\n## Tailwind CSS 使用\n\n项目使用 Tailwind CSS v4，通过 Vite 插件自动集成，无需独立配置文件。\n\n### 常用类名\n\n```vue\n<template>\n  <!-- 布局 -->\n  <div class="flex items-center gap-4 p-6">\n  \n  <!-- 圆角卡片 -->\n  <div class="bg-white/70 backdrop-blur-xl rounded-[32px] p-8">\n  \n  <!-- 响应式 -->\n  <div class="grid lg:grid-cols-12 gap-8">\n  \n  <!-- 文字 -->\n  <h1 class="font-heading font-black text-3xl text-clay-foreground">\n</template>\n```\n\n## 全局 SCSS\n\nVite 配置中自动注入两个全局 SCSS 文件：\n\n- `el-light.scss`：Element Plus 主题变量覆盖\n- `mixin.scss`：常用 Mixin（响应式断点、文字截断等）	XYGo Admin	2	50	1	0	["CSS","Tailwind","Clay"]	1	1	1739980800	1771501398	0
19	401	GoFrame 基础	goframe-basic		GoFrame v2 框架核心概念与配置文件说明	# GoFrame 基础\n\n## 框架简介\n\nXYGo Admin 后端基于 [GoFrame v2](https://goframe.org/) 构建，GoFrame 是一款模块化、高性能的 Go 应用开发框架。\n\n## 核心概念\n\n### 项目结构约定\n\nGoFrame 推荐的标准项目结构：\n\n```\nserver/\n├── api/          # 对外接口定义（请求/响应结构体）\n├── internal/     # 内部逻辑（不可被外部包引用）\n│   ├── cmd/      # 入口命令\n│   ├── controller/\n│   ├── logic/\n│   ├── service/\n│   ├── model/\n│   └── dao/\n├── manifest/\n│   └── config/   # 配置文件\n├── hack/         # CLI 工具配置\n└── main.go\n```\n\n### g.Meta 声明式路由\n\nGoFrame 使用结构体 tag 声明路由，无需手动注册：\n\n```go\ntype HelloReq struct {\n    g.Meta `path:"/hello" method:"get" tags:"示例" summary:"Hello接口"`\n    Name   string `json:"name" v:"required#请输入名称"`\n}\n\ntype HelloRes struct {\n    Message string `json:"message"`\n}\n```\n\n### 自动校验\n\n通过 `v` tag 实现参数自动校验：\n\n```go\nName     string `v:"required|length:2,20#名称不能为空|长度2-20"`\nEmail    string `v:"required|email"`\nAge      int    `v:"between:1,150"`\n```\n\n## 配置文件\n\n主配置文件位于 `server/manifest/config/config.yaml`：\n\n```yaml\nserver:\n  address: ":8000"\n  serverRoot: "resource/public"\n\ndatabase:\n  default:\n    link: "pgsql:postgres:123456@tcp(127.0.0.1:5432)/xygoadmin"\n    debug: true\n    prefix: "xy_"\n\nredis:\n  default:\n    address: 127.0.0.1:6379\n    db: 0\n\nlogger:\n  path: "logs"\n  level: "all"\n  stdout: true\n```\n\n## CLI 工具\n\nGoFrame CLI（`gf`）提供代码生成能力：\n\n```bash\n# 生成 DAO + Entity + DO\ngf gen dao\n\n# 生成 Service 接口\ngf gen service\n\n# 运行项目（支持热重载）\ngf run main.go\n```\n\nCLI 配置文件：`server/hack/config.yaml`\n\n```yaml\ngfcli:\n  gen:\n    dao:\n      link: "pgsql:postgres:123456@tcp(127.0.0.1:5432)/xygonew"\n      removePrefix: "xy_"\n      jsonCase: "CamelLower"\n    service:\n      srcFolder: "internal/logic"\n      dstFolder: "internal/service"\n```	XYGo Admin	4	100	1	0	["GoFrame","框架"]	1	1	1739980800	1771501352	0
18	307	内置组件库	components		项目内置的 50+ 公共组件一览	# 内置组件库\n\n项目内置了 50+ 公共组件，按功能分类组织在 `web/src/components/` 目录下。\n\n## 图表组件（9 个）\n\n基于 ECharts 6 封装，开箱即用：\n\n| 组件 | 说明 |\n|------|------|\n| ArtBarChart | 柱状图 |\n| ArtLineChart | 折线图 |\n| ArtRingChart | 环形图 |\n| ArtRadarChart | 雷达图 |\n| ArtScatterChart | 散点图 |\n| ArtKLineChart | K 线图 |\n| ArtMapChart | 地图图表 |\n| ArtHBarChart | 水平柱状图 |\n| ArtDualBarCompareChart | 双向对比柱状图 |\n\n## 表单组件（16 个）\n\n| 组件 | 说明 |\n|------|------|\n| ArtSearchBar | 搜索栏 |\n| ArtForm | 通用表单生成器 |\n| ArtWangEditor | 富文本编辑器 |\n| ArtImageUpload | 图片上传 |\n| ArtFileUpload | 文件上传 |\n| ArtFileSelector | 文件选择器 |\n| ArtIconSelector | 图标选择器 |\n| ArtColorPicker | 颜色选择器 |\n| ArtArrayEditor | 数组编辑器 |\n| ArtFieldEditor | 字段编辑器 |\n| ArtClickCaptcha | 点选验证码 |\n| ArtCronDesigner | Cron 表达式设计器 |\n| ArtDragVerify | 拖拽验证 |\n| ArtExcelImport | Excel 导入 |\n| ArtExcelExport | Excel 导出 |\n| ArtButtonTable / ArtButtonMore | 按钮组件 |\n\n## 布局组件（20+ 个）\n\n| 组件 | 说明 |\n|------|------|\n| ArtHeaderBar | 顶部导航栏 |\n| ArtSidebarMenu | 侧边栏菜单 |\n| ArtHorizontalMenu | 水平菜单 |\n| ArtMixedMenu | 混合菜单 |\n| ArtBreadcrumb | 面包屑 |\n| ArtWorkTab | 工作标签页 |\n| ArtPageContent | 页面内容容器 |\n| ArtSettingsPanel | 设置面板 |\n| ArtScreenLock | 锁屏 |\n| ArtGlobalSearch | 全局搜索 |\n| ArtFastEnter | 快速入口 |\n| ArtChatWindow | 聊天窗口 |\n| ArtNotification | 通知 |\n| ArtFireworksEffect | 烟花特效 |\n\n## 媒体组件\n\n| 组件 | 说明 |\n|------|------|\n| ArtVideoPlayer | 视频播放器（基于 xgplayer） |\n| ArtCutterImg | 图片裁剪 |\n\n## 文字特效\n\n| 组件 | 说明 |\n|------|------|\n| ArtTextScroll | 文字滚动 |\n| ArtCountTo | 数字动画 |\n| ArtFestivalTextScroll | 节日文字滚动 |\n\n## 其他\n\n| 组件 | 说明 |\n|------|------|\n| ArtWatermark | 水印 |\n| ArtMenuRight | 右键菜单 |\n| ArtSvgIcon | SVG 图标 |\n\n## 自定义指令\n\n| 指令 | 说明 |\n|------|------|\n| v-auth | 按钮级权限控制 |\n| v-roles | 角色级权限控制 |\n| v-ripple | Material Design 水波纹效果 |\n| v-highlight | 代码高亮 |	XYGo Admin	3	40	1	0	["组件","组件库"]	1	1	1739980800	1771501397	0
20	402	控制器开发	controller		Controller 层编写规范与最佳实践	# 控制器开发\n\n## 职责定义\n\nController 层只负责：\n1. 接收请求参数（由框架自动绑定）\n2. 调用 Service 层处理业务\n3. 返回响应结果\n\n**不要在 Controller 中编写业务逻辑。**\n\n## 编写规范\n\n### 1. 定义 API 结构体\n\n在 `api/admin/` 目录下定义请求和响应：\n\n```go\n// api/admin/admin_example.go\npackage admin\n\nimport "github.com/gogf/gf/v2/frame/g"\n\n// 列表\ntype ExampleListReq struct {\n    g.Meta   `path:"/example/list" method:"get" tags:"示例管理" summary:"列表"`\n    Page     int    `json:"page" d:"1"`\n    PageSize int    `json:"pageSize" d:"20"`\n    Title    string `json:"title"`\n}\ntype ExampleListRes struct {\n    List  interface{} `json:"list"`\n    Total int         `json:"total"`\n}\n\n// 编辑（新增+修改）\ntype ExampleEditReq struct {\n    g.Meta `path:"/example/edit" method:"post" tags:"示例管理" summary:"编辑"`\n    Id     uint64 `json:"id"`\n    Title  string `json:"title" v:"required#请输入标题"`\n    Status int    `json:"status" d:"1"`\n}\ntype ExampleEditRes struct{}\n\n// 删除\ntype ExampleDeleteReq struct {\n    g.Meta `path:"/example/delete" method:"post" tags:"示例管理" summary:"删除"`\n    Id     uint64 `json:"id" v:"required#请选择要删除的数据"`\n}\ntype ExampleDeleteRes struct{}\n```\n\n### 2. 编写 Controller\n\n```go\n// internal/controller/admin/example.go\npackage admin\n\nimport (\n    "context"\n    api "xygo/api/admin"\n    "xygo/internal/service"\n)\n\nvar Example = cExample{}\ntype cExample struct{}\n\nfunc (c *cExample) List(ctx context.Context, req *api.ExampleListReq) (res *api.ExampleListRes, err error) {\n    return service.Example().List(ctx, req)\n}\n\nfunc (c *cExample) Edit(ctx context.Context, req *api.ExampleEditReq) (res *api.ExampleEditRes, err error) {\n    return service.Example().Edit(ctx, req)\n}\n\nfunc (c *cExample) Delete(ctx context.Context, req *api.ExampleDeleteReq) (res *api.ExampleDeleteRes, err error) {\n    return service.Example().Delete(ctx, req)\n}\n```\n\n### 3. 注册路由\n\n在 `internal/cmd/cmd.go` 中将 Controller 注册到路由组：\n\n```go\n// /admin 路由组\ngroup.Group("/admin", func(group *ghttp.RouterGroup) {\n    group.Middleware(middleware.AdminAuth)\n    group.Bind(\n        controller.Admin.Example,\n        // ... 其他控制器\n    )\n})\n```	XYGo Admin	1	90	1	0	["Controller","控制器"]	1	1	1739980800	1771500919	0
21	403	业务逻辑层	logic-service		Logic 层与 Service 层的开发规范	# 业务逻辑层\n\n## 架构说明\n\n- **Service 层**：定义接口（由 `gf gen service` 自动生成，勿手动修改）\n- **Logic 层**：实现接口（核心业务代码写在这里）\n\n## 编写 Logic\n\n### 1. 创建 Logic 文件\n\n```go\n// internal/logic/example/example.go\npackage example\n\nimport (\n    "context"\n    api "xygo/api/admin"\n    "xygo/internal/dao"\n    "xygo/internal/service"\n)\n\nfunc init() {\n    service.RegisterExample(New())\n}\n\nfunc New() *sExample {\n    return &sExample{}\n}\n\ntype sExample struct{}\n```\n\n### 2. 实现业务方法\n\n```go\n// 列表查询\nfunc (s *sExample) List(ctx context.Context, req *api.ExampleListReq) (res *api.ExampleListRes, err error) {\n    res = &api.ExampleListRes{}\n    m := dao.Example.Ctx(ctx)\n\n    if req.Title != "" {\n        m = m.WhereLike("title", "%"+req.Title+"%")\n    }\n\n    res.Total, err = m.Count()\n    if err != nil {\n        return\n    }\n\n    err = m.Page(req.Page, req.PageSize).\n        OrderDesc("id").\n        Scan(&res.List)\n    return\n}\n\n// 编辑（新增+修改）\nfunc (s *sExample) Edit(ctx context.Context, req *api.ExampleEditReq) (res *api.ExampleEditRes, err error) {\n    data := do.Example{\n        Title:  req.Title,\n        Status: req.Status,\n    }\n    if req.Id > 0 {\n        _, err = dao.Example.Ctx(ctx).Where("id", req.Id).Data(data).Update()\n    } else {\n        _, err = dao.Example.Ctx(ctx).Data(data).Insert()\n    }\n    return\n}\n\n// 删除\nfunc (s *sExample) Delete(ctx context.Context, req *api.ExampleDeleteReq) (res *api.ExampleDeleteRes, err error) {\n    _, err = dao.Example.Ctx(ctx).Where("id", req.Id).Delete()\n    return\n}\n```\n\n### 3. 注册到 logic.go\n\n在 `internal/logic/logic.go` 中添加导入：\n\n```go\npackage logic\n\nimport (\n    _ "xygo/internal/logic/example"\n    // ... 其他模块\n)\n```\n\n### 4. 生成 Service 接口\n\n```bash\ngf gen service\n```\n\n这会自动在 `internal/service/` 下生成 `example.go`，包含接口定义和注册函数。\n\n## 注意事项\n\n- Logic 中的 `init()` 函数负责将实现注册到 Service\n- 所有数据库操作通过 DAO 层进行，不要直接写 SQL\n- 事务操作使用 `dao.Example.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error { ... })`	XYGo Admin	3	80	1	0	["Logic","Service"]	1	1	1739980800	1771500923	0
24	406	定时任务	cron-task		Cron 定时任务的配置、开发与管理	# 定时任务\n\n## 功能概览\n\n- 可视化管理定时任务（增删改查）\n- 支持 Cron 表达式配置执行周期\n- 在线执行（手动触发一次）\n- 执行日志记录与查询\n- 任务分组管理\n\n## 任务注册\n\n在 `internal/crons/` 目录下注册任务：\n\n```go\n// internal/crons/example.go\npackage crons\n\nimport (\n    "context"\n    "xygo/internal/library/cron"\n)\n\nfunc init() {\n    cron.Register("example_task", func(ctx context.Context) error {\n        // 你的任务逻辑\n        g.Log().Info(ctx, "定时任务执行中...")\n        return nil\n    })\n}\n```\n\n## 后台管理\n\n在后台「系统管理 → 定时任务」中：\n\n1. **新增任务**：选择已注册的任务标识，配置 Cron 表达式\n2. **启用/禁用**：控制任务是否参与调度\n3. **在线执行**：手动触发一次，立即执行\n4. **执行日志**：查看每次执行的结果和耗时\n\n## Cron 表达式\n\n```\n┌──────────── 秒 (0-59)\n│ ┌────────── 分 (0-59)\n│ │ ┌──────── 时 (0-23)\n│ │ │ ┌────── 日 (1-31)\n│ │ │ │ ┌──── 月 (1-12)\n│ │ │ │ │ ┌── 周 (0-6, 0=周日)\n│ │ │ │ │ │\n* * * * * *\n```\n\n常用示例：\n\n| 表达式 | 说明 |\n|--------|------|\n| `0 */5 * * * *` | 每 5 分钟 |\n| `0 0 2 * * *` | 每天凌晨 2 点 |\n| `0 0 0 1 * *` | 每月 1 号零点 |\n| `0 30 9 * * 1-5` | 工作日 9:30 |\n\n## 任务分组\n\n支持将任务按业务分组管理，方便查找和维护。	XYGo Admin	0	50	1	0	["定时任务","Cron"]	1	1	1739980800	1739980800	0
25	407	WebSocket	websocket		即时聊天模块的架构与开发指南	# WebSocket\n\n## 架构设计\n\n项目基于 `gorilla/websocket` 实现即时通讯，采用 Hub 模式管理连接：\n\n```\nWebSocket 基础设施（internal/websocket/）\n├── init.go       # Start() 启动 Hub、WsHandler 处理连接\n├── client.go     # 客户端连接封装\n├── manager.go    # Hub 管理器（SendToUser/IsUserOnline）\n├── router.go     # 消息路由分发\n└── model.go      # WsResponse 等数据结构\n```\n\n## 连接流程\n\n```\n前端 WebSocket 连接\n  → /socket/ 端点\n    → WsAuth 中间件（JWT 鉴权）\n      → WsHandler 创建 Client\n        → 注册到 Hub Manager\n          → 开始收发消息\n```\n\n## 聊天功能\n\n聊天业务逻辑在 `internal/logic/chat/chat.go` 中实现：\n\n| 功能 | 方法 | 说明 |\n|------|------|------|\n| 会话列表 | Sessions | 获取单聊/群聊会话列表 |\n| 创建会话 | CreateSession | 单聊去重 + 群聊系统消息 |\n| 删除会话 | DeleteSession | 软删除（仅对当前用户） |\n| 消息列表 | Messages | 游标分页 + 发送者信息 |\n| 发送消息 | SendMessage | 写入 DB + 更新未读 + WS 推送 |\n| 标记已读 | MarkRead | 标记已读 + 推送已读回执 |\n| 联系人 | Contacts | 含部门/岗位/在线状态 |\n| 群聊管理 | GroupUpdate | 改名/加人/踢人 |\n| 未读总数 | UnreadTotal | 所有会话未读消息总数 |\n\n## 前端 WebSocket 客户端\n\n位于 `web/src/utils/socket/index.ts`，特性：\n\n- **单例模式**：全局只维护一个连接\n- **心跳检测**：定时发送 ping 保持连接\n- **指数退避重连**：断线后自动重连，间隔递增\n- **消息队列**：连接断开时缓存消息，恢复后自动发送\n- **连接超时**：超时自动断开并重试\n\n```typescript\nimport { useWebSocket } from '@/utils/socket'\n\nconst ws = useWebSocket()\nws.connect()\nws.send({ type: 'chat', data: { ... } })\nws.onMessage((msg) => { ... })\n```\n\n## Nginx 配置\n\nWebSocket 需要特殊的 Nginx 配置：\n\n```nginx\nlocation /socket/ {\n    proxy_pass http://127.0.0.1:8000;\n    proxy_http_version 1.1;\n    proxy_set_header Upgrade $http_upgrade;\n    proxy_set_header Connection "upgrade";\n    proxy_read_timeout 86400;\n}\n```	XYGo Admin	1	40	1	0	["WebSocket","聊天"]	1	1	1739980800	1771501340	0
27	502	会员认证	member-auth		会员登录注册与 JWT Token 机制	# 会员认证\n\n## 认证体系\n\n会员认证独立于后台管理员，使用不同的 Token Header：\n\n| 对比项 | 后台管理员 | 前台会员 |\n|--------|-----------|----------|\n| Token Header | `Authorization: Bearer` | `Xy-User-Token` |\n| 中间件 | AdminAuth | MemberAuth |\n| Store | useUserStore | useMemberStore |\n| 路由前缀 | `/admin` | `/member` |\n\n## 登录流程\n\n```\n1. 用户输入账号密码\n2. 前端调用 POST /member/auth/login\n3. 后端校验密码（password + salt 加密比对）\n4. 生成 JWT Token\n5. 返回 Token + 用户信息\n6. 前端存储到 useMemberStore（持久化）\n7. 后续请求自动注入 Xy-User-Token Header\n```\n\n## 注册流程\n\n```\n1. 用户填写注册信息（用户名、密码、手机号等）\n2. 前端调用 POST /member/auth/register\n3. 后端校验唯一性（用户名、手机号不重复）\n4. 生成 salt，加密密码\n5. 写入 member 表\n6. 自动登录，返回 Token\n```\n\n## 前端使用\n\n```typescript\nimport { useMemberStore } from '@/store/modules/member'\n\nconst memberStore = useMemberStore()\n\n// 登录\nawait memberStore.login({ username, password })\n\n// 获取用户信息\nconst userInfo = memberStore.memberInfo\n\n// 登出\nmemberStore.logout()\n```\n\n## 路由守卫\n\n会员中心页面需要登录才能访问，在路由守卫中检查：\n- 访问 `/user/*` 路径时检查会员 Token\n- 未登录跳转到 `/user/login`\n- 支持白名单配置（无需登录的页面）	XYGo Admin	0	90	1	0	["认证","JWT","登录"]	1	1	1739980800	1739980800	0
28	503	积分与资金	score-money		积分日志、资金日志与变动记录管理	# 积分与资金\n\n## 积分系统\n\n### 积分变动场景\n\n| 场景 | 积分变化 | 说明 |\n|------|---------|------|\n| 每日签到 | +N | 签到奖励，连续签到可递增 |\n| 后台调整 | ±N | 管理员手动调整 |\n| 消费扣除 | -N | 积分兑换等场景 |\n\n### 积分日志\n\n每次积分变动都会记录到 `member_score_log` 表：\n\n| 字段 | 说明 |\n|------|------|\n| member_id | 会员 ID |\n| score | 变动积分（正数增加，负数扣除） |\n| balance | 变动后余额 |\n| remark | 变动说明 |\n| created_at | 变动时间 |\n\n### 后台管理\n\n在「会员管理 → 积分日志」中可以：\n- 查看所有会员的积分变动记录\n- 按会员、时间范围筛选\n- 查看积分余额变化趋势\n\n## 资金系统\n\n### 资金变动场景\n\n| 场景 | 资金变化 | 说明 |\n|------|---------|------|\n| 充值 | +N | 会员充值 |\n| 后台调整 | ±N | 管理员手动调整 |\n| 消费 | -N | 购买服务等 |\n\n### 资金日志\n\n记录到 `member_money_log` 表，结构与积分日志类似。\n\n## 前台展示\n\n会员中心中展示积分和余额信息：\n\n```typescript\n// api/frontend/member/score-log.ts\nexport function fetchScoreLog(params: any) {\n  return memberRequest.get({ url: '/scoreLog/list', params })\n}\n\n// api/frontend/member/money-log.ts\nexport function fetchMoneyLog(params: any) {\n  return memberRequest.get({ url: '/moneyLog/list', params })\n}\n```	XYGo Admin	0	80	1	0	["积分","资金"]	1	1	1739980800	1739980800	0
29	504	签到系统	checkin		每日签到功能与连续签到奖励	# 签到系统\n\n## 功能说明\n\n会员每日签到可获得积分奖励，连续签到天数越多奖励越高。\n\n## 签到规则\n\n- 每天只能签到一次\n- 签到成功后获得积分奖励\n- 连续签到天数会累计\n- 断签后连续天数重置为 1\n\n## 数据结构\n\n`member_checkin` 表：\n\n| 字段 | 说明 |\n|------|------|\n| member_id | 会员 ID |\n| days | 连续签到天数 |\n| last_checkin_at | 最后签到时间 |\n| total_days | 累计签到总天数 |\n\n## 后端实现\n\n签到逻辑在 `internal/logic/member/checkin.go` 中：\n\n```go\n// 签到流程\n1. 检查今天是否已签到\n2. 判断是否连续签到（昨天是否签到）\n3. 更新连续天数（连续 +1，断签重置为 1）\n4. 计算积分奖励\n5. 增加会员积分 + 记录积分日志\n6. 更新签到记录\n```\n\n## 前端调用\n\n```typescript\n// api/frontend/member/checkin.ts\nimport { memberRequest } from '@/utils/http'\n\n// 执行签到\nexport function doCheckin() {\n  return memberRequest.post({ url: '/checkin/sign' })\n}\n\n// 获取签到状态\nexport function getCheckinStatus() {\n  return memberRequest.get({ url: '/checkin/status' })\n}\n```\n\n## 前台展示\n\n会员中心和社区页面中展示签到组件：\n- 显示连续签到天数\n- 7 天签到日历\n- 签到按钮（已签到则置灰）\n- 积分奖励提示	XYGo Admin	0	70	1	0	["签到","积分"]	1	1	1739980800	1739980800	0
32	603	数据库配置	database-config		MySQL 与 PostgreSQL 双数据库配置指南	# 数据库配置\n\nXYGo Admin 同时支持 MySQL 和 PostgreSQL，通过配置文件切换。\n\n## 连接配置\n\n编辑 `server/manifest/config/config.yaml`：\n\n### PostgreSQL\n\n```yaml\ndatabase:\n  default:\n    link: "pgsql:postgres:123456@tcp(127.0.0.1:5432)/xygoadmin"\n    debug: true\n    prefix: "xy_"\n```\n\n### MySQL\n\n```yaml\ndatabase:\n  default:\n    link: "mysql:root:123456@tcp(127.0.0.1:3306)/xygoadmin?charset=utf8mb4&parseTime=true&loc=Local"\n    debug: true\n    prefix: "xy_"\n```\n\n## 建表脚本\n\n项目提供两套建表脚本：\n\n| 文件 | 数据库 |\n|------|--------|\n| `mysql_install.sql` | MySQL |\n| `pgsql_install.sql` | PostgreSQL |\n\n## CLI 配置\n\n代码生成器也需要配置数据库连接，编辑 `server/hack/config.yaml`：\n\n```yaml\ngfcli:\n  gen:\n    dao:\n      # PostgreSQL\n      link: "pgsql:postgres:123456@tcp(127.0.0.1:5432)/xygoadmin"\n      # MySQL\n      # link: "mysql:root:123456@tcp(127.0.0.1:3306)/xygoadmin"\n      removePrefix: "xy_"\n      jsonCase: "CamelLower"\n```\n\n## 方言适配\n\n项目通过 `library/dbdialect/` 包处理两种数据库的差异：\n\n| 差异点 | MySQL | PostgreSQL |\n|--------|-------|------------|\n| 自增主键 | `AUTO_INCREMENT` | `SERIAL` / `BIGSERIAL` |\n| 布尔类型 | `TINYINT(1)` | `BOOLEAN` |\n| JSON 类型 | `JSON` | `JSONB` |\n| 字符串引号 | 反引号 `` ` `` | 双引号 `"` |\n| 时间戳 | `BIGINT` | `BIGINT` |\n\n代码生成器在创建表和同步字段时会自动适配当前数据库类型。\n\n## 注意事项\n\n1. 两种数据库不能混用，选定后保持一致\n2. 修改数据库类型后需要重新导入对应的建表脚本\n3. `gf gen dao` 会根据 `hack/config.yaml` 中的连接自动识别数据库类型\n4. PostgreSQL 的 `bigint` 在 Go 中映射为 `uint64`（通过 `typeMapping` 配置）	XYGo Admin	1	80	1	0	["数据库","MySQL","PostgreSQL"]	1	1	1739980800	1771497973	0
33	604	常见安装问题	install-faq		安装过程中常见问题的排查与解决	# 常见安装问题\n\n## Go 相关\n\n### Q: `go install` 下载超时\n\n设置 Go 代理：\n\n```bash\ngo env -w GOPROXY=https://goproxy.cn,direct\n```\n\n### Q: `gf` 命令找不到\n\n确认 `$GOPATH/bin` 在 PATH 中：\n\n```bash\n# 查看 GOPATH\ngo env GOPATH\n\n# 添加到 PATH\nexport PATH=$PATH:$(go env GOPATH)/bin\n```\n\n### Q: `gf gen dao` 连接数据库失败\n\n检查 `server/hack/config.yaml` 中的数据库连接配置：\n- 确认数据库服务已启动\n- 确认用户名密码正确\n- 确认数据库已创建\n- PostgreSQL 注意端口是 5432，MySQL 是 3306\n\n## Node.js 相关\n\n### Q: `pnpm install` 失败\n\n```bash\n# 清除缓存\npnpm store prune\n\n# 设置国内镜像\npnpm config set registry https://registry.npmmirror.com\n\n# 重试\npnpm install\n```\n\n### Q: `pnpm build` 内存不足\n\n```bash\n# 增加 Node.js 内存限制\nexport NODE_OPTIONS="--max-old-space-size=4096"\npnpm build\n```\n\n### Q: 前端启动后页面空白\n\n1. 检查浏览器控制台是否有报错\n2. 确认后端服务已启动\n3. 检查 `vite.config.ts` 中的代理配置是否指向正确的后端地址\n4. 清除浏览器缓存和 localStorage\n\n## 数据库相关\n\n### Q: 导入 SQL 报错\n\n- MySQL：确认使用 `mysql_install.sql`\n- PostgreSQL：确认使用 `pgsql_install.sql`\n- 不要混用两种数据库的 SQL 文件\n\n### Q: PostgreSQL 连接报 "password authentication failed"\n\n检查 `pg_hba.conf` 文件，确认本地连接认证方式：\n\n```\n# IPv4 local connections:\nhost    all    all    127.0.0.1/32    md5\n```\n\n修改后重启 PostgreSQL。\n\n### Q: Redis 连接失败\n\n```bash\n# 检查 Redis 是否运行\nredis-cli ping\n# 应返回 PONG\n\n# 检查端口\nnetstat -tlnp | grep 6379\n```\n\n## 端口冲突\n\n### Q: 后端 8000 端口被占用\n\n修改 `config.yaml` 中的端口：\n\n```yaml\nserver:\n  address: ":8001"\n```\n\n同时修改前端 `vite.config.ts` 中的代理目标地址。\n\n### Q: 前端 5173 端口被占用\n\nVite 会自动尝试下一个可用端口，或手动指定：\n\n```typescript\n// vite.config.ts\nserver: {\n  port: 3000\n}\n```	XYGo Admin	3	70	1	0	["安装","问题","排查"]	1	1	1739980800	1771497876	0
31	602	Linux 安装	install-linux		Linux 生产环境部署指南	# Linux 安装\n\n以 Ubuntu 22.04 / CentOS 8 为例。\n\n## 1. 安装 Go\n\n```bash\n# 下载\nwget https://go.dev/dl/go1.24.0.linux-amd64.tar.gz\n\n# 解压\nsudo tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz\n\n# 配置环境变量\necho 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc\necho 'export GOPATH=$HOME/go' >> ~/.bashrc\necho 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc\nsource ~/.bashrc\n\n# 设置代理\ngo env -w GOPROXY=https://goproxy.cn,direct\n\n# 验证\ngo version\n```\n\n## 2. 安装 Node.js\n\n```bash\n# 使用 nvm 安装（推荐）\ncurl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash\nsource ~/.bashrc\nnvm install 20\nnvm use 20\n\n# 安装 pnpm\nnpm install -g pnpm\n```\n\n## 3. 安装 PostgreSQL\n\n```bash\n# Ubuntu\nsudo apt update\nsudo apt install postgresql postgresql-contrib\nsudo systemctl start postgresql\nsudo systemctl enable postgresql\n\n# 创建数据库\nsudo -u postgres psql\nCREATE DATABASE xygoadmin WITH ENCODING 'UTF8';\nALTER USER postgres PASSWORD '123456';\n\\q\n```\n\n## 4. 安装 Redis\n\n```bash\nsudo apt install redis-server\nsudo systemctl start redis\nsudo systemctl enable redis\n```\n\n## 5. 部署项目\n\n```bash\n# 克隆代码\ngit clone https://github.com/your-org/xygoadmin.git\ncd xygoadmin\n\n# 导入数据库\npsql -U postgres -d xygoadmin -f pgsql_install.sql\n\n# 编译后端\ncd server\ngo build -o xygoadmin main.go\n\n# 构建前端\ncd ../web\npnpm install\npnpm build\n```\n\n## 6. 配置 Nginx\n\n```bash\nsudo apt install nginx\n```\n\n将前端 `dist/` 目录部署到 Nginx，配置反向代理到后端 8000 端口。详见「构建与部署」文档。\n\n## 7. 配置 systemd\n\n```bash\nsudo vim /etc/systemd/system/xygoadmin.service\n```\n\n```ini\n[Unit]\nDescription=XYGo Admin\nAfter=network.target postgresql.service redis.service\n\n[Service]\nType=simple\nUser=www-data\nWorkingDirectory=/var/www/xygoadmin/server\nExecStart=/var/www/xygoadmin/server/xygoadmin\nRestart=always\n\n[Install]\nWantedBy=multi-user.target\n```\n\n```bash\nsudo systemctl daemon-reload\nsudo systemctl start xygoadmin\nsudo systemctl enable xygoadmin\n```	XYGo Admin	1	90	1	0	["Linux","部署"]	1	1	1739980800	1771497976	0
30	601	Windows 安装	install-windows		Windows 环境下从零搭建开发环境	# Windows 安装\n\n## 1. 安装 Go\n\n1. 访问 [Go 官网](https://go.dev/dl/) 下载 Windows 安装包\n2. 运行安装程序，默认安装到 `C:\\Go`\n3. 验证安装：\n\n```powershell\ngo version\n# go1.24.0 windows/amd64\n```\n\n4. 设置 Go 代理（国内加速）：\n\n```powershell\ngo env -w GOPROXY=https://goproxy.cn,direct\ngo env -w GO111MODULE=on\n```\n\n## 2. 安装 GoFrame CLI\n\n```powershell\ngo install github.com/gogf/gf/cmd/gf/v2@latest\ngf version\n```\n\n## 3. 安装 Node.js\n\n1. 访问 [Node.js 官网](https://nodejs.org/) 下载 LTS 版本\n2. 运行安装程序\n3. 安装 pnpm：\n\n```powershell\nnpm install -g pnpm\npnpm --version\n```\n\n## 4. 安装数据库\n\n### PostgreSQL（推荐）\n\n1. 下载 [PostgreSQL](https://www.postgresql.org/download/windows/)\n2. 安装时设置密码（如 `123456`）\n3. 创建数据库：\n\n```sql\nCREATE DATABASE xygoadmin WITH ENCODING 'UTF8';\n```\n\n### MySQL（可选）\n\n1. 下载 [MySQL](https://dev.mysql.com/downloads/installer/)\n2. 安装并设置 root 密码\n3. 创建数据库：\n\n```sql\nCREATE DATABASE xygoadmin DEFAULT CHARACTER SET utf8mb4;\n```\n\n## 5. 安装 Redis\n\nWindows 下推荐使用 [Memurai](https://www.memurai.com/) 或 WSL2 中的 Redis。\n\n## 6. 启动项目\n\n```powershell\n# 克隆代码\ngit clone https://github.com/your-org/xygoadmin.git\ncd xygoadmin\n\n# 导入数据库\npsql -U postgres -d xygoadmin -f pgsql_install.sql\n\n# 修改配置文件\n# 编辑 server/manifest/config/config.yaml\n\n# 启动后端\ncd server\ngf run main.go\n\n# 新开终端，启动前端\ncd web\npnpm install\npnpm dev\n```	XYGo Admin	1	100	1	0	["Windows","安装"]	1	1	1739980800	1771497978	0
23	405	文件上传	file-upload		多云存储驱动与文件上传配置	# 文件上传\n\n## 存储驱动\n\n项目支持 4 种存储驱动，通过 `sys_config` 表的 `oss` 分组配置：\n\n| 驱动 | 说明 |\n|------|------|\n| local | 本地存储（默认） |\n| aliyun_oss | 阿里云 OSS |\n| tencent_cos | 腾讯云 COS |\n| qiniu | 七牛云存储 |\n\n## 配置方式\n\n在后台「系统配置」中设置上传参数：\n\n- **存储驱动**：选择使用哪种存储\n- **最大文件大小**：支持 kb/mb/gb 单位，如 `10mb`\n- **允许的文件后缀**：如 `jpg,png,gif,pdf,doc,xlsx`\n- **允许的 MIME 类型**：如 `image/*,application/pdf`\n\n### 云存储配置\n\n以阿里云 OSS 为例：\n- AccessKey ID\n- AccessKey Secret\n- Bucket 名称\n- Endpoint（如 `oss-cn-hangzhou.aliyuncs.com`）\n- 自定义域名（可选）\n\n## 上传接口\n\n```\nPOST /admin/upload/file\nContent-Type: multipart/form-data\n\n参数：file（文件）\n\n响应：\n{\n  "code": 0,\n  "data": {\n    "url": "https://xxx.com/uploads/2025/01/abc.jpg",\n    "name": "abc.jpg",\n    "size": 102400\n  }\n}\n```\n\n## 前端调用\n\n```typescript\n// 使用 ArtImageUpload 组件\n<ArtImageUpload v-model="formData.cover" :limit="1" />\n\n// 手动上传\nconst formData = new FormData()\nformData.append('file', file)\nconst res = await adminRequest.post({\n  url: '/upload/file',\n  params: formData,\n  headers: { 'Content-Type': 'multipart/form-data' }\n})\n```\n\n## 附件管理\n\n所有上传的文件会记录到 `sys_attachment` 表，可在后台「附件管理」中查看、搜索、删除。支持按文件类型筛选：图片、文档、音频、视频、压缩包等。	XYGo Admin	1	60	1	0	["上传","OSS","存储"]	1	1	1739980800	1771498376	0
22	404	数据库操作	database		DAO / Entity / DO 三层模型与数据库方言适配	# 数据库操作\n\n## 三层模型\n\n| 层 | 目录 | 说明 | 是否自动生成 |\n|----|------|------|-------------|\n| Entity | `model/entity/` | 数据库表结构映射，字段与表一一对应 | ✅ gf gen dao |\n| DO | `model/do/` | 数据操作对象，所有字段类型为 `any`，用于 Where/Data | ✅ gf gen dao |\n| DAO | `dao/` | 数据访问对象，提供 `Ctx(ctx)` 获取 Model | ✅ gf gen dao |\n\n### Entity 示例\n\n```go\n// model/entity/admin_user.go（自动生成，勿修改）\ntype AdminUser struct {\n    Id        uint64 `json:"id"        orm:"id"`\n    Username  string `json:"username"  orm:"username"`\n    Password  string `json:"password"  orm:"password"`\n    Status    int    `json:"status"    orm:"status"`\n    CreatedAt uint64 `json:"createdAt" orm:"created_at"`\n}\n```\n\n### DAO 双层结构\n\n```go\n// dao/internal/admin_user.go（自动生成，勿修改）\n// 包含表名、字段名常量、Ctx() 方法\n\n// dao/admin_user.go（可扩展）\ntype adminUserDao struct { *internal.AdminUserDao }\nvar AdminUser = adminUserDao{internal.NewAdminUserDao()}\n\n// 可以在这里添加自定义方法\nfunc (d *adminUserDao) FindByUsername(ctx context.Context, username string) (*entity.AdminUser, error) {\n    var user entity.AdminUser\n    err := d.Ctx(ctx).Where("username", username).Scan(&user)\n    return &user, err\n}\n```\n\n## 常用操作\n\n```go\n// 查询列表\nvar list []entity.AdminUser\nerr := dao.AdminUser.Ctx(ctx).Page(1, 20).OrderDesc("id").Scan(&list)\n\n// 条件查询\nm := dao.AdminUser.Ctx(ctx)\nif username != "" {\n    m = m.WhereLike("username", "%"+username+"%")\n}\nif status > 0 {\n    m = m.Where("status", status)\n}\n\n// 新增\n_, err := dao.AdminUser.Ctx(ctx).Data(do.AdminUser{\n    Username: "newuser",\n    Status:   1,\n}).Insert()\n\n// 更新\n_, err := dao.AdminUser.Ctx(ctx).Where("id", id).Data(do.AdminUser{\n    Status: 2,\n}).Update()\n\n// 删除\n_, err := dao.AdminUser.Ctx(ctx).Where("id", id).Delete()\n\n// 事务\nerr := dao.AdminUser.Transaction(ctx, func(ctx context.Context, tx gdb.TX) error {\n    // 事务内的操作\n    return nil\n})\n```\n\n## 数据库方言适配\n\n项目通过 `library/dbdialect/` 包实现 MySQL 和 PostgreSQL 的兼容：\n\n- 类型映射：自动转换数据类型差异\n- DDL 生成：代码生成器创建表时自动适配语法\n- 表前缀：统一使用 `xy_`，在 CLI 配置中通过 `removePrefix` 去除	XYGo Admin	3	70	1	0	["数据库","DAO","ORM"]	1	1	1739980800	1771500926	0
1	101	项目介绍	introduce		全面了解 XYGo Admin 的技术栈、核心特色与设计理念	# 关于 XYGo Admin\n\nXYGo Admin 是一款基于 **GoFrame + Vue3 + Element Plus + Tailwind CSS** 的企业级中后台管理系统。项目采用前后端分离架构，融合现代化设计理念与工程化实践，致力于为开发者提供高效、优雅的开发基础。\n\n## 核心特色\n\n### 🎨 Clay 拟态设计\n\n项目独创的 Clay（黏土拟态）设计体系，通过科学的阴影层次和柔和的光影效果，打造出极具质感的 UI 界面。告别传统管理系统的视觉疲劳，让每一次操作都赏心悦目。\n\n### ⚡ 全栈代码生成\n\n内置强大的 CRUD 代码生成器，支持：\n- 可视化建表设计器\n- 字段配置与类型推断\n- 一键生成 Go 后端（API + Controller + Logic）+ Vue 前端（列表页 + 弹窗 + 搜索栏）\n- 自动注册路由、菜单与权限\n\n### 🔐 三级权限体系\n\n- **角色权限（RBAC）**：基于角色的菜单与接口访问控制\n- **按钮级权限**：精确到每个操作按钮的显隐控制\n- **字段级权限**：控制数据字段的可见性与可编辑性\n\n### 💬 即时通讯\n\n基于 WebSocket 的实时聊天系统，支持单聊、群聊、在线状态检测、消息已读回执。\n\n### 📊 系统监控\n\n内置服务器监控、性能分析（pprof）、慢接口检测、操作日志审计等运维工具。\n\n## 技术栈\n\n### 后端\n\n| 技术 | 说明 |\n|------|------|\n| Go 1.24 | 编程语言 |\n| GoFrame v2 | Web 框架 |\n| MySQL / PostgreSQL | 数据库（双驱动支持） |\n| Redis | 缓存 |\n| JWT | 身份认证 |\n| WebSocket | 即时通讯 |\n| 阿里云 OSS / 七牛 / 腾讯 COS | 对象存储 |\n\n### 前端\n\n| 技术 | 说明 |\n|------|------|\n| Vue 3.5 | 渐进式框架 |\n| TypeScript 5.6 | 类型安全 |\n| Vite 7 | 构建工具 |\n| Element Plus | UI 组件库 |\n| Tailwind CSS 4 | 原子化 CSS |\n| Pinia 3 | 状态管理 |\n| ECharts 6 | 数据可视化 |\n| vue-i18n | 国际化 |\n\n## 浏览器兼容性\n\n支持 Chrome、Edge、Firefox、Safari、Opera 等现代浏览器（ES2015+）。\n\n## 开源协议\n\n本项目基于 **Apache 2.0** 协议开源，无需授权即可商业使用。	XYGo Admin	36	100	1	1	["介绍","技术栈"]	1	1	1739980800	1771508132	0
5	105	常见问题	faq		开发过程中常见问题的解答汇总	# 常见问题\n\n## 启动相关\n\n### Q: 后端启动报 "database connection failed"\n\n请检查：\n1. 数据库服务是否已启动\n2. `config.yaml` 中的数据库连接信息是否正确\n3. 数据库用户是否有访问权限\n4. 如果使用 PostgreSQL，确认连接字符串格式为 `pgsql:user:pass@tcp(host:port)/dbname`\n\n### Q: 前端启动报 "port 5173 is already in use"\n\n端口被占用，可以修改 `vite.config.ts` 中的端口，或关闭占用端口的进程：\n\n```bash\n# Windows\nnetstat -ano | findstr :5173\ntaskkill /PID <pid> /F\n\n# Linux/Mac\nlsof -i :5173\nkill -9 <pid>\n```\n\n### Q: `gf gen dao` 报错\n\n确认 `server/hack/config.yaml` 中的数据库连接配置正确，且 GoFrame CLI 版本与项目匹配：\n\n```bash\ngf version\n# 建议 >= v2.7\n```\n\n## 开发相关\n\n### Q: 新增的接口 404\n\n检查以下几点：\n1. API 定义文件中的 `g.Meta` tag 路径是否正确\n2. Controller 是否已在 `cmd.go` 中注册到对应路由组\n3. 后端是否已重启（Go 不支持热更新）\n\n### Q: 前端页面空白，控制台无报错\n\n可能原因：\n1. 路由未正确配置，检查菜单数据中的 `component` 路径\n2. 动态路由未加载，确认用户角色有该菜单权限\n3. 组件文件路径大小写不匹配（Linux 区分大小写）\n\n### Q: 上传文件失败\n\n1. 检查 `sys_config` 表中 `oss` 分组的配置\n2. 确认上传目录有写入权限\n3. 检查文件大小是否超过限制\n4. 如使用云存储，确认 AccessKey 配置正确\n\n## 部署相关\n\n### Q: 生产环境接口跨域\n\n在 Nginx 中配置反向代理，将 API 请求转发到后端服务：\n\n```nginx\nlocation /admin/ {\n    proxy_pass http://127.0.0.1:8000;\n    proxy_set_header Host $host;\n    proxy_set_header X-Real-IP $remote_addr;\n}\n```\n\n### Q: WebSocket 连接失败\n\nNginx 需要额外配置 WebSocket 支持：\n\n```nginx\nlocation /socket/ {\n    proxy_pass http://127.0.0.1:8000;\n    proxy_http_version 1.1;\n    proxy_set_header Upgrade $http_upgrade;\n    proxy_set_header Connection "upgrade";\n}\n```\n\n### Q: 前端打包后页面刷新 404\n\n项目默认使用 Hash 路由模式（URL 带 `#`），不会出现此问题。如果切换为 History 模式，需要在 Nginx 中配置：\n\n```nginx\nlocation / {\n    try_files $uri $uri/ /index.html;\n}\n```	XYGo Admin	3	60	1	0	["FAQ","问题"]	1	1	1739980800	1771501324	0
9	204	权限管理	permission		RBAC 角色权限 + 按钮级权限 + 字段级权限的完整体系	# 权限管理\n\nXYGo Admin 实现了三级权限控制体系，从粗到细覆盖所有场景。\n\n## 一、角色权限（RBAC）\n\n基于角色的访问控制，管理员通过角色关联菜单权限。\n\n### 角色类型\n\n| 角色标识 | 说明 |\n|---------|------|\n| R_SUPER | 超级管理员，拥有所有权限，不受权限校验限制 |\n| R_ADMIN | 普通管理员，权限由分配的菜单决定 |\n| 自定义 | 可创建任意角色并分配菜单权限 |\n\n### 权限分配流程\n\n1. 创建角色\n2. 为角色分配菜单（勾选菜单树）\n3. 将角色分配给用户\n4. 用户登录后，后端返回该角色可访问的菜单列表\n5. 前端根据菜单列表动态注册路由\n\n## 二、按钮级权限\n\n精确控制页面中每个操作按钮的显隐。\n\n### 后端配置\n\n在菜单管理中，为页面菜单添加「按钮」类型的子节点：\n\n- 菜单类型：按钮\n- 权限标识：如 `add`、`edit`、`delete`、`export`\n\n### 前端使用\n\n通过 `v-auth` 指令控制按钮显隐：\n\n```vue\n<template>\n  <!-- 只有拥有 add 权限的角色才能看到此按钮 -->\n  <ElButton v-auth="'add'" type="primary">新增</ElButton>\n  \n  <!-- 多个权限（满足其一即可） -->\n  <ElButton v-auth="['edit', 'update']" type="primary">编辑</ElButton>\n</template>\n```\n\n`v-auth` 指令的工作原理：\n1. 从当前路由的 `meta.authList` 中获取权限列表\n2. 判断用户是否拥有指定权限\n3. 无权限则从 DOM 中移除该元素\n\n### 角色指令\n\n通过 `v-roles` 指令按角色控制：\n\n```vue\n<template>\n  <!-- 只有超级管理员可见 -->\n  <div v-roles="'R_SUPER'">超级管理员专属内容</div>\n</template>\n```\n\n## 三、字段级权限\n\n控制数据字段的可见性和可编辑性，适用于敏感数据保护。\n\n### 配置方式\n\n在后台「字段权限」管理中：\n1. 选择目标模块（如用户管理）\n2. 配置每个字段对不同角色的权限：\n   - **可见**：该角色可以看到此字段\n   - **可编辑**：该角色可以修改此字段\n   - **隐藏**：该角色看不到此字段\n\n### 后端实现\n\n通过 `admin_field_perm` 表存储字段权限配置，在查询和更新时自动过滤字段。\n\n## 权限校验流程\n\n```\n请求到达\n  → AdminAuth 中间件\n    → 解析 JWT Token\n      → 获取用户角色\n        → R_SUPER？直接放行\n        → 检查请求路径是否在角色菜单权限中\n          → 有权限：继续处理\n          → 无权限：返回 403\n```	XYGo Admin	2	70	1	0	["权限","RBAC"]	1	1	1739980800	1771501724	0
8	203	菜单与路由	menu-route		动态菜单加载、路由权限控制与前后台双路由体系	# 菜单与路由\n\n## 双路由体系\n\nXYGo Admin 采用前台 + 后台双路由体系，完全隔离：\n\n| 路由 | 前缀 | 模式 | 说明 |\n|------|------|------|------|\n| 前台门户 | `/` | 静态注册 | 首页、文档、社区、会员中心 |\n| 后台管理 | `/admin` | 动态加载 | 根据角色权限动态注册 |\n\n## 前台路由\n\n前台路由在 `router/frontend/` 中静态定义，使用独立的 `FrontendLayout` 布局：\n\n```typescript\n// router/frontend/index.ts\nconst frontendRoutes = [\n  { path: '/', component: FrontendLayout, children: [\n    { path: '', name: 'Home', component: () => import('@/views/frontend/index/index.vue') },\n    { path: 'docs', name: 'Docs', component: () => import('@/views/frontend/docs/index.vue') },\n    { path: 'community', name: 'Community', component: () => import('@/views/frontend/community/index.vue') },\n    { path: 'cases', name: 'Cases', component: () => import('@/views/frontend/cases/index.vue') },\n  ]}\n]\n```\n\n## 后台动态路由\n\n后台路由在用户首次访问 `/admin/*` 时从后端获取菜单数据并动态注册。\n\n### 加载流程\n\n```\n用户访问 /admin/dashboard\n  → beforeEach 路由守卫\n    → 检查是否已登录（Token 存在）\n      → 检查动态路由是否已注册\n        → 未注册：调用后端接口获取菜单列表\n          → RouteTransformer 转换为 Vue Router 路由\n            → RouteRegistry 动态注册路由\n              → 跳转目标页面\n```\n\n### 菜单数据结构\n\n后端返回的菜单数据：\n\n```json\n{\n  "id": 1,\n  "pid": 0,\n  "title": "系统管理",\n  "icon": "ri:settings-3-line",\n  "path": "/system",\n  "component": "LAYOUT",\n  "type": 1,\n  "children": [\n    {\n      "id": 2,\n      "pid": 1,\n      "title": "用户管理",\n      "path": "user",\n      "component": "/system/user/index",\n      "authList": ["add", "edit", "delete"]\n    }\n  ]\n}\n```\n\n### 路由核心工具\n\n| 工具类 | 职责 |\n|--------|------|\n| `RouteRegistry` | 动态路由注册与卸载 |\n| `ComponentLoader` | 组件懒加载 |\n| `RouteValidator` | 路由合法性验证 |\n| `RouteTransformer` | 菜单数据 → Vue 路由转换 |\n| `MenuProcessor` | 菜单数据处理 |\n| `RoutePermissionValidator` | 路由权限校验 |\n| `IframeRouteManager` | Iframe 页面路由管理 |\n\n## 路由守卫\n\n### beforeEach（前置守卫）\n\n1. 白名单页面直接放行（登录、注册、前台页面）\n2. 未登录跳转登录页\n3. 已登录但未加载动态路由 → 加载菜单并注册\n4. 权限校验\n\n### afterEach（后置守卫）\n\n- 更新页面标题\n- 关闭加载进度条	XYGo Admin	3	80	1	0	["菜单","路由","权限"]	1	1	1739980800	1771501732	0
11	206	构建与部署	deploy		生产环境构建、Nginx 配置与 Docker 部署指南	# 构建与部署\n\n## 前端构建\n\n```bash\ncd web\n\n# 构建生产版本\npnpm build\n```\n\n构建产物输出到 `web/dist/` 目录。构建配置：\n- Target: ES2015\n- 压缩：Terser（自动移除 console 和 debugger）\n- Gzip：vite-plugin-compression 自动生成 .gz 文件\n- Chunk 警告阈值：2000KB\n\n## 后端构建\n\n```bash\ncd server\n\n# 编译为可执行文件\ngo build -o xygoadmin main.go\n\n# 或使用 GoFrame CLI\ngf build\n```\n\n## Nginx 配置\n\n```nginx\nserver {\n    listen 80;\n    server_name your-domain.com;\n\n    # 前端静态文件\n    location / {\n        root /var/www/xygoadmin/dist;\n        index index.html;\n        try_files $uri $uri/ /index.html;\n    }\n\n    # 后台 API 代理\n    location /admin/ {\n        proxy_pass http://127.0.0.1:8000;\n        proxy_set_header Host $host;\n        proxy_set_header X-Real-IP $remote_addr;\n        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n        proxy_set_header X-Forwarded-Proto $scheme;\n    }\n\n    # 会员 API 代理\n    location /member/ {\n        proxy_pass http://127.0.0.1:8000;\n        proxy_set_header Host $host;\n        proxy_set_header X-Real-IP $remote_addr;\n    }\n\n    # 前台公共 API\n    location /site/ {\n        proxy_pass http://127.0.0.1:8000;\n        proxy_set_header Host $host;\n        proxy_set_header X-Real-IP $remote_addr;\n    }\n\n    # 系统接口\n    location /system/ {\n        proxy_pass http://127.0.0.1:8000;\n    }\n\n    # 验证码\n    location /captcha/ {\n        proxy_pass http://127.0.0.1:8000;\n    }\n\n    # 附件访问\n    location /attachment/ {\n        proxy_pass http://127.0.0.1:8000;\n    }\n\n    # WebSocket\n    location /socket/ {\n        proxy_pass http://127.0.0.1:8000;\n        proxy_http_version 1.1;\n        proxy_set_header Upgrade $http_upgrade;\n        proxy_set_header Connection "upgrade";\n        proxy_read_timeout 86400;\n    }\n\n    # Gzip\n    gzip on;\n    gzip_types text/plain text/css application/json application/javascript text/xml;\n    gzip_min_length 1024;\n}\n```\n\n## Docker 部署\n\n### Dockerfile（后端）\n\n```dockerfile\nFROM golang:1.24-alpine AS builder\nWORKDIR /app\nCOPY server/ .\nRUN go build -o xygoadmin main.go\n\nFROM alpine:latest\nWORKDIR /app\nCOPY --from=builder /app/xygoadmin .\nCOPY --from=builder /app/manifest/config/ ./manifest/config/\nEXPOSE 8000\nCMD ["./xygoadmin"]\n```\n\n### docker-compose.yml\n\n```yaml\nversion: '3.8'\nservices:\n  app:\n    build: .\n    ports:\n      - "8000:8000"\n    depends_on:\n      - db\n      - redis\n    environment:\n      - GF_GCFG_FILE=config.yaml\n\n  db:\n    image: postgres:15\n    environment:\n      POSTGRES_DB: xygoadmin\n      POSTGRES_PASSWORD: 123456\n    volumes:\n      - pgdata:/var/lib/postgresql/data\n\n  redis:\n    image: redis:7-alpine\n    ports:\n      - "6379:6379"\n\nvolumes:\n  pgdata:\n```\n\n## 进程管理\n\n生产环境建议使用 systemd 或 supervisor 管理后端进程：\n\n```ini\n# /etc/systemd/system/xygoadmin.service\n[Unit]\nDescription=XYGo Admin Server\nAfter=network.target\n\n[Service]\nType=simple\nUser=www\nWorkingDirectory=/var/www/xygoadmin/server\nExecStart=/var/www/xygoadmin/server/xygoadmin\nRestart=always\nRestartSec=5\n\n[Install]\nWantedBy=multi-user.target\n```	XYGo Admin	1	50	1	0	["部署","Docker","Nginx"]	1	1	1739980800	1771500836	0
13	302	状态管理	state-management		Pinia 3 状态管理与持久化策略	# 状态管理\n\n## 概述\n\n项目使用 **Pinia 3** + **pinia-plugin-persistedstate** 进行状态管理，Store 文件位于 `web/src/store/modules/`。\n\n## 核心 Store\n\n| Store | 文件 | 说明 |\n|-------|------|------|\n| useUserStore | `modules/user.ts` | 后台管理员状态（Token、用户信息、语言、锁屏） |\n| useMemberStore | `modules/member.ts` | 前台会员状态（独立 Token、会员信息） |\n| useSiteStore | `modules/site.ts` | 站点信息（站名、Logo、主题色、ICP） |\n| useMenuStore | `modules/menu.ts` | 后台菜单状态 |\n| useSettingStore | `modules/setting.ts` | 系统设置（主题、布局、颜色） |\n| useWorktabStore | `modules/worktab.ts` | 工作标签页状态 |\n| useTableStore | `modules/table.ts` | 表格配置状态 |\n| useMemberMenuStore | `modules/memberMenu.ts` | 前台会员菜单 |\n\n## 使用示例\n\n```typescript\nimport { useUserStore } from '@/store/modules/user'\n\nconst userStore = useUserStore()\n\n// 读取状态\nconsole.log(userStore.token)\nconsole.log(userStore.userInfo)\n\n// 修改状态\nuserStore.setToken('new-token')\nuserStore.setUserInfo({ username: 'admin' })\n\n// 清除状态（登出）\nuserStore.logout()\n```\n\n## 持久化策略\n\n使用 `StorageKeyManager` 生成版本化存储键：\n\n```\n格式：sys-v{version}-{storeId}\n示例：sys-v3.0-user\n```\n\n支持跨版本数据迁移，版本升级时自动清理旧数据。\n\n```typescript\n// store/index.ts\nimport { createPinia } from 'pinia'\nimport piniaPluginPersistedstate from 'pinia-plugin-persistedstate'\n\nconst pinia = createPinia()\npinia.use(piniaPluginPersistedstate)\n```\n\n## 前后台 Token 隔离\n\n- 后台管理员 Token 存储在 `useUserStore`，通过 `Authorization: Bearer` 传递\n- 前台会员 Token 存储在 `useMemberStore`，通过 `Xy-User-Token` Header 传递\n- 两套 Token 完全独立，互不影响	XYGo Admin	1	90	1	0	["Pinia","状态管理"]	1	1	1739980800	1771500867	0
14	303	图标使用	icon-usage		ArtSvgIcon 组件与 Remix Icon 图标库使用指南	# 图标使用\n\n## 图标体系\n\n项目基于 **Iconify** 生态，统一使用 **Remix Icon** 图标库，通过 `ArtSvgIcon` 组件引用。\n\n## 基本用法\n\n```vue\n<template>\n  <!-- 基础用法 -->\n  <ArtSvgIcon icon="ri:home-line" />\n\n  <!-- 设置大小和颜色 -->\n  <ArtSvgIcon icon="ri:settings-3-line" class="text-2xl text-blue-500" />\n\n  <!-- 在按钮中使用 -->\n  <ElButton type="primary">\n    <ArtSvgIcon icon="ri:add-line" class="text-sm mr-1" />\n    新增\n  </ElButton>\n</template>\n```\n\n## 图标命名规则\n\nRemix Icon 的命名格式：`ri:{name}-{style}`\n\n| 风格 | 后缀 | 示例 |\n|------|------|------|\n| 线性 | `-line` | `ri:home-line` |\n| 填充 | `-fill` | `ri:home-fill` |\n\n## 查找图标\n\n- [Remix Icon 官网](https://remixicon.com/) — 搜索和预览\n- [Iconify 图标集](https://icones.js.org/collection/ri) — 在线浏览\n\n## 支持的图标库\n\n除了 Remix Icon，项目还支持：\n\n| 图标库 | 前缀 | 说明 |\n|--------|------|------|\n| Remix Icon | `ri:` | 主图标库（推荐） |\n| SVG Spinners | `svg-spinners:` | 加载动画图标 |\n| Material Line | `line-md:` | Material 风格动画图标 |\n\n```vue\n<!-- 加载动画 -->\n<ArtSvgIcon icon="svg-spinners:3-dots-fade" class="text-2xl" />\n\n<!-- Material 动画图标 -->\n<ArtSvgIcon icon="line-md:phone-call-twotone-loop" class="text-2xl" />\n```\n\n## 离线模式\n\n内网环境下，可以启用离线图标加载。编辑 `utils/ui/iconify-loader.ts`：\n\n```typescript\nimport { addCollection } from '@iconify/vue'\nimport riIcons from '@iconify-json/ri/icons.json'\n\naddCollection(riIcons)\n```\n\n需要先安装图标集包：\n\n```bash\npnpm add -D @iconify-json/ri\n```	XYGo Admin	1	80	1	0	["图标","Remix Icon"]	1	1	1739980800	1771500874	0
2	102	快速上手	quick-start		从零开始搭建开发环境，5 分钟启动项目	# 快速上手\n\n## 环境准备\n\n在开始之前，请确保你的开发环境已安装以下工具：\n\n| 工具 | 版本要求 | 说明 |\n|------|---------|------|\n| Go | >= 1.22 | 后端运行环境 |\n| Node.js | >= 18 | 前端运行环境 |\n| pnpm | >= 8 | 包管理器（推荐） |\n| MySQL 或 PostgreSQL | MySQL >= 5.7 / PG >= 12 | 数据库 |\n| Redis | >= 6 | 缓存服务 |\n| Git | 最新版 | 版本控制 |\n\n## 获取代码\n\n```bash\n# 克隆仓库\ngit clone https://github.com/your-org/xygoadmin.git\ncd xygoadmin\n```\n\n## 数据库配置\n\n### 1. 创建数据库\n\n```sql\n-- MySQL\nCREATE DATABASE xygoadmin DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;\n\n-- PostgreSQL\nCREATE DATABASE xygoadmin WITH ENCODING 'UTF8';\n```\n\n### 2. 导入建表脚本\n\n根据你使用的数据库类型，执行对应的 SQL 文件：\n\n```bash\n# MySQL\nmysql -u root -p xygoadmin < mysql_install.sql\n\n# PostgreSQL\npsql -U postgres -d xygoadmin -f pgsql_install.sql\n```\n\n### 3. 修改配置文件\n\n编辑 `server/manifest/config/config.yaml`，配置数据库连接信息：\n\n```yaml\ndatabase:\n  default:\n    link: "pgsql:postgres:123456@tcp(127.0.0.1:5432)/xygoadmin"\n    # 或 MySQL:\n    # link: "mysql:root:123456@tcp(127.0.0.1:3306)/xygoadmin"\n```\n\n## 启动后端\n\n```bash\ncd server\n\n# 安装 GoFrame CLI（首次）\ngo install github.com/gogf/gf/cmd/gf/v2@latest\n\n# 启动服务\ngf run main.go\n```\n\n服务默认运行在 `http://localhost:8000`。\n\n## 启动前端\n\n```bash\ncd web\n\n# 安装依赖\npnpm install\n\n# 启动开发服务器\npnpm dev\n```\n\n浏览器会自动打开 `http://localhost:5173`。\n\n## 默认账号\n\n| 角色 | 账号 | 密码 |\n|------|------|------|\n| 超级管理员 | admin | 123456 |\n\n## 常用命令\n\n```bash\n# 生成 DAO 代码\ngf gen dao\n\n# 生成 Service 接口\ngf gen service\n\n# 前端构建\npnpm build\n\n# 前端代码检查\npnpm lint\n```\n\n> **提示**：如果遇到问题，请查看 [常见问题](/docs/faq) 章节。	XYGo Admin	7	90	1	0	["安装","入门"]	1	1	1739980800	1771501402	0
26	501	会员管理	member-manage		会员 CRUD、分组管理与会员菜单配置	# 会员管理\n\n## 功能概览\n\n会员系统独立于后台管理员体系，拥有独立的认证、菜单和权限。\n\n### 后台管理功能\n\n| 功能 | 路径 | 说明 |\n|------|------|------|\n| 会员列表 | 会员管理 → 会员列表 | 会员 CRUD、状态管理 |\n| 会员分组 | 会员管理 → 会员分组 | 分组管理（如普通会员、VIP） |\n| 会员菜单 | 会员管理 → 会员菜单 | 前台会员中心的菜单配置 |\n| 登录日志 | 会员管理 → 登录日志 | 会员登录记录 |\n| 积分日志 | 会员管理 → 积分日志 | 积分变动记录 |\n| 资金日志 | 会员管理 → 资金日志 | 余额变动记录 |\n| 会员通知 | 会员管理 → 会员通知 | 站内通知管理 |\n\n## 会员数据结构\n\n`member` 表核心字段：\n\n| 字段 | 说明 |\n|------|------|\n| username | 用户名 |\n| password / salt | 密码 + 盐值 |\n| real_name | 真实姓名 |\n| mobile / email | 手机号 / 邮箱 |\n| avatar | 头像 |\n| group_id | 所属分组 |\n| score | 积分 |\n| money | 余额 |\n| status | 状态（正常/禁用） |\n| last_login_at | 最后登录时间 |\n\n## 会员分组\n\n通过分组实现会员等级管理：\n- 每个分组可配置名称、图标、排序\n- 会员只能属于一个分组\n- 可按分组筛选会员列表\n\n## 会员菜单\n\n前台会员中心的导航菜单通过后台配置，支持：\n- 树形菜单结构\n- 图标配置\n- 路由路径配置\n- 排序和显隐控制	XYGo Admin	1	100	1	0	["会员","管理"]	1	1	1739980800	1771501735	0
\.


--
-- Data for Name: xy_cms_doc_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_cms_doc_category (id, pid, title, icon, sort, status, remark, created_at, updated_at) FROM stdin;
1	0	起步	ri:rocket-line	100	1	入门指南，帮助快速了解和使用系统	1739980800	1739980800
2	0	进阶	ri:compass-3-line	90	1	深入了解系统架构与核心机制	1739980800	1739980800
3	0	WEB端专项	ri:layout-masonry-line	80	1	前端开发相关文档	1739980800	1739980800
4	0	Server端专项	ri:server-line	70	1	GoFrame 后端开发相关文档	1739980800	1739980800
5	0	会员系统	ri:user-star-line	60	1	会员模块功能与开发文档	1739980800	1739980800
6	0	安装帮助	ri:install-line	50	1	各平台安装部署指南	1739980800	1739980800
101	1	项目介绍	ri:information-line	100	1	技术栈、核心特色、在线演示	1739980800	1739980800
102	1	快速上手	ri:flashlight-line	90	1	环境准备、克隆代码、启动项目	1739980800	1739980800
103	1	开发者必读	ri:book-read-line	80	1	项目架构、开发规范、注意事项	1739980800	1739980800
104	1	CRUD代码生成	ri:code-box-line	70	1	代码生成器使用教程	1739980800	1739980800
105	1	常见问题	ri:question-answer-line	60	1	FAQ 汇总	1739980800	1739980800
201	2	目录结构	ri:folder-open-line	100	1	server/ 和 web/ 完整目录说明	1739980800	1739980800
202	2	后台交互流程	ri:exchange-line	90	1	前后端请求流程、JWT认证、接口规范	1739980800	1739980800
203	2	菜单与路由	ri:route-line	80	1	动态菜单、路由权限、双路由体系	1739980800	1739980800
204	2	权限管理	ri:shield-keyhole-line	70	1	RBAC + 按钮级 + 字段级权限	1739980800	1739980800
205	2	国际化	ri:translate-2	60	1	vue-i18n 多语言配置	1739980800	1739980800
206	2	构建与部署	ri:upload-cloud-2-line	50	1	生产构建、Nginx、Docker 部署	1739980800	1739980800
301	3	网络请求	ri:send-plane-line	100	1	adminRequest / siteRequest 封装	1739980800	1739980800
302	3	状态管理	ri:database-2-line	90	1	Pinia Store 使用规范	1739980800	1739980800
303	3	图标使用	ri:remixicon-line	80	1	ArtSvgIcon + Remix Icon 用法	1739980800	1739980800
304	3	表格组件	ri:table-line	70	1	ArtTable / ArtTableHeader 使用	1739980800	1739980800
305	3	表单组件	ri:file-list-3-line	60	1	Element Plus 表单最佳实践	1739980800	1739980800
306	3	CSS与样式	ri:palette-line	50	1	Tailwind CSS + Clay 拟态阴影体系	1739980800	1739980800
307	3	内置组件库	ri:puzzle-line	40	1	富文本、图片上传、图标选择器等	1739980800	1739980800
401	4	GoFrame基础	ri:terminal-box-line	100	1	gf 框架核心概念与配置	1739980800	1739980800
402	4	控制器开发	ri:gamepad-line	90	1	Controller 编写规范	1739980800	1739980800
403	4	业务逻辑层	ri:git-merge-line	80	1	Logic / Service 层开发	1739980800	1739980800
404	4	数据库操作	ri:database-line	70	1	DAO / Entity / DO 三层模型	1739980800	1739980800
405	4	文件上传	ri:upload-2-line	60	1	多云存储（本地/OSS/七牛/COS）	1739980800	1739980800
406	4	定时任务	ri:timer-line	50	1	Cron 任务配置与开发	1739980800	1739980800
407	4	WebSocket	ri:chat-3-line	40	1	即时聊天模块开发	1739980800	1739980800
501	5	会员管理	ri:user-settings-line	100	1	会员 CRUD、分组管理	1739980800	1739980800
502	5	会员认证	ri:lock-line	90	1	登录注册、JWT Token	1739980800	1739980800
503	5	积分与资金	ri:coin-line	80	1	积分日志、资金日志	1739980800	1739980800
504	5	签到系统	ri:calendar-check-line	70	1	每日签到功能	1739980800	1739980800
601	6	Windows安装	ri:windows-line	100	1	Go + Node + MySQL 环境搭建	1739980800	1739980800
602	6	Linux安装	ri:ubuntu-line	90	1	生产环境部署指南	1739980800	1739980800
603	6	数据库配置	ri:database-2-line	80	1	MySQL / PostgreSQL 双数据库支持	1739980800	1739980800
604	6	常见安装问题	ri:error-warning-line	70	1	端口冲突、依赖安装失败等	1739980800	1739980800
\.


--
-- Data for Name: xy_community_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_community_category (id, title, icon, sort, status, created_at, updated_at) FROM stdin;
1	前端开发	ri:html5-line	10	1	1771593151	1771593151
2	后端开发	ri:server-line	9	1	1771593151	1771593151
3	部署运维	ri:cloud-line	8	1	1771593151	1771593151
4	UI设计	ri:palette-line	7	1	1771593151	1771593151
5	综合讨论	ri:chat-smile-2-line	6	1	1771593151	1771593151
\.


--
-- Data for Name: xy_community_collect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_community_collect (id, member_id, post_id, created_at) FROM stdin;
1	1	1	1771600906
\.


--
-- Data for Name: xy_community_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_community_like (id, member_id, target_type, target_id, created_at) FROM stdin;
\.


--
-- Data for Name: xy_community_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_community_post (id, member_id, category_id, title, content, tags, views, reply_count, like_count, is_top, is_essence, status, last_reply_at, last_reply_member_id, created_at, updated_at, deleted_at, reward_score) FROM stdin;
4	1	3	Docker Compose 部署 Go + PostgreSQL + Nginx 全流程	# Docker Compose 一键部署\n\n## docker-compose.yml\n\n```yaml\nversion: "3.8"\nservices:\n  app:\n    build: .\n    ports:\n      - "8000:8000"\n    depends_on:\n      - db\n  db:\n    image: postgres:15\n    environment:\n      POSTGRES_PASSWORD: 123456\n      POSTGRES_DB: myapp\n    volumes:\n      - pgdata:/var/lib/postgresql/data\n  nginx:\n    image: nginx:alpine\n    ports:\n      - "80:80"\n    volumes:\n      - ./nginx.conf:/etc/nginx/conf.d/default.conf\nvolumes:\n  pgdata:\n```\n\n## Dockerfile\n\n```dockerfile\nFROM golang:1.21-alpine AS builder\nWORKDIR /app\nCOPY . .\nRUN go build -o server .\n\nFROM alpine:latest\nCOPY --from=builder /app/server /server\nCMD ["/server"]\n```\n\n部署遇到问题可以在下面讨论。	["Docker","部署","PostgreSQL","Nginx"]	412	7	15	0	0	1	1771592251	1	1771506751	1771592251	0	0
5	1	2	PostgreSQL 性能优化：索引策略与查询分析	# PostgreSQL 性能优化\n\n## EXPLAIN ANALYZE\n\n```sql\nEXPLAIN ANALYZE SELECT * FROM users WHERE email = 'test@example.com';\n```\n\n## 索引类型选择\n\n- B-tree：等值查询、范围查询（默认）\n- GIN：全文搜索、JSONB 查询\n- GiST：地理空间数据\n- BRIN：时序数据、大表\n\n## 常见优化手段\n\n1. 避免 `SELECT *`，只查需要的列\n2. 合理使用复合索引，注意列顺序\n3. 大表分页用 keyset pagination 替代 OFFSET\n4. 定期 `VACUUM ANALYZE`\n\n大家有什么优化经验也可以分享！	["PostgreSQL","性能优化","索引"]	178	2	8	0	0	1	1771592551	1	1771247551	1771592551	0	0
6	1	1	Tailwind CSS 响应式布局技巧分享	# Tailwind CSS 响应式布局\n\n## 断点系统\n\n```html\n<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">\n```\n\nTailwind 默认断点：\n- `sm`: 640px\n- `md`: 768px\n- `lg`: 1024px\n- `xl`: 1280px\n- `2xl`: 1536px\n\n## 容器查询\n\nTailwind v3.4+ 支持 `@container` 查询：\n\n```html\n<div class="@container">\n  <div class="@lg:grid-cols-2">\n```\n\n## 实用技巧\n\n- `max-w-7xl mx-auto` 居中容器\n- `aspect-[16/9]` 固定宽高比\n- `line-clamp-2` 文本截断	["Tailwind CSS","响应式","CSS"]	95	1	4	0	0	1	0	0	1771074751	1771074751	0	0
7	1	4	后台管理系统 UI 设计规范建议	# 后台管理系统 UI 设计规范\n\n## 色彩体系\n\n- 主色：品牌蓝 #5a8dee\n- 成功：#67c23a\n- 警告：#e6a23c\n- 危险：#f56c6c\n- 信息：#909399\n\n## 间距规范\n\n采用 4px 基准网格：4, 8, 12, 16, 24, 32, 48\n\n## 字体层级\n\n- 页面标题：20px Bold\n- 卡片标题：16px Medium\n- 正文：14px Regular\n- 辅助文字：12px Regular\n\n## 圆角\n\n- 按钮：8px\n- 卡片：12px\n- 弹窗：16px\n- 大容器：24px\n\n欢迎设计师们补充！	["UI设计","设计规范","后台管理"]	67	0	3	0	0	1	0	0	1770988351	1770988351	0	0
9	1	2	GoFrame 中间件鉴权方案对比：JWT vs Session	# JWT vs Session 鉴权\n\n## JWT 方案\n\n优点：\n- 无状态，天然支持分布式\n- 前后端分离友好\n\n缺点：\n- Token 无法主动失效\n- Payload 不宜过大\n\n## Session 方案\n\n优点：\n- 服务端可控，随时踢人\n- 安全性更高\n\n缺点：\n- 需要 Session 存储（Redis）\n- 分布式需要共享 Session\n\n## GoFrame 实践\n\nGoFrame 内置了 `ghttp.Session`，也可以用 JWT 中间件。\n\n我们项目用的是 JWT + Redis 黑名单方案，兼顾无状态和主动失效。\n\n大家用的什么方案？	["GoFrame","JWT","Session","鉴权"]	156	4	7	0	0	1	1771591951	1	1770729151	1771591951	0	0
10	1	3	GitHub Actions 自动部署到阿里云 ECS 完整配置	# GitHub Actions 自动部署\n\n## workflow 配置\n\n```yaml\nname: Deploy\non:\n  push:\n    branches: [main]\njobs:\n  deploy:\n    runs-on: ubuntu-latest\n    steps:\n      - uses: actions/checkout@v4\n      - name: Build\n        run: |\n          go build -o server .\n      - name: Deploy to ECS\n        uses: appleboy/ssh-action@v1\n        with:\n          host: ${{ secrets.HOST }}\n          username: root\n          key: ${{ secrets.SSH_KEY }}\n          script: |\n            cd /opt/app\n            ./deploy.sh\n```\n\n## deploy.sh\n\n```bash\n#!/bin/bash\nsystemctl stop myapp\ncp /tmp/server /opt/app/server\nsystemctl start myapp\n```\n\n有更好的方案欢迎分享！	["GitHub Actions","CI/CD","部署","阿里云"]	203	3	6	0	0	1	1771590751	1	1770556351	1771590751	0	0
11	1	1	Vite 热更新偶尔失效怎么排查？	用 Vite 开发 Vue3 项目，偶尔会出现修改代码后页面不刷新的情况，需要手动 F5。\n\n环境：\n- Vite 5.x\n- Vue 3.4\n- Windows 11\n\n已尝试：\n1. 清除 node_modules/.vite 缓存\n2. 关闭杀毒软件\n3. 检查文件监听数量限制\n\n还是偶发，有遇到过的吗？	["Vite","热更新","Vue3"]	42	0	1	0	0	1	0	0	1771578751	1771578751	0	0
2	1	2	GoFrame v2 路由注册机制详解	# GoFrame v2 路由注册\n\n## 约定式路由\n\nGoFrame v2 使用 `g.Meta` 标签自动注册路由：\n\n```go\ntype HelloReq struct {\n    g.Meta `path:"/hello" method:"get"`\n    Name string `v:"required"`\n}\n```\n\n## 中间件\n\n通过 `BindMiddleware` 绑定：\n\n```go\ngroup.Middleware(middleware.Auth)\ngroup.Bind(controller.NewV1())\n```\n\n## 分组\n\n建议按模块分组：admin、site、member，各自独立的认证中间件。\n\n有问题欢迎讨论！	["GoFrame","路由","Go"]	257	3	12	1	0	1	1771585951	1	1771161151	1771600685	0	0
8	1	5	新人报到！分享一下我的技术栈	# 大家好！\n\n我是一名全栈开发者，主要技术栈：\n\n## 前端\n- Vue 3 + TypeScript\n- Element Plus / Ant Design Vue\n- Tailwind CSS\n- Vite\n\n## 后端\n- Go (GoFrame)\n- PostgreSQL / MySQL\n- Redis\n\n## 运维\n- Docker + Docker Compose\n- Nginx\n- GitHub Actions CI/CD\n\n最近在学习 XYGo Admin 框架，感觉设计得很不错，希望能在社区里多交流学习！\n\n大家都用什么技术栈呢？	["新人报到","技术栈","全栈"]	235	6	11	0	0	1	1771592851	1	1770901951	1771595176	0	0
3	1	1	Element Plus 表单校验的几种高级用法	# Element Plus 表单校验进阶\n\n## 1. 自定义校验器\n\n```ts\nconst checkAge = (rule, value, callback) => {\n  if (value < 18) callback(new Error('年龄不能小于18'))\n  else callback()\n}\n```\n\n## 2. 动态表单校验\n\n使用 `v-for` 渲染的表单项，prop 需要拼接索引：\n\n```html\n<el-form-item :prop="`items.${index}.name`" :rules="nameRules">\n```\n\n## 3. 跨字段联动校验\n\n密码确认场景，在 validator 中访问 form model 的其他字段。\n\n## 4. 异步校验\n\n校验器返回 Promise，可以做接口查重等异步操作。	["Element Plus","表单校验","Vue3"]	199	5	9	0	1	1	1771594408	1	1771420351	1771598018	0	0
12	1	2	gf gen dao 生成的代码如何自定义模板？	想修改 `gf gen dao` 生成的代码模板，比如给 entity 加上自定义的方法或者接口实现。\n\n看了文档说可以用 `--tplDaoIndexContent` 之类的参数，但没找到具体的模板变量文档。\n\n有人做过自定义模板吗？求分享经验。	["GoFrame","gf gen dao","代码生成"]	28	0	0	0	0	1	0	0	1771564351	1771564351	0	0
14	1	4	Figma 设计稿导出给前端的最佳格式是什么？	团队里设计师用 Figma，前端用 Vue3 + Tailwind。\n\n目前设计师直接给 Figma 链接，前端自己量尺寸和取色。但效率不高，经常还原度有偏差。\n\n想问下大家：\n1. 设计稿用什么格式交付最高效？\n2. 有没有好用的 Figma 转代码工具？\n3. 设计 Token 怎么管理？	["Figma","设计交付","前端协作"]	19	0	0	0	0	1	0	0	1771535551	1771535551	0	0
15	1	5	XYGo Admin 的权限系统是怎么设计的？	看了 XYGo Admin 的源码，权限系统挺完善的，有菜单权限、按钮权限、数据权限。\n\n想了解一下：\n1. 前端路由权限是怎么和后端菜单关联的？\n2. 按钮级权限是怎么控制的？\n3. 数据权限（部门隔离）是在哪一层实现的？\n\n希望有大佬能详细讲讲架构设计思路。	["XYGo Admin","权限系统","架构"]	88	0	5	0	0	1	0	0	1771521151	1771521151	0	0
16	1	1	一个测试问题	就是测试	["vue3"]	0	0	0	0	0	1	0	0	1771596035	1771596035	0	0
17	1	1	发个新的帖子	啊士大夫士大夫撒地方	["我要"]	0	0	0	0	0	1	0	0	1771596889	1771596889	0	0
1	1	1	Vue3 组合式 API 最佳实践总结	# Vue3 组合式 API 最佳实践\n\n## 1. 使用 composables 抽离逻辑\n\n将可复用的逻辑抽成 `useXxx` 函数：\n\n```ts\nexport function useCounter(initial = 0) {\n  const count = ref(initial)\n  const increment = () => count.value++\n  return { count, increment }\n}\n```\n\n## 2. 响应式数据选择\n\n- 基本类型用 `ref`\n- 对象/数组用 `reactive`\n- 从 props 解构用 `toRefs`\n\n## 3. watch vs watchEffect\n\n- `watch` 惰性执行，可以拿到新旧值\n- `watchEffect` 立即执行，自动追踪依赖\n\n## 4. 生命周期\n\n推荐使用 `onMounted`、`onUnmounted` 等组合式 API 钩子，避免 Options API 混用。\n\n> 欢迎大家补充自己的实践经验！	["Vue3","组合式API","最佳实践"]	331	5	18	1	1	1	1771589551	1	1771333951	1771600916	0	0
13	1	3	Nginx 反向代理 WebSocket 连接经常断开	配置了 Nginx 反向代理 WebSocket，但连接大概 60 秒就会断开。\n\n当前配置：\n```nginx\nlocation /ws {\n    proxy_pass http://127.0.0.1:8000;\n    proxy_http_version 1.1;\n    proxy_set_header Upgrade $http_upgrade;\n    proxy_set_header Connection "upgrade";\n}\n```\n\n是不是需要加 timeout 配置？具体怎么加？	["Nginx","WebSocket","反向代理"]	41	3	2	0	0	1	1771595993	1	1771549951	1771595993	0	0
\.


--
-- Data for Name: xy_community_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_community_reply (id, post_id, member_id, parent_id, content, like_count, is_accepted, status, created_at, updated_at, deleted_at) FROM stdin;
1	1	1	0	补充一点：composables 里尽量不要直接操作 DOM，保持纯逻辑。如果需要操作 DOM，用 `useTemplateRef` 或者 `onMounted` 里处理。	3	0	1	1771513151	1771513151	0
2	1	1	0	关于 watch 和 watchEffect 的选择，我的经验是：如果需要对比新旧值做差异处理，用 watch；如果只是"某个值变了就执行副作用"，用 watchEffect 更简洁。	5	1	1	1771523151	1771523151	0
3	1	1	0	还有一个技巧：`defineExpose` 可以控制组件暴露给父组件的方法，配合 TypeScript 的 `InstanceType` 可以获得完整类型提示。	2	0	1	1771533151	1771533151	0
4	1	1	1	同意，我们项目里 composables 都是纯函数 + ref，测试也方便。	1	0	1	1771543151	1771543151	0
5	1	1	2	对的，watchEffect 在 SSR 场景下还有个好处是可以用 `onServerPrefetch` 配合。	0	0	1	1771553151	1771553151	0
6	2	1	0	GoFrame 的路由注册确实很优雅，比手动写 router.GET 之类的简洁多了。	2	0	1	1771503151	1771503151	0
7	2	1	0	请问 g.Meta 里的 tags 字段是用来做什么的？是给 Swagger 文档分组用的吗？	1	0	1	1771508151	1771508151	0
8	2	1	6	是的，tags 就是 OpenAPI 的 tag，用来在 Swagger UI 里分组显示接口。	3	1	1	1771511151	1771511151	0
9	4	1	0	补充一下 Nginx 配置里的 gzip 压缩，对前端资源加载速度提升很大。	4	0	1	1771543151	1771543151	0
10	4	1	0	建议加上健康检查，docker-compose 里用 healthcheck 确保 db 启动完成后再启动 app。	6	1	1	1771548151	1771548151	0
11	4	1	0	多阶段构建的 Dockerfile 写得很好，我们项目也是这么做的，镜像从 1.2G 缩到 20M。	2	0	1	1771553151	1771553151	0
12	8	1	0	欢迎！技术栈很全面，Go + Vue3 是现在很流行的组合。	3	0	1	1771523151	1771523151	0
13	8	1	0	我也是用 GoFrame + Vue3，感觉开发效率很高。XYGo Admin 的代码生成器特别好用。	2	0	1	1771528151	1771528151	0
14	9	1	0	我们用的 JWT + Redis 方案，Token 过期时间设 2 小时，刷新 Token 7 天。	3	0	1	1771533151	1771533151	0
15	9	1	0	Session 方案在单体应用里更简单，但如果后面要做微服务，JWT 更合适。	1	0	1	1771538151	1771538151	0
16	3	1	0	鲤鱼是会跑酷吗	0	0	1	1771594408	1771594408	0
17	13	1	0	是吗	0	0	1	1771595253	1771595253	0
18	13	1	0	真的	0	0	1	1771595377	1771595377	0
19	13	1	0	你是谁	0	0	1	1771595993	1771595993	0
\.


--
-- Data for Name: xy_community_search_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_community_search_log (id, keyword, member_id, created_at) FROM stdin;
1	GoFrame	1	1771512778
2	GoFrame	2	1771426378
3	GoFrame	0	1771339978
4	GoFrame	3	1771167178
5	Vue3	1	1771512778
6	Vue3	0	1771253578
7	Vue3	2	1771080778
8	部署	1	1771426378
9	部署	0	1770303178
10	部署	2	1769871178
11	PostgreSQL	0	1770735178
12	PostgreSQL	1	1770562378
13	PostgreSQL	3	1769439178
14	验证码	0	1770907978
15	验证码	2	1770043978
16	权限控制	1	1767711178
17	权限控制	0	1766415178
18	权限控制	2	1765551178
19	Tailwind	0	1771339978
20	登录	1	1771512778
21	登录	0	1771426378
22	权限	0	1771599308
23	权限	0	1771599343
\.


--
-- Data for Name: xy_demo_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_demo_article (id, category_id, title, cover, summary, content, author, views, sort, status, created_at, updated_at) FROM stdin;
1	3	Vue3 组合式API指南	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp			张三	100	1	1	1770653552	1770868163
2	4	GoFrame 入门教程	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp			李四	200	2	1	1770653552	1770868156
3	5	家常菜做法	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp			王五	50	3	1	1770653552	1770868145
\.


--
-- Data for Name: xy_demo_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_demo_category (id, parent_id, name, icon, sort, status, remark, created_at, updated_at) FROM stdin;
1	0	技术	ri:dashboard-fill	1	1	技术类文章	1770653552	1770812776
2	0	生活	ri:heart-line	2	1	生活类文章	1770653552	1770653552
3	1	前端	ri:html5-line	1	1	前端技术	1770653552	1770653552
4	1	后端	ri:server-line	2	1	后端技术	1770653552	1770653552
5	2	美食	ri:restaurant-line	1	1	美食分享	1770653552	1770653552
\.


--
-- Data for Name: xy_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member (id, username, password, mobile, email, nickname, avatar, gender, birthday, money, score, level, group_id, status, last_login_ip, last_login_at, login_count, created_at, updated_at, deleted_at) FROM stdin;
1	z312193608	$2a$10$ZP7cMjrRWrNJhgT3c5aJH.NC4FrXRTDnPSSS9NdzeLPBocvUTb/0q		751300685@qq.com	z312193608	/attachment/upload/20260212/cc679f09-57e9-4c35-9054-65e4afde8cd3.png	0	\N	0.00	19	1	1	1	127.0.0.1	1771594393	14	1770908432	1771599619	0
\.


--
-- Data for Name: xy_member_checkin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_checkin (id, member_id, checkin_date, score, continuous_days, created_at) FROM stdin;
1	1	\N	5	1	\N
2	1	1770910155	4	1	1770910155
3	1	1770913381	2	2	1770913381
4	1	1771488251	4	1	1771488251
5	1	1771599619	4	1	1771599619
\.


--
-- Data for Name: xy_member_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_group (id, name, rules, status, sort, remark, created_at, updated_at) FROM stdin;
1	普通会员	*	1	0	默认分组	1770908749	1770908749
2	VIP会员	1,2,3,4,5	1	10	VIP用户	1770908749	1770908749
\.


--
-- Data for Name: xy_member_login_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_login_log (id, member_id, username, ip, user_agent, status, message, created_at) FROM stdin;
1	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
2	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	0	密码错误	1770908749
3	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
4	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	0	验证码错误	1770908749
5	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
6	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
7	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
10	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	1	登录成功	1770908749
11	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
12	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	0	验证码错误	1770908749
13	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
14	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770908749
15	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	0	用户名或密码错误	1770908749
16	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	0	用户名或密码错误	1770908749
17	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	0	用户名或密码错误	1770908749
18	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	0
19	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	1	登录成功	1770909732
20	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	1	登录成功	1771485031
21	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	1	登录成功	1771487951
22	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0	1	登录成功	1771594393
\.


--
-- Data for Name: xy_member_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_menu (id, pid, title, name, path, component, icon, menu_type, url, no_login_valid, extend, remark, type, permission, sort, status, created_at, updated_at) FROM stdin;
1	0	文档	docs	/docs	docs/index	ri:book-open-line	tab		1	none		nav		10	1	\N	\N
2	0	案例	cases	/cases	cases/index	ri:slideshow-line	tab		1	none		nav		20	1	\N	\N
3	0	社区	community	/community	community/index	ri:discuss-line	tab		1	none		nav		30	1	\N	\N
4	0	我的账户	account	/user		ri:user-line	tab		0	none		menu_dir		100	1	\N	\N
5	4	账户概览	overview	/user/overview	member/center	ri:home-4-line	tab		0	none		menu		101	1	\N	\N
6	4	每日签到	checkin	/user/checkin	member/center	ri:calendar-check-line	tab		0	none		menu		102	1	\N	\N
7	4	个人资料	profile	/user/profile	member/center	ri:user-line	tab		0	none		menu		103	1	\N	\N
8	4	修改密码	password	/user/password	member/center	ri:shield-keyhole-line	tab		0	none		menu		104	1	\N	\N
9	4	积分记录	points	/user/points	member/center	ri:copper-coin-line	tab		0	none		menu		105	1	\N	\N
10	4	余额记录	balance	/user/balance	member/center	ri:wallet-3-line	tab		0	none		menu		106	1	\N	\N
11	4	系统通知	notification	/user/notification	member/center	ri:notification-3-line	tab		0	none		menu		107	1	\N	\N
20	0	我的社区	my-community	/user/community		ri:discuss-line	tab		0	none		menu_dir		110	1	1771600839	1771600839
21	20	我的帖子	my-posts	/user/my-posts	member/center	ri:file-text-line	tab		0	none		menu		111	1	1771600839	1771600839
22	20	我的回复	my-replies	/user/my-replies	member/center	ri:chat-3-line	tab		0	none		menu		112	1	1771600839	1771600839
23	20	我的收藏	my-collects	/user/my-collects	member/center	ri:bookmark-line	tab		0	none		menu		113	1	1771600839	1771600839
\.


--
-- Data for Name: xy_member_money_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_money_log (id, member_id, money, before, after, memo, created_at) FROM stdin;
\.


--
-- Data for Name: xy_member_notice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_notice (id, title, content, type, target, target_id, sender, status, created_at) FROM stdin;
1	欢迎使用 XYGo Admin	感谢您注册成为我们的会员！您可以在会员中心管理个人信息、查看积分和余额变动记录。每天记得签到领取积分哦！	system	all	0	系统	1	1770908749
2	每日签到功能上线	全新的每日签到功能现已上线！每日签到可获得随机积分奖励，连续签到天数越多，奖励越丰厚。快来试试吧！	feature	all	0	系统	1	1770908749
3	test a notify	<p>这是一个测试通知</p>	system	all	0	Xygo	1	1770910671
\.


--
-- Data for Name: xy_member_notice_read; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_notice_read (id, notice_id, member_id, read_at) FROM stdin;
1	2	1	\N
2	1	1	\N
3	3	1	1770910685
\.


--
-- Data for Name: xy_member_score_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_member_score_log (id, member_id, score, before, after, memo, created_at) FROM stdin;
1	1	5	0	5	每日签到奖励	1770908749
2	1	4	5	9	每日签到奖励	1770910155
3	1	2	9	11	每日签到奖励	1770913381
4	1	4	11	15	每日签到奖励	1771488251
5	1	4	15	19	每日签到奖励	1771599619
\.


--
-- Data for Name: xy_sys_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_sys_attachment (id, topic, user_id, url, width, height, name, size, mimetype, quote, storage, sha1, create_time, update_time) FROM stdin;
2	image	1	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp	0	0	单独logo (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1768618131	1768618131
3	image	1	/attachment/upload/20260210/b17249d2-0d9d-496d-a6a5-1c9c2c603459.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770710651	1770710651
4	image	1	/attachment/upload/20260210/19c3332f-d5db-44f6-bb69-c406e7f4c974.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711566	1770711566
5	image	1	/attachment/upload/20260210/5d77559d-27e2-4bec-8ed3-c4ea22f4e032.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711611	1770711611
6	image	1	/attachment/upload/20260210/e1469abb-5c58-42a1-b487-4f07d4efcfd2.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711730	1770711730
7	image	1	/attachment/upload/20260210/0a27edcc-e96c-4b2e-95f9-b69c772cde82.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711822	1770711822
8	image	1	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770738480	1770738480
\.


--
-- Data for Name: xy_sys_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_sys_config (id, "group", group_name, name, key, value, type, options, rules, sort, remark, allow_del, created_by, updated_by, create_time, update_time) FROM stdin;
1	basics	基础设置	站点名称	site_name	XYGo Admin	text	\N	{"max": 50, "required": true}	10	后台标题/LOGO文字	0	0	0	0	1770737799
2	basics	基础设置	站点副标题	site_subtitle	下一代 GoFrame 管理后台	text	\N	{"max": 100}	11	登录页/浏览器标题副文案	0	0	0	0	1770737799
3	basics	基础设置	ICP备案号	site_icp	粤ICP备000000号	text	\N	{"max": 50}	20	展示在页脚的备案号	0	0	0	0	1770737799
4	basics	基础设置	站点时区	site_timezone	Asia/Shanghai	select	{"options": [{"label": "上海(Asia/Shanghai)", "value": "Asia/Shanghai"}, {"label": "UTC", "value": "UTC"}]}	{"required": true}	30	影响时间显示/日志默认时区	0	0	0	0	1770737799
5	basics	基础设置	是否关闭站点	site_closed	0	switch	\N	{"required": true}	40	1=关闭，0=正常访问	0	0	0	0	1770737799
6	mail	邮件配置	SMTP 主机	smtp_host	smtp.example.com	text	\N	{"required": true}	10	邮件服务器地址	0	0	0	0	0
7	mail	邮件配置	SMTP 端口	smtp_port	465	number	\N	{"required": true}	20	常见为 25/465/587	0	0	0	0	0
8	mail	邮件配置	SSL 加密	smtp_secure	1	switch	\N	{"required": true}	30	1=启用 SSL，0=关闭	0	0	0	0	0
9	mail	邮件配置	发件人邮箱	smtp_user	noreply@example.com	text	\N	{"required": true}	40	用作登录用户名/From 地址	0	0	0	0	0
10	mail	邮件配置	发件邮箱密码	smtp_pass		text	\N	{"required": true}	50	SMTP 授权码或密码	0	0	0	0	0
11	oss	对象存储	存储驱动	oss_driver	local	select	{"options": [{"label": "本地", "value": "local"}, {"label": "阿里云OSS", "value": "oss"}, {"label": "七牛云", "value": "qiniu"}, {"label": "腾讯云cos", "value": "cos"}]}	{"required": true}	10	附件实际保存到哪里	0	0	0	0	0
13	security	安全设置	禁止访问 IP 列表	forbidden_ips	["127.0.0.1"]	textarea	\N	\N	10	每行一个 IP，支持 CIDR，示例：192.168.0.1 或 10.0.0.0/24	0	0	0	0	0
14	security	安全设置	登录失败锁定次数	login_fail_max	5	number	\N	{"required": true}	20	超过此次数可触发验证码/锁定策略	0	0	0	0	0
15	security	安全设置	登录验证码开关	login_captcha	1	switch	\N	{"required": true}	30	1=开启验证码，0=关闭	0	0	0	0	0
16	basics	基础设置	站点说明	site_description	这里是站点的简介文案，支持多行文本，用于 SEO 描述等。	textarea	\N	{"max": 300}	50	站点的详细介绍，前台可用作描述	0	0	0	0	1770737799
17	basics	基础设置	主题主色调	theme_color	#409EFF	color	{"showAlpha": false}	\N	60	前端主题主色，后续可用来生成主题变量	0	0	0	0	1770737799
18	basics	基础设置	站点 LOGO	site_logo	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp	image	{"tip": "建议 200x200 PNG", "limit": 1, "accept": "image/*"}	\N	70	后台左上角 LOGO 图片	0	0	0	0	1770737799
19	security	安全设置	密码强度要求	password_level	medium	radio	{"options": [{"label": "宽松", "value": "low"}, {"label": "中等", "value": "medium"}, {"label": "严格", "value": "high"}]}	{"required": true}	40	影响密码最小长度、复杂度校验等	0	0	0	0	0
20	security	安全设置	登录防护策略	login_protect	["ip_limit"]	checkbox	{"options": [{"label": "限制 IP 白名单", "value": "ip_limit"}, {"label": "启用登录验证码", "value": "captcha"}, {"label": "限制同账号多地登录", "value": "multi_login_limit"}]}	\N	50	多选组合策略，后续中间件可按值启用对应防护	0	0	0	0	0
23	basics	基础设置	示例三维数组	sample_array_3d	[{"name":"张三","role":"admin","tags":["vue","react"],"avatar":"https://example.com/avatars/zhangsan.jpg"},{"name":"李四","role":"user","tags":["react"],"avatar":"https://example.com/avatars/lisi.jpg"}]	array	{"fields": [{"key": "name", "type": "text", "label": "姓名", "placeholder": "请输入姓名"}, {"key": "role", "type": "select", "label": "角色", "options": [{"label": "管理员", "value": "admin"}, {"label": "用户", "value": "user"}, {"label": "访客", "value": "guest"}], "placeholder": "请选择角色"}, {"key": "tags", "type": "selects", "label": "标签", "options": [{"label": "Vue", "value": "vue"}, {"label": "React", "value": "react"}, {"label": "Angular", "value": "angular"}], "placeholder": "请选择标签"}, {"key": "avatar", "type": "image", "label": "头像", "maxSize": 5}]}	\N	99	用于测试多维数组渲染（可在高级 JSON 模式查看）	0	0	0	0	1770737799
24	security	安全设置	登录验证码模式	login_captcha_mode	qrcode	select	{"options": [{"label": "短信", "value": "sms"}, {"label": "邮箱", "value": "email"}, {"label": "二维码", "value": "qrcode"}]}	\N	120	单选下拉示例	0	0	0	0	0
25	security	安全设置	登录防护策略（多选）	login_protect_multi	["ip_limit","captcha","multi_login_limit"]	selects	{"options": [{"label": "限制 IP 白名单", "value": "ip_limit"}, {"label": "启用验证码", "value": "captcha"}, {"label": "限制同账号多地登录", "value": "multi_login_limit"}], "multiple": true}	\N	130	多选下拉示例	0	0	0	0	0
26	basics	基础设置	站点富文本	site_richtext	<p>测试服务这回可以了吧真的好厉害</p>	editor	{"mode": "default", "height": "360px", "placeholder": "请输入站点介绍...", "toolbarKeys": ["headerSelect", "bold", "underline", "italic", "through", "color", "bgColor", "link", "bulletedList", "numberedList", "todo", "justifyLeft", "justifyCenter", "justifyRight", "insertTable", "uploadImage", "codeBlock", "undo", "redo"], "uploadConfig": {"maxFileSize": 3145728, "maxNumberOfFiles": 5}}	\N	100	富文本示例，使用 ArtWangEditor	0	\N	\N	0	1770737799
27	basics	基础设置	站点富文本	site_textedio	<p>啊啊啊啊</p>	editor	{"mode": "default", "height": "360px", "placeholder": "请输入站点介绍...", "toolbarKeys": ["headerSelect", "bold", "underline", "italic", "through", "color", "bgColor", "link", "bulletedList", "numberedList", "todo", "justifyLeft", "justifyCenter", "justifyRight", "insertTable", "uploadImage", "codeBlock", "undo", "redo"], "uploadConfig": {"maxFileSize": 3145728, "maxNumberOfFiles": 5}}	\N	100	富文本示例，使用 ArtWangEditor	0	\N	\N	0	1770737799
28	dictionary	字典配置	配置分组字典	config_group	[{"group":"basics","groupName":"基础设置","icon":"ri:settings-3-line","description":"系统常规信息配置","sort":0},{"group":"oss","groupName":"对象存储","icon":"ri:cloud-line","description":"对象存储配置","sort":10},{"group":"mail","groupName":"邮件配置","icon":"ri:mail-line","description":"邮箱账号信息配置","sort":20},{"group":"security","groupName":"安全设置","icon":"ri:shield-line","description":"安全相关配置","sort":30},{"group":"sms","groupName":"短信配置","icon":"ri:smartphone-line","description":"配置短信接口","sort":40}]	array	{"fields": [{"key": "group", "type": "text", "label": "分组标识", "placeholder": "如 basics/mail/oss"}, {"key": "groupName", "type": "text", "label": "分组名称", "placeholder": "显示名称"}, {"key": "icon", "type": "text", "label": "图标", "placeholder": "如 ri:settings-3-line"}, {"key": "description", "type": "text", "label": "描述", "placeholder": "分组描述信息"}, {"key": "sort", "min": 0, "type": "number", "label": "排序", "placeholder": "越大越靠后"}]}	\N	10	配置分组字典（key=group，value=显示名）	0	\N	\N	0	1770736665
34	oss	对象存储	阿里云 endpoint	oss_aliyun_endpoint		text	\N	\N	110	如 oss-cn-hangzhou.aliyuncs.com	0	\N	\N	0	0
35	oss	对象存储	阿里云 AccessKeyId	oss_aliyun_access_key_id		text	\N	\N	111		0	\N	\N	0	0
36	oss	对象存储	阿里云 AccessKeySecret	oss_aliyun_access_key_secret		text	\N	\N	112		0	\N	\N	0	0
37	oss	对象存储	阿里云 bucket	oss_aliyun_bucket		text	\N	\N	113		0	\N	\N	0	0
38	oss	对象存储	阿里云 domain	oss_aliyun_domain		text	\N	\N	114	建议配置为自定义域名/CDN，如 https://static.example.com	0	\N	\N	0	0
39	oss	对象存储	阿里云 root	oss_aliyun_root		text	\N	\N	115	可选，例如 uploads，留空则存根目录	0	\N	\N	0	0
40	oss	对象存储	七牛 AccessKey	oss_qiniu_access_key		text	\N	\N	120		0	\N	\N	0	0
41	oss	对象存储	七牛 SecretKey	oss_qiniu_secret_key		text	\N	\N	121		0	\N	\N	0	0
42	oss	对象存储	七牛 bucket	oss_qiniu_bucket		text	\N	\N	122		0	\N	\N	0	0
43	oss	对象存储	七牛 domain	oss_qiniu_domain		text	\N	\N	123	绑定域名，如 https://img.xxx.com	0	\N	\N	0	0
44	oss	对象存储	七牛 root	oss_qiniu_root		text	\N	\N	124	可选，留空存根目录	0	\N	\N	0	0
45	oss	对象存储	七牛 zone	oss_qiniu_zone		text	\N	\N	125	可选，留空自动；如 z0/z1	0	\N	\N	0	0
46	oss	对象存储	七牛 uplink	oss_qiniu_uplink		text	\N	\N	126	可空	0	\N	\N	0	0
47	oss	对象存储	COS SecretId	oss_cos_secret_id		text	\N	\N	130		0	\N	\N	0	0
48	oss	对象存储	COS SecretKey	oss_cos_secret_key		text	\N	\N	131		0	\N	\N	0	0
49	oss	对象存储	COS Region	oss_cos_region		text	\N	\N	132	如 ap-shanghai	0	\N	\N	0	0
50	oss	对象存储	COS bucket	oss_cos_bucket		text	\N	\N	133	含 AppId，如 xxx-125xxxx	0	\N	\N	0	0
51	oss	对象存储	COS domain	oss_cos_domain		text	\N	\N	134	可选自定义域名	0	\N	\N	0	0
52	oss	对象存储	COS root	oss_cos_root		text	\N	\N	135	可选，留空存根目录	0	\N	\N	0	0
53	oss	对象存储	COS schema	oss_cos_schema		text	\N	\N	136	http 或 https，默认 https	0	\N	\N	0	0
54	oss	对象存储	单文件最大大小	upload_max_size	10mb	text	\N	\N	10	支持 b、kb、mb、gb，例如 10mb	0	\N	\N	0	0
55	oss	对象存储	允许的文件后缀	upload_allowed_suffixes	jpg,png,bmp,jpeg,gif,webp,zip,rar,wav,mp4,mp3,docx	text	\N	\N	11	逗号分隔，小写字母	0	\N	\N	0	0
56	oss	对象存储	允许的MIME类型	upload_allowed_mime_types		text	\N	\N	12	留空表示不限制，例如 image/png,image/jpeg	0	\N	\N	0	0
57	basics	基础设置	前台会员中心	open_member_center	1	switch	{"activeText": "", "activeValue": "1", "inactiveText": "", "inactiveValue": "0"}	\N	100	如关闭则无法登录注册前台会员中心	0	\N	\N	1770736767	1770737799
\.


--
-- Data for Name: xy_sys_cron; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_sys_cron (id, group_id, title, name, params, pattern, policy, count, sort, remark, status, created_at, updated_at) FROM stdin;
1	2	测试定时任务	test	hello word	*/5 * * * * *	1	1	0	一个测试范例定时任务	0	1770718404	1770718450
2	1	监测队列状态	queue_alert	5,1	0 */5 * * * *	1	1	0	检测队列积压情况	0	1770720827	1770725448
\.


--
-- Data for Name: xy_sys_cron_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_sys_cron_group (id, name, sort, remark, status, created_at, updated_at) FROM stdin;
1	系统任务	0	系统内置定时任务	1	1770716554	1770716554
2	业务任务	10	业务自定义定时任务	1	1770716554	1770716554
\.


--
-- Data for Name: xy_sys_cron_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_sys_cron_log (id, cron_id, name, title, params, status, output, err_msg, take_ms, created_at) FROM stdin;
1	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:25] hello word		0	1770718405
2	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:30] hello word		0	1770718410
3	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:35] hello word		0	1770718415
4	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:40] hello word		0	1770718420
5	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:45] hello word		0	1770718425
6	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:50] hello word		0	1770718430
7	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:55] hello word		0	1770718435
8	1	test	测试定时任务	hello word	1	[2026-02-10 18:14:00] hello word		0	1770718440
9	1	test	测试定时任务	hello word	1	[2026-02-10 18:14:05] hello word		0	1770718445
10	2	queue_alert	queue_alert	100,10	1	all queues normal		1	1770720900
11	2	queue_alert	queue_alert	100,10	1	all queues normal		2	1770721200
12	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770721426
13	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770721500
14	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770721514
15	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		4	1770721520
16	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		6	1770721622
17	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		5	1770721633
18	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770721649
19	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		4	1770721800
20	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770722100
21	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770722400
22	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770722700
23	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770723000
24	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		2	1770723300
25	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770723600
26	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		7	1770723900
27	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		5	1770724200
28	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		2	1770724500
29	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		5	1770724800
30	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		3	1770725100
31	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\r\n队列 login_log 积压 7 条（阈值 5）\r\n队列 login_log 死信 2 条（阈值 1）		4	1770725400
\.


--
-- Data for Name: xy_sys_gen_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_sys_gen_codes (id, gen_type, db_name, table_name, table_comment, var_name, options, status, created_at, updated_at) FROM stdin;
37	10	xygonew	xy_member_login_log	登录日志	MemberLoginLog	{"menu": {"pid": 143, "icon": "ri:file-list-line", "sort": 100}, "tree": {"pidColumn": "parent_id", "titleColumn": "name"}, "autoOps": ["genMenuPermissions", "runDao", "runService"], "genType": 10, "headOps": ["batchDel", "export"], "genPaths": {}, "viewMode": "page", "apiPrefix": "", "columnOps": ["del", "view", "check"]}	2	1770873777	1770873777
51	10	xygonew	xy_member_money_log	余额变动日志	MemberMoneyLog	{"menu": {"pid": 143, "icon": "ri:file-list-line", "sort": 100}, "tree": {"pidColumn": "parent_id", "titleColumn": "name"}, "autoOps": ["genMenuPermissions", "runDao", "runService"], "genType": 10, "headOps": ["add", "batchDel", "export"], "genPaths": {}, "viewMode": "drawer", "apiPrefix": "", "columnOps": ["edit", "del", "view", "status", "check"], "modulePath": "member/member-money-log", "generatedFiles": {"server": ["E:\\\\xygoadmin\\\\server\\\\api\\\\admin\\\\admin_member_money_log.go", "E:\\\\xygoadmin\\\\server\\\\internal\\\\controller\\\\admin\\\\member_money_log.go", "E:\\\\xygoadmin\\\\server\\\\resource\\\\sql\\\\generate\\\\menu_member_money_log.sql", "E:\\\\xygoadmin\\\\server\\\\internal\\\\model\\\\input\\\\adminin\\\\member_money_log.go", "E:\\\\xygoadmin\\\\server\\\\internal\\\\logic\\\\membermoneylog\\\\member_money_log.go"], "frontend": ["E:\\\\xygoadmin\\\\newweb\\\\src\\\\api\\\\backend\\\\member\\\\member-money-log.ts", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-money-log\\\\index.vue", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-money-log\\\\modules\\\\member-money-log-dialog.vue", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-money-log\\\\modules\\\\member-money-log-detail-drawer.vue", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-money-log\\\\modules\\\\member-money-log-search.vue"]}}	1	1770881561	1770881606
52	10	xygonew	xy_member_score_log	积分变动日志	MemberScoreLog	{"menu": {"pid": 143, "icon": "ri:file-list-line", "sort": 100}, "tree": {"pidColumn": "parent_id", "titleColumn": "name"}, "autoOps": ["genMenuPermissions", "runDao", "runService"], "genType": 10, "headOps": ["add", "batchDel", "export"], "genPaths": {}, "viewMode": "drawer", "apiPrefix": "", "columnOps": ["edit", "del", "view", "status", "check"], "modulePath": "member/member-score-log", "generatedFiles": {"server": ["E:\\\\xygoadmin\\\\server\\\\api\\\\admin\\\\admin_member_score_log.go", "E:\\\\xygoadmin\\\\server\\\\internal\\\\controller\\\\admin\\\\member_score_log.go", "E:\\\\xygoadmin\\\\server\\\\resource\\\\sql\\\\generate\\\\menu_member_score_log.sql", "E:\\\\xygoadmin\\\\server\\\\internal\\\\model\\\\input\\\\adminin\\\\member_score_log.go", "E:\\\\xygoadmin\\\\server\\\\internal\\\\logic\\\\memberscorelog\\\\member_score_log.go"], "frontend": ["E:\\\\xygoadmin\\\\newweb\\\\src\\\\api\\\\backend\\\\member\\\\member-score-log.ts", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-score-log\\\\index.vue", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-score-log\\\\modules\\\\member-score-log-dialog.vue", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-score-log\\\\modules\\\\member-score-log-detail-drawer.vue", "E:\\\\xygoadmin\\\\newweb\\\\src\\\\views\\\\backend\\\\member\\\\member-score-log\\\\modules\\\\member-score-log-search.vue"]}}	1	1770881700	1770894898
67	10	xygonew	xy_member_notice	会员通知	MemberNotice	{"menu": {"pid": 143, "icon": "ri:notification-line", "sort": 100}, "tree": {"pidColumn": "parent_id", "titleColumn": "name"}, "autoOps": ["genMenuPermissions", "runDao", "runService"], "genType": 10, "headOps": ["add", "batchDel", "export"], "genPaths": {}, "viewMode": "drawer", "apiPrefix": "", "columnOps": ["edit", "del", "view", "status", "check"]}	2	1770904531	1770904531
\.


--
-- Data for Name: xy_sys_gen_codes_column; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_sys_gen_codes_column (id, gen_id, name, go_name, ts_name, db_type, go_type, ts_type, comment, is_pk, is_required, is_list, is_edit, is_query, query_type, design_type, extra, form_type, dict_type, sort) FROM stdin;
491	37	id	Id	id	bigint(20) unsigned	uint64	number	ID	1	0	1	0	0	eq	pk		input		1
492	37	member_id	MemberId	memberId	bigint(20) unsigned	uint64	number	会员ID	0	1	1	1	0	eq	remoteSelect	{"_formProps":{"validator":[],"validatorMsg":"","remote-table":"xy_member","remote-pk":"id","remote-field":"username","relation-fields-config":"[{\\"field\\":\\"id\\",\\"label\\":\\"会员ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"username\\",\\"label\\":\\"用户名\\",\\"inList\\":true,\\"inSearch\\":true,\\"inExport\\":true,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"password\\",\\"label\\":\\"密码（bcrypt加密）\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"mobile\\",\\"label\\":\\"手机号\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"email\\",\\"label\\":\\"邮箱\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"nickname\\",\\"label\\":\\"昵称\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"avatar\\",\\"label\\":\\"头像\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"gender\\",\\"label\\":\\"性别\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"birthday\\",\\"label\\":\\"生日\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"money\\",\\"label\\":\\"余额\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"score\\",\\"label\\":\\"积分\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"level\\",\\"label\\":\\"会员等级\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"group_id\\",\\"label\\":\\"会员分组ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"status\\",\\"label\\":\\"状态\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_ip\\",\\"label\\":\\"最后登录IP\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_at\\",\\"label\\":\\"最后登录时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"login_count\\",\\"label\\":\\"登录次数\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"created_at\\",\\"label\\":\\"创建时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"updated_at\\",\\"label\\":\\"更新时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"deleted_at\\",\\"label\\":\\"删除时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"}]","relation-fields":"username","relation-search-fields":"username","relation-export-fields":"username"},"_tableProps":{"render":"none","operator":"eq","sortable":"false"}}	remoteSelect		2
493	37	username	Username	username	varchar(32)	string	string	用户名	0	1	1	1	0	like	string		input		3
494	37	ip	Ip	ip	varchar(50)	string	string	登录IP	0	1	1	1	0	eq	string	{"_formProps":{"validator":[],"validatorMsg":""},"_tableProps":{"render":"tag","operator":"like","sortable":"false"}}	input		4
495	37	user_agent	UserAgent	userAgent	varchar(512)	string	string	User-Agent	0	1	1	1	0	eq	string		input		5
496	37	status	Status	status	tinyint(1)	int	number	状态:0=成功,1=失败	0	1	1	1	1	eq	radio	{"_formProps":{"validator":[],"validatorMsg":"","dict-options":""},"_tableProps":{"render":"tag","operator":"eq","sortable":"false"}}	radio		6
497	37	message	Message	message	varchar(255)	string	string	提示信息	0	1	1	1	0	eq	string		input		7
498	37	created_at	CreatedAt	createdAt	datetime	*gtime.Time	string	登录时间	0	0	1	0	0	between	datetime		datetime		8
590	50	id	Id	id	bigint(20) unsigned	uint64	number		1	0	1	0	0	eq	pk		input		1
591	50	member_id	MemberId	memberId	bigint(20) unsigned	uint64	number	会员ID	0	1	1	1	0	eq	remoteSelect	{"_formProps":{"validator":[],"validatorMsg":"","remote-table":"xy_member","remote-pk":"id","remote-field":"nickname","relation-fields-config":"[{\\"field\\":\\"id\\",\\"label\\":\\"会员ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"username\\",\\"label\\":\\"用户名\\",\\"inList\\":true,\\"inSearch\\":true,\\"inExport\\":true,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"password\\",\\"label\\":\\"密码（bcrypt加密）\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"mobile\\",\\"label\\":\\"手机号\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"email\\",\\"label\\":\\"邮箱\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"nickname\\",\\"label\\":\\"昵称\\",\\"inList\\":true,\\"inSearch\\":true,\\"inExport\\":true,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"avatar\\",\\"label\\":\\"头像\\",\\"inList\\":true,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"tag\\"},{\\"field\\":\\"gender\\",\\"label\\":\\"性别\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"birthday\\",\\"label\\":\\"生日\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"money\\",\\"label\\":\\"余额\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"score\\",\\"label\\":\\"积分\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"level\\",\\"label\\":\\"会员等级\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"group_id\\",\\"label\\":\\"会员分组ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"status\\",\\"label\\":\\"状态\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_ip\\",\\"label\\":\\"最后登录IP\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_at\\",\\"label\\":\\"最后登录时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"login_count\\",\\"label\\":\\"登录次数\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"created_at\\",\\"label\\":\\"创建时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"updated_at\\",\\"label\\":\\"更新时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"deleted_at\\",\\"label\\":\\"删除时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"}]","relation-fields":"username,nickname,avatar","relation-search-fields":"username,nickname","relation-export-fields":"username,nickname"},"_tableProps":{"render":"none","operator":"eq","sortable":"false"}}	remoteSelect		2
592	50	money	Money	money	int(11)	int	number	变动金额	0	1	1	1	0	eq	number	{"_formProps":{"validator":[],"validatorMsg":"","step":1},"_tableProps":{"render":"none","operator":"eq","sortable":"custom"}}	inputNumber		3
593	50	before	Before	before	int(11)	int	number	变动前余额（分）	0	1	1	1	0	eq	number		inputNumber		4
594	50	after	After	after	int(11)	int	number	变动后余额（分）	0	1	1	1	0	eq	number		inputNumber		5
595	50	memo	Memo	memo	varchar(255)	string	string	变动说明	0	1	1	1	0	eq	string		input		6
596	50	created_at	CreatedAt	createdAt	datetime	*gtime.Time	string	创建时间	0	0	1	0	0	between	datetime		datetime		7
604	51	id	Id	id	bigint(20) unsigned	uint64	number		1	0	1	0	0	eq	pk	{"_formProps":{},"_tableProps":{}}	input		1
605	51	member_id	MemberId	memberId	bigint(20) unsigned	uint64	number	会员ID	0	1	1	1	0	eq	remoteSelect	{"_formProps":{"validator":[],"validatorMsg":"","remote-table":"xy_member","remote-pk":"id","remote-field":"nickname","relation-fields-config":"[{\\"field\\":\\"id\\",\\"label\\":\\"会员ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"username\\",\\"label\\":\\"用户名\\",\\"inList\\":true,\\"inSearch\\":true,\\"inExport\\":true,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"password\\",\\"label\\":\\"密码（bcrypt加密）\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"mobile\\",\\"label\\":\\"手机号\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"email\\",\\"label\\":\\"邮箱\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"nickname\\",\\"label\\":\\"昵称\\",\\"inList\\":true,\\"inSearch\\":true,\\"inExport\\":true,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"avatar\\",\\"label\\":\\"头像\\",\\"inList\\":true,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"image\\"},{\\"field\\":\\"gender\\",\\"label\\":\\"性别\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"birthday\\",\\"label\\":\\"生日\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"money\\",\\"label\\":\\"余额\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"score\\",\\"label\\":\\"积分\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"level\\",\\"label\\":\\"会员等级\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"group_id\\",\\"label\\":\\"会员分组ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"status\\",\\"label\\":\\"状态\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_ip\\",\\"label\\":\\"最后登录IP\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_at\\",\\"label\\":\\"最后登录时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"login_count\\",\\"label\\":\\"登录次数\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"created_at\\",\\"label\\":\\"创建时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"updated_at\\",\\"label\\":\\"更新时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"deleted_at\\",\\"label\\":\\"删除时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"}]","relation-fields":"username,nickname,avatar","relation-search-fields":"username,nickname","relation-export-fields":"username,nickname"},"_tableProps":{"render":"none","operator":"eq","sortable":"false"}}	remoteSelect		2
606	51	money	Money	money	int(11)	int	number	变动金额	0	1	1	1	1	between	number	{"_formProps":{"validator":[],"validatorMsg":"","step":1},"_tableProps":{"render":"none","operator":"eq","sortable":"custom"}}	inputNumber		3
607	51	before	Before	before	int(11)	int	number	变动前余额（分）	0	1	1	1	0	eq	number	{"_formProps":{},"_tableProps":{}}	inputNumber		4
608	51	after	After	after	int(11)	int	number	变动后余额（分）	0	1	1	1	0	eq	number	{"_formProps":{},"_tableProps":{}}	inputNumber		5
609	51	memo	Memo	memo	varchar(255)	string	string	变动说明	0	1	1	1	0	eq	string	{"_formProps":{},"_tableProps":{}}	input		6
610	51	created_at	CreatedAt	createdAt	datetime	*gtime.Time	string	创建时间	0	0	1	0	0	between	datetime	{"_formProps":{},"_tableProps":{}}	datetime		7
653	52	id	Id	id	bigint(20) unsigned	uint64	number		1	0	1	0	0	eq	pk	{"_formProps":{},"_tableProps":{}}	input		1
654	52	member_id	MemberId	memberId	bigint(20) unsigned	uint64	number	会员ID	0	1	1	1	0	eq	remoteSelect	{"_formProps":{"validator":[],"validatorMsg":"","remote-table":"xy_member","remote-pk":"id","remote-field":"nickname","relation-fields-config":"[{\\"field\\":\\"id\\",\\"label\\":\\"会员ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"username\\",\\"label\\":\\"用户名\\",\\"inList\\":true,\\"inSearch\\":true,\\"inExport\\":true,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"password\\",\\"label\\":\\"密码（bcrypt加密）\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"mobile\\",\\"label\\":\\"手机号\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"email\\",\\"label\\":\\"邮箱\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"nickname\\",\\"label\\":\\"昵称\\",\\"inList\\":true,\\"inSearch\\":true,\\"inExport\\":true,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"avatar\\",\\"label\\":\\"头像\\",\\"inList\\":true,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"image\\"},{\\"field\\":\\"gender\\",\\"label\\":\\"性别\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"birthday\\",\\"label\\":\\"生日\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"money\\",\\"label\\":\\"余额\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"score\\",\\"label\\":\\"积分\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"level\\",\\"label\\":\\"会员等级\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"group_id\\",\\"label\\":\\"会员分组ID\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"status\\",\\"label\\":\\"状态\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_ip\\",\\"label\\":\\"最后登录IP\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"last_login_at\\",\\"label\\":\\"最后登录时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"login_count\\",\\"label\\":\\"登录次数\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"created_at\\",\\"label\\":\\"创建时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"updated_at\\",\\"label\\":\\"更新时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"},{\\"field\\":\\"deleted_at\\",\\"label\\":\\"删除时间\\",\\"inList\\":false,\\"inSearch\\":false,\\"inExport\\":false,\\"searchType\\":\\"like\\",\\"searchComponent\\":\\"input\\",\\"listRender\\":\\"text\\"}]","relation-fields":"username,nickname,avatar","relation-search-fields":"username,nickname","relation-export-fields":"username,nickname"},"_tableProps":{"render":"none","operator":"eq","sortable":"false"}}	remoteSelect		2
655	52	score	Score	score	int(11)	int	number	变动积分	0	1	1	1	1	between	number	{"_formProps":{"validator":[],"validatorMsg":"","step":1},"_tableProps":{"render":"none","operator":"eq","sortable":"custom"}}	inputNumber		3
656	52	before	Before	before	int(11)	int	number	变动前积分	0	1	1	1	0	eq	number	{"_formProps":{},"_tableProps":{}}	inputNumber		4
657	52	after	After	after	int(11)	int	number	变动后积分	0	1	1	1	0	eq	number	{"_formProps":{},"_tableProps":{}}	inputNumber		5
658	52	memo	Memo	memo	varchar(255)	string	string	变动说明	0	1	1	1	0	eq	string	{"_formProps":{},"_tableProps":{}}	input		6
659	52	created_at	CreatedAt	createdAt	datetime	*gtime.Time	string	创建时间	0	0	1	0	0	between	datetime	{"_formProps":{},"_tableProps":{}}	datetime		7
802	67	id	Id	id	bigint(20) unsigned	uint64	number		1	0	1	0	0	eq	pk		input		1
803	67	title	Title	title	varchar(255)	string	string	通知标题	0	1	1	1	1	like	string		input		2
804	67	content	Content	content	text	string	string	通知内容	0	0	0	1	0	eq	editor	{"_formProps":{"validator":[],"validatorMsg":""},"_tableProps":{"render":"none","operator":"false","sortable":"false"}}	richEditor		3
805	67	type	Type	type	varchar(20)	string	string	通知类型	0	1	1	1	1	eq	select	{"_formProps":{"validator":[],"validatorMsg":"","dict-options":"system=系统通知,announce=公告,feature=功能更新,maintain=维护通知"},"_tableProps":{"render":"tag","operator":"eq","sortable":"false"}}	select		4
806	67	target	Target	target	varchar(20)	string	string	目标	0	1	1	1	0	eq	radio	{"_formProps":{"validator":[],"validatorMsg":"","dict-options":"all=全部会员,group=指定分组"},"_tableProps":{"render":"tag","operator":"eq","sortable":"false"}}	radio		5
807	67	target_id	TargetId	targetId	bigint(20) unsigned	uint64	number	目标分组ID	0	1	1	1	0	eq	remoteSelect	{"_formProps":{"validator":[],"validatorMsg":"","remote-table":"xy_member_group","remote-pk":"id","remote-field":"name","relation-fields-config":"[]","relation-fields":"","relation-search-fields":"","relation-export-fields":""},"_tableProps":{"render":"none","operator":"eq","sortable":"false"}}	remoteSelect		6
808	67	sender	Sender	sender	varchar(50)	string	string	发送者	0	1	1	1	0	eq	string		input		7
809	67	status	Status	status	tinyint(1)	int	number	状态	0	1	1	1	1	eq	radio	{"_formProps":{"dict-options":"0=草稿,1=已发布","validator":[],"validatorMsg":""},"_tableProps":{"render":"tag","operator":"eq","sortable":"false"}}	radio		8
810	67	created_at	CreatedAt	createdAt	datetime	*gtime.Time	string	创建时间	0	0	1	0	0	between	datetime		datetime		9
\.


--
-- Data for Name: xy_test_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_test_category (id, parent_id, name, icon, image, sort, status, remark, created_at, updated_at) FROM stdin;
1	0	电子产品	ri:computer-line		1	1	电子数码类	\N	\N
2	0	服装鞋帽	ri:t-shirt-line		2	1	服饰类	\N	\N
3	0	食品饮料	ri:cup-line		3	1	食品类	\N	\N
4	1	手机	ri:smartphone-line		1	1	智能手机	\N	\N
5	1	电脑	ri:macbook-line		2	1	笔记本/台式机	\N	\N
6	1	平板	ri:tablet-line		3	1	平板电脑	\N	\N
7	2	男装			1	1		\N	\N
8	2	女装			2	1		\N	\N
9	2	鞋靴			3	0	暂时下架	\N	\N
10	4	iPhone			1	1	Apple手机	\N	\N
11	4	Android			2	1	安卓手机	\N	\N
12	5	游戏本			1	1		\N	\N
13	5	轻薄本			2	1		\N	\N
\.


--
-- Data for Name: xy_test_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_test_code (id, name, member_id) FROM stdin;
1	test	1
\.


--
-- Data for Name: xy_test_codec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_test_codec (id, status, create_time) FROM stdin;
\.


--
-- Data for Name: xy_test_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xy_test_order (id, member_id, apply_id, amount, status, memo, created_at, updated_at) FROM stdin;
1	1	2	199.90	1	测试订单A-已完成	\N	\N
2	2	1	55.00	0	测试订单B-待处理	\N	\N
3	1	3	320.50	1	测试订单C-已取消	\N	\N
4	3	2	88.80	1	测试订单D-已完成	\N	\N
5	2	3	1200.00	0	大额订单E-待处理	\N	\N
\.


--
-- Data for Name: xy_admin_chat_message; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_chat_message (id, session_id, sender_id, type, content, created_at) FROM stdin;
1	1	2	1	你好	1770709004
2	1	2	1	我是李小龙	1770709123
3	1	2	1	你试试	1770709436
4	1	2	1	自己当时发完自己看不到 的重新打卡才能看到	1770709475
5	1	2	1	怎么是	1770709490
6	1	2	1	你是谁啊	1770709696
7	1	2	1	我是校长	1770709712
8	1	2	1	你可以看到我们	1770709778
9	1	2	1	你是谁	1770710049
10	1	2	1	我是我	1770710211
11	1	2	1	我也可能是你	1770710222
12	1	2	1	你不是我	1770710429
13	1	2	1	你说话啊	1770710619
14	1	2	1	我来了	1770710634
15	1	1	1	haode	1770710640
16	1	1	2	/attachment/upload/20260210/b17249d2-0d9d-496d-a6a5-1c9c2c603459.webp	1770710651
17	4	0	3	admin2 创建了群聊	1770711683
18	4	2	1	hellow	1770711690
19	4	1	1	laile	1770711703
20	1	1	1	我呢	1770738262
21	1	1	1	这是我	1770738530
22	1	1	1	你是谁	1770796950
23	1	2	1	我是你的人	1770796994
\.


--
-- Data for Name: xy_admin_chat_session; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_chat_session (id, type, name, avatar, creator_id, last_message, last_message_time, member_count, created_at, updated_at) FROM stdin;
1	1			2	我是你的人	1770796994	2	1770708990	1770796994
2	1			2		1770711417	2	1770711417	1770711417
3	1			2		1770711657	2	1770711657	1770711657
4	2	testgroup		2	laile	1770711703	4	1770711683	1770711703
\.


--
-- Data for Name: xy_admin_chat_session_member; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_chat_session_member (id, session_id, user_id, role, unread_count, last_read_msg_id, is_muted, is_deleted, joined_at) FROM stdin;
1	1	1	1	0	23	f	f	1770708990
2	1	2	1	0	22	f	f	1770708990
3	2	3	1	0	0	f	f	1770711417
4	2	2	1	0	0	f	f	1770711417
5	3	4	1	0	0	f	f	1770711657
6	3	2	1	0	0	f	f	1770711657
7	4	1	1	0	19	f	f	1770711683
8	4	3	1	2	0	f	f	1770711683
9	4	4	1	2	0	f	f	1770711683
10	4	2	3	0	19	f	f	1770711683
\.


--
-- Data for Name: xy_admin_dept; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_dept (id, parent_id, name, sort, status, remark, create_by, create_time, update_time) FROM stdin;
1	0	总公司	1	1	顶级部门	0	1768570149	1768570149
2	1	技术部	1	1	负责技术开发	0	1768570149	1768570149
3	1	市场部	2	1	负责市场推广	0	1768570149	1768570149
4	1	财务部	3	1	负责财务管理	0	1768570149	1768570149
5	2	前端组	1	1	前端开发团队	0	1768570149	1768570149
6	2	后端组	2	1	后端开发团队	0	1768570149	1768570149
7	3	线上推广组	1	1	负责线上营销	0	1768570149	1768570149
8	3	线下推广组	2	1	负责线下活动	0	1768570149	1768570149
\.


--
-- Data for Name: xy_admin_dept_closure; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_dept_closure (id, ancestor, descendant, level) FROM stdin;
1	1	1	0
2	1	2	1
3	2	2	0
4	1	3	1
5	3	3	0
6	1	4	1
7	4	4	0
8	1	5	2
9	2	5	1
10	5	5	0
11	1	6	2
12	2	6	1
13	6	6	0
14	1	7	2
15	3	7	1
16	7	7	0
17	1	8	2
18	3	8	1
19	8	8	0
\.


--
-- Data for Name: xy_admin_field_perm; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_field_perm (id, role_id, module, resource, field_name, field_label, perm_type, status, remark, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: xy_admin_login_log; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_login_log (id, user_id, username, ip, location, user_agent, browser, os, status, message, created_at) FROM stdin;
\.


--
-- Data for Name: xy_admin_menu; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_menu (id, parent_id, type, title, name, path, component, resource, icon, hidden, keep_alive, redirect, frame_src, perms, is_frame, affix, show_badge, badge_text, active_path, hide_tab, is_full_page, sort, status, remark, created_by, updated_by, create_time, update_time) FROM stdin;
1	0	1	仪表盘	Dashboard	/dashboard	/index/index		ri:pie-chart-line	0	0				f	f	f			f	f	10	1	仪表盘根	0	0	1768549363	1768549363
2	1	2	工作台	Console	console	/dashboard/console		ri:home-smile-2-line	0	0				f	f	f			f	f	11	1	仪表盘-工作台	0	0	1768549363	1768549363
3	1	2	分析页	Analysis	analysis	/dashboard/analysis		ri:align-item-bottom-line	0	0				f	f	f			f	f	12	1	仪表盘-分析	0	0	1768549363	1768549363
4	1	2	电商页	Ecommerce	ecommerce	/dashboard/ecommerce		ri:bar-chart-box-line	0	0				f	f	f			f	f	13	1	仪表盘-电商	0	0	1768549363	1768549363
10	0	1	模板中心	Template	/template	/index/index		ri:apps-2-line	0	0				f	f	f			f	f	20	1	模板根	0	0	1768549363	1768549363
11	10	2	卡片	Cards	cards	/template/cards		ri:wallet-line	0	0				f	f	f			f	f	21	1	模板-卡片	0	0	1768549363	1768549363
12	10	2	横幅	Banners	banners	/template/banners		ri:rectangle-line	0	0				f	f	f			f	f	22	1	模板-横幅	0	0	1768549363	1768549363
13	10	2	图表	Charts	charts	/template/charts		ri:bar-chart-box-line	0	0				f	f	f			f	f	23	1	模板-图表	0	0	1768549363	1768549363
14	10	2	地图	Map	map	/template/map		ri:map-pin-line	0	0				f	f	f			f	f	24	1	模板-地图	0	0	1768549363	1768549363
15	10	2	聊天	Chat	chat	/template/chat		ri:message-3-line	0	0				f	f	f			f	f	25	1	模板-聊天	0	0	1768549363	1768549363
16	10	2	日历	Calendar	calendar	/template/calendar		ri:calendar-2-line	0	0				f	f	f			f	f	26	1	模板-日历	0	0	1768549363	1768549363
17	10	2	定价	Pricing	pricing	/template/pricing		ri:money-cny-box-line	0	0				f	f	f			f	f	27	1	模板-定价	0	0	1768549363	1768549363
20	0	2	组件中心	Widgets	/widgets	/index/index		ri:apps-2-add-line	0	0				f	f	f			f	f	30	1		0	0	1768549363	1768549363
21	20	2	图标	Icon	icon	/widgets/icon		ri:palette-line	0	0				f	f	f			f	f	31	1	组件-图标	0	0	1768549363	1768549363
22	20	2	图片裁剪	ImageCrop	image-crop	/widgets/image-crop		ri:screenshot-line	0	0				f	f	f			f	f	32	1	组件-裁剪	0	0	1768549363	1768549363
23	20	2	Excel	Excel	excel	/widgets/excel		ri:download-2-line	0	0				f	f	f			f	f	33	1	组件-Excel	0	0	1768549363	1768549363
24	20	2	视频	Video	video	/widgets/video		ri:vidicon-line	0	0				f	f	f			f	f	34	1	组件-视频	0	0	1768549363	1768549363
25	20	2	CountTo	CountTo	count-to	/widgets/count-to		ri:anthropic-line	0	0				f	f	f			f	f	35	1	组件-CountTo	0	0	1768549363	1768549363
26	20	2	富文本	WangEditor	wang-editor	/widgets/wang-editor		ri:t-box-line	0	0				f	f	f			f	f	36	1	组件-富文本	0	0	1768549363	1768549363
27	20	2	水印	Watermark	watermark	/widgets/watermark		ri:water-flash-line	0	0				f	f	f			f	f	37	1	组件-水印	0	0	1768549363	1768549363
28	20	2	右键菜单	ContextMenu	context-menu	/widgets/context-menu		ri:menu-2-line	0	0				f	f	f			f	f	38	1	组件-右键	0	0	1768549363	1768549363
29	20	2	二维码	Qrcode	qrcode	/widgets/qrcode		ri:qr-code-line	0	0				f	f	f			f	f	39	1	组件-二维码	0	0	1768549363	1768549363
30	20	2	拖拽	Drag	drag	/widgets/drag		ri:drag-move-fill	0	0				f	f	f			f	f	40	1	组件-拖拽	0	0	1768549363	1768549363
31	20	2	文字滚动	TextScroll	text-scroll	/widgets/text-scroll		ri:input-method-line	0	0				f	f	f			f	f	41	1	组件-文字滚动	0	0	1768549363	1768549363
32	20	2	烟花	Fireworks	fireworks	/widgets/fireworks		ri:magic-line	0	0				f	f	f			f	f	42	1	组件-烟花	0	0	1768549363	1768549363
33	20	2	外链-ElementUI	ElementUI	elementui			ri:apps-2-line	0	0		https://element-plus.org/zh-CN/component/overview.html		t	f	f			f	f	43	1	组件-外链	0	0	1768549363	1768549363
40	0	1	功能示例	Examples	/examples	/index/index		ri:sparkling-line	0	0				f	f	f			f	f	50	1	示例根	0	0	1768549363	1768549363
41	40	1	权限示例	Permission	permission			ri:fingerprint-line	0	0				f	f	f			f	f	51	1	示例-权限	0	0	1768549363	1768549363
42	41	2	切换角色	PermissionSwitchRole	switch-role	/examples/permission/switch-role		ri:contacts-line	0	0				f	f	f			f	f	52	1	权限-切换角色	0	0	1768549363	1768549363
43	41	2	按钮权限	PermissionButtonAuth	button-auth	/examples/permission/button-auth		ri:mouse-line	0	0				f	f	f			f	f	53	1	权限-按钮	0	0	1768549363	1768549363
44	41	2	页面可见性	PermissionPageVisibility	page-visibility	/examples/permission/page-visibility		ri:user-3-line	0	0				f	f	f			f	f	54	1	权限-可见性	0	0	1768549363	1768549363
45	40	2	多标签页	Tabs	tabs	/examples/tabs		ri:price-tag-line	0	0				f	f	f			f	f	55	1	示例-标签	0	0	1768549363	1768549363
46	40	2	表格基础	TablesBasic	tables-basic	/examples/tables/basic		ri:layout-grid-line	0	0				f	f	f			f	f	56	1	示例-表格基础	0	0	1768549363	1768549363
47	40	2	表格综合	Tables	tables	/examples/tables		ri:table-3	0	0				f	f	f			f	f	57	1	示例-表格综合	0	0	1768549363	1768549363
48	40	2	表单综合	Forms	forms	/examples/forms		ri:table-view	0	0				f	f	f			f	f	58	1	示例-表单	0	0	1768549363	1768549363
49	40	2	搜索栏	SearchBar	search-bar	/examples/forms/search-bar		ri:table-line	0	0				f	f	f			f	f	59	1	示例-搜索栏	0	0	1768549363	1768549363
50	40	2	树表格	TablesTree	tables-tree	/examples/tables/tree		ri:layout-2-line	0	0				f	f	f			f	f	60	1	示例-树表	0	0	1768549363	1768549363
51	40	2	Socket 聊天	SocketChat	socket-chat	/examples/socket-chat		ri:shake-hands-line	0	0				f	f	f			f	f	61	1	示例-聊天	0	0	1768549363	1768549363
60	0	1	系统管理	System	/system	/index/index		ri:settings-3-line	0	0				f	f	f			f	f	70	1	系统设置和配置	0	0	1768549363	1768549363
61	140	2	后台用户	User	user	/system/user	admin_user	ri:user-line	0	0				f	f	f			f	f	3	1	后台用户管理	0	0	1768549363	1768549363
62	140	2	角色管理	Role	role	/system/role	admin_role	ri:user-settings-line	0	0				f	f	f			f	f	4	1	角色权限管理	0	0	1768549363	1768549363
63	60	2	用户中心	UserCenter	user-center	/system/user-center		ri:user-line	0	0				f	f	f			f	f	1	1	系统-用户中心	0	0	1768549363	1768549363
64	140	2	菜单管理	Menus	menu	/system/menu	admin_menu	ri:menu-line	0	0				f	f	f			f	f	5	1	菜单权限管理	0	0	1768549363	1768549363
65	60	2	系统设置	SystemConfig	config	/system/config	sys_config	ri:settings-3-line	0	0				f	f	f			f	f	2	1		0	0	1768549363	1768549363
66	60	1	多级菜单	Nested	nested			ri:menu-unfold-3-line	0	0				f	f	f			f	f	10	1	系统-嵌套	0	0	1768549363	1768549363
67	66	2	菜单1	NestedMenu1	menu1	/system/nested/menu1		ri:align-justify	0	0				f	f	f			f	f	77	1	嵌套-1	0	0	1768549363	1768549363
68	66	1	菜单2	NestedMenu2	menu2			ri:align-justify	0	0				f	f	f			f	f	78	1	嵌套-2	0	0	1768549363	1768549363
69	68	2	菜单2-1	NestedMenu2-1	menu2-1	/system/nested/menu2		ri:align-justify	0	0				f	f	f			f	f	79	1	嵌套-2-1	0	0	1768549363	1768549363
70	66	1	菜单3	NestedMenu3	menu3			ri:align-justify	0	0				f	f	f			f	f	80	1	嵌套-3	0	0	1768549363	1768549363
71	70	2	菜单3-1	NestedMenu3-1	menu3-1	/system/nested/menu3			0	0				f	f	f			f	f	81	1	嵌套-3-1	0	0	1768549363	1768549363
72	70	1	菜单3-2	NestedMenu3-2	menu3-2				0	0				f	f	f			f	f	82	1	嵌套-3-2	0	0	1768549363	1768549363
73	72	2	菜单3-2-1	NestedMenu3-2-1	menu3-2-1	/system/nested/menu3/menu3-2			0	0				f	f	f			f	f	83	1	嵌套-3-2-1	0	0	1768549363	1768549363
80	0	1	文档管理	Article	/article	/index/index		ri:book-2-line	0	0				f	f	f			f	f	90	1	文档根	0	0	1768549363	1768549363
81	80	2	文档列表	ArticleList	article-list	/article/list		ri:article-line	0	0				f	f	f			f	f	91	1	文档-列表	0	0	1768549363	1768549363
82	80	2	文档详情	ArticleDetail	detail/:id	/article/detail			0	0				f	f	f			f	f	92	1	文档-详情	0	0	1768549363	1768549363
83	80	2	评论	ArticleComment	comment	/article/comment		ri:mail-line	0	0				f	f	f			f	f	93	1	文档-评论	0	0	1768549363	1768549363
84	80	2	发布	ArticlePublish	publish	/article/publish		ri:telegram-2-line	0	0				f	f	f			f	f	94	1	文档-发布	0	0	1768549363	1768549363
90	0	1	结果页	Result	/result	/index/index		ri:checkbox-circle-line	0	0				f	f	f			f	f	100	1	结果根	0	0	1768549363	1768549363
91	90	2	成功页	ResultSuccess	success	/result/success		ri:checkbox-circle-line	0	0				f	f	f			f	f	101	1	结果-成功	0	0	1768549363	1768549363
92	90	2	失败页	ResultFail	fail	/result/fail		ri:close-circle-line	0	0				f	f	f			f	f	102	1	结果-失败	0	0	1768549363	1768549363
100	0	1	异常页	Exception	/exception	/index/index		ri:error-warning-line	0	0				f	f	f			f	f	110	1	异常根	0	0	1768549363	1768549363
101	100	2	403	Exception403	403	/exception/403			0	0				f	f	f			f	f	111	1	异常-403	0	0	1768549363	1768549363
102	100	2	404	Exception404	404	/exception/404			0	0				f	f	f			f	f	112	1	异常-404	0	0	1768549363	1768549363
103	100	2	500	Exception500	500	/exception/500			0	0				f	f	f			f	f	113	1	异常-500	0	0	1768549363	1768549363
110	0	1	运维管理	Safeguard	/safeguard	/index/index		ri:shield-check-line	0	0				f	f	f			f	f	120	1	运维根	0	0	1768549363	1768549363
111	110	2	服务器监控	SafeguardServer	server	/safeguard/server		ri:hard-drive-3-line	0	1			["GET /admin/monitor/server"]	f	f	f			f	f	121	1	运维-服务器	0	0	1768549363	1770644180
121	0	2	更新日志	ChangeLog	/change/log	/change/log		ri:gamepad-line	0	0				f	f	t	v3.0.1	1	f	f	999	1		0	0	1768549363	1768549363
122	60	2	附件管理	system/attachment	system/attachment	/system/attachment/index	sys_attachment	ep:folder-opened	0	1			\N	f	f	f			f	f	3	1	附件中心与文件管理	0	0	1768549363	1768549363
123	122	3	查看	system/attachment/index					0	0			system:attachment:list	f	f	f			f	f	1	1		0	0	1768549363	1768549363
124	122	3	编辑	system/attachment/edit					0	0			system:attachment:edit	f	f	f			f	f	2	1		0	0	1768549363	1768549363
125	122	3	删除	system/attachment/del					0	0			system:attachment:del	f	f	f			f	f	3	1		0	0	1768549363	1768549363
126	20	2	图标选择器	IconSelector	icon-selector	/widgets/icon-selector		ri:palette-line	0	1				f	f	f			f	f	33	1	图标选择器组件	0	0	1768549363	1768549363
127	20	2	颜色选择器	ColorPicker	color-picker	/widgets/color-picker		ri:palette-fill	0	1				f	f	f			f	f	34	1	颜色选择器组件	0	0	1768549363	1768549363
128	20	2	图片上传	ImageUpload	image-upload	/widgets/image-upload		ri:image-2-line	0	1				f	f	f			f	f	35	1	图片上传组件	0	0	1768549363	1768549363
129	20	2	文件上传	FileUpload	file-upload	/widgets/file-upload		ri:file-upload-line	0	1				f	f	f			f	f	36	1	文件上传组件	0	0	1768549363	1768549363
130	20	2	数组编辑器	ArrayEditor	array-editor	/widgets/array-editor		ri:list-settings-line	0	1				f	f	f			f	f	37	1	多维数组编辑器组件	0	0	1768549363	1768549363
140	0	1	权限管理	Auth	/auth	/index/index		ri:admin-line	0	0				f	f	f			f	f	65	1	权限管理模块	0	0	1768549363	1768549363
141	140	2	部门管理	Dept	dept	/system/dept	admin_dept	ri:organization-chart	0	1				f	f	f			f	f	1	1	组织架构和部门管理	0	0	1768549363	1768549363
142	140	2	岗位管理	Post	post	/system/post	admin_post	ri:briefcase-line	0	1				f	f	f			f	f	2	1	岗位管理（职位字典）	0	0	1768549363	1768549363
143	0	1	会员管理	Member	/member			ri:user-star-line	0	0			\N	f	f	f			f	f	50	1		0	0	1768748969	1768748969
144	143	2	会员列表	MemberList	list	/member/list/index		ri:team-line	0	0			\N	f	f	f			f	f	10	1		0	0	1768748969	1768748969
145	143	3	添加会员	MemberAdd					0	0			\N	f	f	f			f	f	1	1		0	0	1768748969	1768748969
146	143	3	编辑会员	MemberEdit					0	0			\N	f	f	f			f	f	2	1		0	0	1768748969	1768748969
147	143	3	删除会员	MemberDelete					0	0			\N	f	f	f			f	f	3	1		0	0	1768748969	1768748969
148	143	3	重置密码	MemberResetPassword					0	0			\N	f	f	f			f	f	4	1		0	0	1768748969	1768748969
149	143	2	会员分组	MemberGroup	group	/member/group/index	member_group	ri:group-line	0	1			["POST /admin/member/group/list"]	f	f	f			f	f	20	1	会员分组管理	0	0	1768791091	1768791091
150	149	3	新增分组	MemberGroupAdd			member_group		0	0			["POST /admin/member/group/save"]	f	f	f			f	f	1	1	新增会员分组	0	0	1768791091	1768791091
151	149	3	编辑分组	MemberGroupEdit			member_group		0	0			["POST /admin/member/group/save"]	f	f	f			f	f	2	1	编辑会员分组	0	0	1768791091	1768791091
152	149	3	删除分组	MemberGroupDelete			member_group		0	0			["POST /admin/member/group/delete"]	f	f	f			f	f	3	1	删除会员分组	0	0	1768791091	1768791091
153	143	2	会员菜单	MemberMenu	menu	/member/menu/index	member_menu	ri:menu-line	0	1			["GET /admin/member/menu/tree"]	f	f	f			f	f	30	1	会员前台菜单管理	0	0	1768791091	1768791091
154	153	3	新增菜单	MemberMenuAdd			member_menu		0	0			["POST /admin/member/menu/save"]	f	f	f			f	f	1	1	新增会员菜单	0	0	1768791091	1768791091
155	153	3	编辑菜单	MemberMenuEdit			member_menu		0	0			["POST /admin/member/menu/save"]	f	f	f			f	f	2	1	编辑会员菜单	0	0	1768791091	1768791091
156	153	3	删除菜单	MemberMenuDelete			member_menu		0	0			["POST /admin/member/menu/delete"]	f	f	f			f	f	3	1	删除会员菜单	0	0	1768791091	1768791091
157	110	2	登录日志	LoginLog	login-log	/safeguard/login-log	admin_login_log	ri:login-box-line	0	1			["POST /admin/log/login/list"]	f	f	f			f	f	122	1	管理员登录日志	0	0	1770615724	1770615724
158	157	3	删除日志	LoginLogDelete			admin_login_log		0	0			["POST /admin/log/login/delete"]	f	f	f			f	f	1	1	删除登录日志	0	0	1770615724	1770615724
159	157	3	清空日志	LoginLogClear			admin_login_log		0	0			["POST /admin/log/login/clear"]	f	f	f			f	f	2	1	清空登录日志	0	0	1770615724	1770615724
160	110	2	操作日志	OperationLog	operation-log	/safeguard/operation-log	admin_operation_log	ri:file-text-line	0	1			["POST /admin/log/operation/list"]	f	f	f			f	f	123	1	管理员操作日志	0	0	1770615724	1770615724
161	160	3	查看详情	OperationLogDetail			admin_operation_log		0	0			["GET /admin/log/operation/detail"]	f	f	f			f	f	1	1	查看操作日志详情	0	0	1770615724	1770615724
162	160	3	删除日志	OperationLogDelete			admin_operation_log		0	0			["POST /admin/log/operation/delete"]	f	f	f			f	f	2	1	删除操作日志	0	0	1770615724	1770615724
163	160	3	清空日志	OperationLogClear			admin_operation_log		0	0			["POST /admin/log/operation/clear"]	f	f	f			f	f	3	1	清空操作日志	0	0	1770615724	1770615724
164	110	2	性能分析	SafeguardPerformance	performance	/safeguard/performance	admin_operation_log	ri:line-chart-line	0	0				f	f	f			f	f	124	1		0	0	1770644179	1770644179
165	0	1	开发工具	Develop	/develop	/index/index		ri:code-box-line	0	0				f	f	f			f	f	125	1	开发工具目录	0	0	1770648637	1770648637
166	165	2	代码生成器	GenCodes	gen-codes	/develop/gen-codes/index	sys_gen_codes	ri:magic-line	0	1			["GET /admin/genCodes/selects","GET /admin/genCodes/tableSelect","GET /admin/genCodes/columnList","GET /admin/genCodes/list","GET /admin/genCodes/view","POST /admin/genCodes/edit","POST /admin/genCodes/delete","POST /admin/genCodes/preview","POST /admin/genCodes/build","POST /admin/genCodes/createTable"]	f	f	f			f	f	1	1	代码生成器	0	0	1770648637	1770648637
202	110	2	函数分析	PprofAnalysis	pprof	/safeguard/pprof/index		ri:code-s-slash-line	0	1			["GET /admin/monitor/pprof-top"]	f	f	f			f	f	125	1	函数级CPU/内存热点分析(pprof)	0	0	1770702712	1770702712
220	60	2	通知管理	Notice	notice	/system/notice/index	admin_notice	ri:notification-3-line	0	1			["POST /admin/notice/list"]	f	f	f			f	f	4	1	通知消息管理	0	0	1770700000	1770700000
221	220	3	查看	NoticeView			admin_notice		0	0			["POST /admin/notice/list"]	f	f	f			f	f	1	1	查看通知列表	0	0	1770700000	1770700000
222	220	3	发布/编辑	NoticeEdit			admin_notice		0	0			["POST /admin/notice/edit"]	f	f	f			f	f	2	1	发布或编辑通知	0	0	1770700000	1770700000
223	220	3	删除	NoticeDelete			admin_notice		0	0			["POST /admin/notice/delete"]	f	f	f			f	f	3	1	删除通知	0	0	1770700000	1770700000
240	60	2	定时任务	CronManage	cron	/system/cron/index	sys_cron	ri:timer-line	0	1				f	f	f			f	f	80	1	定时任务管理	0	0	1770717535	1770717535
241	240	3	查看	CronView					0	0			GET /admin/cron/list	f	f	f			f	f	0	1		0	0	1770717535	1770717535
242	240	3	新增/编辑	CronEdit					0	0			POST /admin/cron/save	f	f	f			f	f	0	1		0	0	1770717535	1770717535
243	240	3	删除	CronDelete					0	0			POST /admin/cron/delete	f	f	f			f	f	0	1		0	0	1770717535	1770717535
244	240	3	在线执行	CronOnlineExec					0	0			POST /admin/cron/onlineExec	f	f	f			f	f	0	1		0	0	1770717535	1770717535
250	60	2	消息队列	QueueManage	queue	/system/queue/index		ri:stack-line	0	1				f	f	f			f	f	85	1	消息队列管理	0	0	1770719034	1770719034
418	143	2	登录日志	MemberLoginLog	member-login-log	/member/member-login-log/index		ri:file-list-line	0	1			["GET /admin/member-login-log/list"]	f	f	f			f	f	100	1		0	0	1770873777	1770873777
419	418	3	查看登录日志	MemberLoginLogView					0	0			["GET /admin/member-login-log/view"]	f	f	f			f	f	1	1		0	0	1770873777	1770873777
420	143	2	登录日志详情	MemberLoginLogDetail	member-login-log/detail	/member/member-login-log/detail/index			1	0			["GET /admin/member-login-log/view"]	f	f	f		/member-login-log	f	f	0	1		0	0	1770873777	1770873777
421	418	3	删除登录日志	MemberLoginLogDelete					0	0			["POST /admin/member-login-log/delete"]	f	f	f			f	f	4	1		0	0	1770873777	1770873777
422	418	3	导出登录日志	MemberLoginLogExport					0	0			["GET /admin/member-login-log/export"]	f	f	f			f	f	5	1		0	0	1770873777	1770873777
511	143	2	余额变动日志	MemberMoneyLog	member-money-log	/member/member-money-log/index		ri:file-list-line	0	1			["GET /admin/member-money-log/list"]	f	f	f			f	f	100	1		0	0	1770881561	1770881561
512	511	3	查看余额变动日志	MemberMoneyLogView					0	0			["GET /admin/member-money-log/view"]	f	f	f			f	f	1	1		0	0	1770881561	1770881561
513	511	3	新增余额变动日志	MemberMoneyLogAdd					0	0			["POST /admin/member-money-log/edit"]	f	f	f			f	f	2	1		0	0	1770881561	1770881561
514	511	3	编辑余额变动日志	MemberMoneyLogEdit					0	0			["POST /admin/member-money-log/edit","GET /admin/member-money-log/view"]	f	f	f			f	f	3	1		0	0	1770881561	1770881561
515	511	3	删除余额变动日志	MemberMoneyLogDelete					0	0			["POST /admin/member-money-log/delete"]	f	f	f			f	f	4	1		0	0	1770881561	1770881561
516	511	3	导出余额变动日志	MemberMoneyLogExport					0	0			["GET /admin/member-money-log/export"]	f	f	f			f	f	5	1		0	0	1770881561	1770881561
517	143	2	积分变动日志	MemberScoreLog	member-score-log	/member/member-score-log/index		ri:file-list-line	0	1			["GET /admin/member-score-log/list"]	f	f	f			f	f	100	1		0	0	1770881700	1770881700
617	143	2	会员通知	MemberNotice	member-notice	/member/member-notice/index		ri:notification-line	0	1			["GET /admin/member-notice/list"]	f	f	f			f	f	100	1		0	0	1770904531	1770904531
618	617	3	查看会员通知	MemberNoticeView					0	0			["GET /admin/member-notice/view"]	f	f	f			f	f	1	1		0	0	1770904531	1770904531
619	617	3	新增会员通知	MemberNoticeAdd					0	0			["POST /admin/member-notice/edit"]	f	f	f			f	f	2	1		0	0	1770904531	1770904531
620	617	3	编辑会员通知	MemberNoticeEdit					0	0			["POST /admin/member-notice/edit","GET /admin/member-notice/view"]	f	f	f			f	f	3	1		0	0	1770904531	1770904531
621	617	3	删除会员通知	MemberNoticeDelete					0	0			["POST /admin/member-notice/delete"]	f	f	f			f	f	4	1		0	0	1770904531	1770904531
622	617	3	导出会员通知	MemberNoticeExport					0	0			["GET /admin/member-notice/export"]	f	f	f			f	f	5	1		0	0	1770904531	1770904531
3	1	2	分析页	Analysis	analysis	/dashboard/analysis		ri:align-item-bottom-line	0	0				f	f	f			f	f	12	1	仪表盘-分析	0	0	1768549363	1768549363
4	1	2	电商页	Ecommerce	ecommerce	/dashboard/ecommerce		ri:bar-chart-box-line	0	0				f	f	f			f	f	13	1	仪表盘-电商	0	0	1768549363	1768549363
10	0	1	模板中心	Template	/template	/index/index		ri:apps-2-line	0	0				f	f	f			f	f	20	1	模板根	0	0	1768549363	1768549363
11	10	2	卡片	Cards	cards	/template/cards		ri:wallet-line	0	0				f	f	f			f	f	21	1	模板-卡片	0	0	1768549363	1768549363
12	10	2	横幅	Banners	banners	/template/banners		ri:rectangle-line	0	0				f	f	f			f	f	22	1	模板-横幅	0	0	1768549363	1768549363
13	10	2	图表	Charts	charts	/template/charts		ri:bar-chart-box-line	0	0				f	f	f			f	f	23	1	模板-图表	0	0	1768549363	1768549363
14	10	2	地图	Map	map	/template/map		ri:map-pin-line	0	0				f	f	f			f	f	24	1	模板-地图	0	0	1768549363	1768549363
15	10	2	聊天	Chat	chat	/template/chat		ri:message-3-line	0	0				f	f	f			f	f	25	1	模板-聊天	0	0	1768549363	1768549363
16	10	2	日历	Calendar	calendar	/template/calendar		ri:calendar-2-line	0	0				f	f	f			f	f	26	1	模板-日历	0	0	1768549363	1768549363
17	10	2	定价	Pricing	pricing	/template/pricing		ri:money-cny-box-line	0	0				f	f	f			f	f	27	1	模板-定价	0	0	1768549363	1768549363
20	0	2	组件中心	Widgets	/widgets	/index/index		ri:apps-2-add-line	0	0				f	f	f			f	f	30	1		0	0	1768549363	1768549363
21	20	2	图标	Icon	icon	/widgets/icon		ri:palette-line	0	0				f	f	f			f	f	31	1	组件-图标	0	0	1768549363	1768549363
22	20	2	图片裁剪	ImageCrop	image-crop	/widgets/image-crop		ri:screenshot-line	0	0				f	f	f			f	f	32	1	组件-裁剪	0	0	1768549363	1768549363
23	20	2	Excel	Excel	excel	/widgets/excel		ri:download-2-line	0	0				f	f	f			f	f	33	1	组件-Excel	0	0	1768549363	1768549363
24	20	2	视频	Video	video	/widgets/video		ri:vidicon-line	0	0				f	f	f			f	f	34	1	组件-视频	0	0	1768549363	1768549363
25	20	2	CountTo	CountTo	count-to	/widgets/count-to		ri:anthropic-line	0	0				f	f	f			f	f	35	1	组件-CountTo	0	0	1768549363	1768549363
26	20	2	富文本	WangEditor	wang-editor	/widgets/wang-editor		ri:t-box-line	0	0				f	f	f			f	f	36	1	组件-富文本	0	0	1768549363	1768549363
27	20	2	水印	Watermark	watermark	/widgets/watermark		ri:water-flash-line	0	0				f	f	f			f	f	37	1	组件-水印	0	0	1768549363	1768549363
28	20	2	右键菜单	ContextMenu	context-menu	/widgets/context-menu		ri:menu-2-line	0	0				f	f	f			f	f	38	1	组件-右键	0	0	1768549363	1768549363
29	20	2	二维码	Qrcode	qrcode	/widgets/qrcode		ri:qr-code-line	0	0				f	f	f			f	f	39	1	组件-二维码	0	0	1768549363	1768549363
30	20	2	拖拽	Drag	drag	/widgets/drag		ri:drag-move-fill	0	0				f	f	f			f	f	40	1	组件-拖拽	0	0	1768549363	1768549363
31	20	2	文字滚动	TextScroll	text-scroll	/widgets/text-scroll		ri:input-method-line	0	0				f	f	f			f	f	41	1	组件-文字滚动	0	0	1768549363	1768549363
32	20	2	烟花	Fireworks	fireworks	/widgets/fireworks		ri:magic-line	0	0				f	f	f			f	f	42	1	组件-烟花	0	0	1768549363	1768549363
33	20	2	外链-ElementUI	ElementUI	elementui			ri:apps-2-line	0	0		https://element-plus.org/zh-CN/component/overview.html		t	f	f			f	f	43	1	组件-外链	0	0	1768549363	1768549363
40	0	1	功能示例	Examples	/examples	/index/index		ri:sparkling-line	0	0				f	f	f			f	f	50	1	示例根	0	0	1768549363	1768549363
41	40	1	权限示例	Permission	permission			ri:fingerprint-line	0	0				f	f	f			f	f	51	1	示例-权限	0	0	1768549363	1768549363
42	41	2	切换角色	PermissionSwitchRole	switch-role	/examples/permission/switch-role		ri:contacts-line	0	0				f	f	f			f	f	52	1	权限-切换角色	0	0	1768549363	1768549363
43	41	2	按钮权限	PermissionButtonAuth	button-auth	/examples/permission/button-auth		ri:mouse-line	0	0				f	f	f			f	f	53	1	权限-按钮	0	0	1768549363	1768549363
44	41	2	页面可见性	PermissionPageVisibility	page-visibility	/examples/permission/page-visibility		ri:user-3-line	0	0				f	f	f			f	f	54	1	权限-可见性	0	0	1768549363	1768549363
45	40	2	多标签页	Tabs	tabs	/examples/tabs		ri:price-tag-line	0	0				f	f	f			f	f	55	1	示例-标签	0	0	1768549363	1768549363
46	40	2	表格基础	TablesBasic	tables-basic	/examples/tables/basic		ri:layout-grid-line	0	0				f	f	f			f	f	56	1	示例-表格基础	0	0	1768549363	1768549363
47	40	2	表格综合	Tables	tables	/examples/tables		ri:table-3	0	0				f	f	f			f	f	57	1	示例-表格综合	0	0	1768549363	1768549363
48	40	2	表单综合	Forms	forms	/examples/forms		ri:table-view	0	0				f	f	f			f	f	58	1	示例-表单	0	0	1768549363	1768549363
49	40	2	搜索栏	SearchBar	search-bar	/examples/forms/search-bar		ri:table-line	0	0				f	f	f			f	f	59	1	示例-搜索栏	0	0	1768549363	1768549363
50	40	2	树表格	TablesTree	tables-tree	/examples/tables/tree		ri:layout-2-line	0	0				f	f	f			f	f	60	1	示例-树表	0	0	1768549363	1768549363
51	40	2	Socket 聊天	SocketChat	socket-chat	/examples/socket-chat		ri:shake-hands-line	0	0				f	f	f			f	f	61	1	示例-聊天	0	0	1768549363	1768549363
60	0	1	系统管理	System	/system	/index/index		ri:settings-3-line	0	0				f	f	f			f	f	70	1	系统设置和配置	0	0	1768549363	1768549363
61	140	2	后台用户	User	user	/system/user	admin_user	ri:user-line	0	0				f	f	f			f	f	3	1	后台用户管理	0	0	1768549363	1768549363
62	140	2	角色管理	Role	role	/system/role	admin_role	ri:user-settings-line	0	0				f	f	f			f	f	4	1	角色权限管理	0	0	1768549363	1768549363
63	60	2	用户中心	UserCenter	user-center	/system/user-center		ri:user-line	0	0				f	f	f			f	f	1	1	系统-用户中心	0	0	1768549363	1768549363
64	140	2	菜单管理	Menus	menu	/system/menu	admin_menu	ri:menu-line	0	0				f	f	f			f	f	5	1	菜单权限管理	0	0	1768549363	1768549363
65	60	2	系统设置	SystemConfig	config	/system/config	sys_config	ri:settings-3-line	0	0				f	f	f			f	f	2	1		0	0	1768549363	1768549363
66	60	1	多级菜单	Nested	nested			ri:menu-unfold-3-line	0	0				f	f	f			f	f	10	1	系统-嵌套	0	0	1768549363	1768549363
67	66	2	菜单1	NestedMenu1	menu1	/system/nested/menu1		ri:align-justify	0	0				f	f	f			f	f	77	1	嵌套-1	0	0	1768549363	1768549363
68	66	1	菜单2	NestedMenu2	menu2			ri:align-justify	0	0				f	f	f			f	f	78	1	嵌套-2	0	0	1768549363	1768549363
69	68	2	菜单2-1	NestedMenu2-1	menu2-1	/system/nested/menu2		ri:align-justify	0	0				f	f	f			f	f	79	1	嵌套-2-1	0	0	1768549363	1768549363
70	66	1	菜单3	NestedMenu3	menu3			ri:align-justify	0	0				f	f	f			f	f	80	1	嵌套-3	0	0	1768549363	1768549363
71	70	2	菜单3-1	NestedMenu3-1	menu3-1	/system/nested/menu3			0	0				f	f	f			f	f	81	1	嵌套-3-1	0	0	1768549363	1768549363
72	70	1	菜单3-2	NestedMenu3-2	menu3-2				0	0				f	f	f			f	f	82	1	嵌套-3-2	0	0	1768549363	1768549363
73	72	2	菜单3-2-1	NestedMenu3-2-1	menu3-2-1	/system/nested/menu3/menu3-2			0	0				f	f	f			f	f	83	1	嵌套-3-2-1	0	0	1768549363	1768549363
80	0	1	文档管理	Article	/article	/index/index		ri:book-2-line	0	0				f	f	f			f	f	90	1	文档根	0	0	1768549363	1768549363
81	80	2	文档列表	ArticleList	article-list	/article/list		ri:article-line	0	0				f	f	f			f	f	91	1	文档-列表	0	0	1768549363	1768549363
82	80	2	文档详情	ArticleDetail	detail/:id	/article/detail			0	0				f	f	f			f	f	92	1	文档-详情	0	0	1768549363	1768549363
83	80	2	评论	ArticleComment	comment	/article/comment		ri:mail-line	0	0				f	f	f			f	f	93	1	文档-评论	0	0	1768549363	1768549363
84	80	2	发布	ArticlePublish	publish	/article/publish		ri:telegram-2-line	0	0				f	f	f			f	f	94	1	文档-发布	0	0	1768549363	1768549363
90	0	1	结果页	Result	/result	/index/index		ri:checkbox-circle-line	0	0				f	f	f			f	f	100	1	结果根	0	0	1768549363	1768549363
91	90	2	成功页	ResultSuccess	success	/result/success		ri:checkbox-circle-line	0	0				f	f	f			f	f	101	1	结果-成功	0	0	1768549363	1768549363
92	90	2	失败页	ResultFail	fail	/result/fail		ri:close-circle-line	0	0				f	f	f			f	f	102	1	结果-失败	0	0	1768549363	1768549363
100	0	1	异常页	Exception	/exception	/index/index		ri:error-warning-line	0	0				f	f	f			f	f	110	1	异常根	0	0	1768549363	1768549363
101	100	2	403	Exception403	403	/exception/403			0	0				f	f	f			f	f	111	1	异常-403	0	0	1768549363	1768549363
102	100	2	404	Exception404	404	/exception/404			0	0				f	f	f			f	f	112	1	异常-404	0	0	1768549363	1768549363
103	100	2	500	Exception500	500	/exception/500			0	0				f	f	f			f	f	113	1	异常-500	0	0	1768549363	1768549363
110	0	1	运维管理	Safeguard	/safeguard	/index/index		ri:shield-check-line	0	0				f	f	f			f	f	120	1	运维根	0	0	1768549363	1768549363
111	110	2	服务器监控	SafeguardServer	server	/safeguard/server		ri:hard-drive-3-line	0	1			["GET /admin/monitor/server"]	f	f	f			f	f	121	1	运维-服务器	0	0	1768549363	1770644180
121	0	2	更新日志	ChangeLog	/change/log	/change/log		ri:gamepad-line	0	0				f	f	t	v3.0.1	1	f	f	999	1		0	0	1768549363	1768549363
122	60	2	附件管理	system/attachment	system/attachment	/system/attachment/index	sys_attachment	ep:folder-opened	0	1			\N	f	f	f			f	f	3	1	附件中心与文件管理	0	0	1768549363	1768549363
123	122	3	查看	system/attachment/index					0	0			system:attachment:list	f	f	f			f	f	1	1		0	0	1768549363	1768549363
124	122	3	编辑	system/attachment/edit					0	0			system:attachment:edit	f	f	f			f	f	2	1		0	0	1768549363	1768549363
125	122	3	删除	system/attachment/del					0	0			system:attachment:del	f	f	f			f	f	3	1		0	0	1768549363	1768549363
126	20	2	图标选择器	IconSelector	icon-selector	/widgets/icon-selector		ri:palette-line	0	1				f	f	f			f	f	33	1	图标选择器组件	0	0	1768549363	1768549363
127	20	2	颜色选择器	ColorPicker	color-picker	/widgets/color-picker		ri:palette-fill	0	1				f	f	f			f	f	34	1	颜色选择器组件	0	0	1768549363	1768549363
128	20	2	图片上传	ImageUpload	image-upload	/widgets/image-upload		ri:image-2-line	0	1				f	f	f			f	f	35	1	图片上传组件	0	0	1768549363	1768549363
129	20	2	文件上传	FileUpload	file-upload	/widgets/file-upload		ri:file-upload-line	0	1				f	f	f			f	f	36	1	文件上传组件	0	0	1768549363	1768549363
130	20	2	数组编辑器	ArrayEditor	array-editor	/widgets/array-editor		ri:list-settings-line	0	1				f	f	f			f	f	37	1	多维数组编辑器组件	0	0	1768549363	1768549363
140	0	1	权限管理	Auth	/auth	/index/index		ri:admin-line	0	0				f	f	f			f	f	65	1	权限管理模块	0	0	1768549363	1768549363
141	140	2	部门管理	Dept	dept	/system/dept	admin_dept	ri:organization-chart	0	1				f	f	f			f	f	1	1	组织架构和部门管理	0	0	1768549363	1768549363
142	140	2	岗位管理	Post	post	/system/post	admin_post	ri:briefcase-line	0	1				f	f	f			f	f	2	1	岗位管理（职位字典）	0	0	1768549363	1768549363
143	0	1	会员管理	Member	/member			ri:user-star-line	0	0			\N	f	f	f			f	f	50	1		0	0	1768748969	1768748969
144	143	2	会员列表	MemberList	list	/member/list/index		ri:team-line	0	0			\N	f	f	f			f	f	10	1		0	0	1768748969	1768748969
145	143	3	添加会员	MemberAdd					0	0			\N	f	f	f			f	f	1	1		0	0	1768748969	1768748969
146	143	3	编辑会员	MemberEdit					0	0			\N	f	f	f			f	f	2	1		0	0	1768748969	1768748969
147	143	3	删除会员	MemberDelete					0	0			\N	f	f	f			f	f	3	1		0	0	1768748969	1768748969
148	143	3	重置密码	MemberResetPassword					0	0			\N	f	f	f			f	f	4	1		0	0	1768748969	1768748969
149	143	2	会员分组	MemberGroup	group	/member/group/index	member_group	ri:group-line	0	1			["POST /admin/member/group/list"]	f	f	f			f	f	20	1	会员分组管理	0	0	1768791091	1768791091
150	149	3	新增分组	MemberGroupAdd			member_group		0	0			["POST /admin/member/group/save"]	f	f	f			f	f	1	1	新增会员分组	0	0	1768791091	1768791091
151	149	3	编辑分组	MemberGroupEdit			member_group		0	0			["POST /admin/member/group/save"]	f	f	f			f	f	2	1	编辑会员分组	0	0	1768791091	1768791091
152	149	3	删除分组	MemberGroupDelete			member_group		0	0			["POST /admin/member/group/delete"]	f	f	f			f	f	3	1	删除会员分组	0	0	1768791091	1768791091
153	143	2	会员菜单	MemberMenu	menu	/member/menu/index	member_menu	ri:menu-line	0	1			["GET /admin/member/menu/tree"]	f	f	f			f	f	30	1	会员前台菜单管理	0	0	1768791091	1768791091
154	153	3	新增菜单	MemberMenuAdd			member_menu		0	0			["POST /admin/member/menu/save"]	f	f	f			f	f	1	1	新增会员菜单	0	0	1768791091	1768791091
155	153	3	编辑菜单	MemberMenuEdit			member_menu		0	0			["POST /admin/member/menu/save"]	f	f	f			f	f	2	1	编辑会员菜单	0	0	1768791091	1768791091
156	153	3	删除菜单	MemberMenuDelete			member_menu		0	0			["POST /admin/member/menu/delete"]	f	f	f			f	f	3	1	删除会员菜单	0	0	1768791091	1768791091
157	110	2	登录日志	LoginLog	login-log	/safeguard/login-log	admin_login_log	ri:login-box-line	0	1			["POST /admin/log/login/list"]	f	f	f			f	f	122	1	管理员登录日志	0	0	1770615724	1770615724
158	157	3	删除日志	LoginLogDelete			admin_login_log		0	0			["POST /admin/log/login/delete"]	f	f	f			f	f	1	1	删除登录日志	0	0	1770615724	1770615724
159	157	3	清空日志	LoginLogClear			admin_login_log		0	0			["POST /admin/log/login/clear"]	f	f	f			f	f	2	1	清空登录日志	0	0	1770615724	1770615724
160	110	2	操作日志	OperationLog	operation-log	/safeguard/operation-log	admin_operation_log	ri:file-text-line	0	1			["POST /admin/log/operation/list"]	f	f	f			f	f	123	1	管理员操作日志	0	0	1770615724	1770615724
161	160	3	查看详情	OperationLogDetail			admin_operation_log		0	0			["GET /admin/log/operation/detail"]	f	f	f			f	f	1	1	查看操作日志详情	0	0	1770615724	1770615724
162	160	3	删除日志	OperationLogDelete			admin_operation_log		0	0			["POST /admin/log/operation/delete"]	f	f	f			f	f	2	1	删除操作日志	0	0	1770615724	1770615724
163	160	3	清空日志	OperationLogClear			admin_operation_log		0	0			["POST /admin/log/operation/clear"]	f	f	f			f	f	3	1	清空操作日志	0	0	1770615724	1770615724
164	110	2	性能分析	SafeguardPerformance	performance	/safeguard/performance	admin_operation_log	ri:line-chart-line	0	0				f	f	f			f	f	124	1		0	0	1770644179	1770644179
165	0	1	开发工具	Develop	/develop	/index/index		ri:code-box-line	0	0				f	f	f			f	f	125	1	开发工具目录	0	0	1770648637	1770648637
166	165	2	代码生成器	GenCodes	gen-codes	/develop/gen-codes/index	sys_gen_codes	ri:magic-line	0	1			["GET /admin/genCodes/selects","GET /admin/genCodes/tableSelect","GET /admin/genCodes/columnList","GET /admin/genCodes/list","GET /admin/genCodes/view","POST /admin/genCodes/edit","POST /admin/genCodes/delete","POST /admin/genCodes/preview","POST /admin/genCodes/build","POST /admin/genCodes/createTable"]	f	f	f			f	f	1	1	代码生成器	0	0	1770648637	1770648637
202	110	2	函数分析	PprofAnalysis	pprof	/safeguard/pprof/index		ri:code-s-slash-line	0	1			["GET /admin/monitor/pprof-top"]	f	f	f			f	f	125	1	函数级CPU/内存热点分析(pprof)	0	0	1770702712	1770702712
220	60	2	通知管理	Notice	notice	/system/notice/index	admin_notice	ri:notification-3-line	0	1			["POST /admin/notice/list"]	f	f	f			f	f	4	1	通知消息管理	0	0	1770700000	1770700000
221	220	3	查看	NoticeView			admin_notice		0	0			["POST /admin/notice/list"]	f	f	f			f	f	1	1	查看通知列表	0	0	1770700000	1770700000
222	220	3	发布/编辑	NoticeEdit			admin_notice		0	0			["POST /admin/notice/edit"]	f	f	f			f	f	2	1	发布或编辑通知	0	0	1770700000	1770700000
223	220	3	删除	NoticeDelete			admin_notice		0	0			["POST /admin/notice/delete"]	f	f	f			f	f	3	1	删除通知	0	0	1770700000	1770700000
240	60	2	定时任务	CronManage	cron	/system/cron/index	sys_cron	ri:timer-line	0	1				f	f	f			f	f	80	1	定时任务管理	0	0	1770717535	1770717535
241	240	3	查看	CronView					0	0			GET /admin/cron/list	f	f	f			f	f	0	1		0	0	1770717535	1770717535
242	240	3	新增/编辑	CronEdit					0	0			POST /admin/cron/save	f	f	f			f	f	0	1		0	0	1770717535	1770717535
243	240	3	删除	CronDelete					0	0			POST /admin/cron/delete	f	f	f			f	f	0	1		0	0	1770717535	1770717535
244	240	3	在线执行	CronOnlineExec					0	0			POST /admin/cron/onlineExec	f	f	f			f	f	0	1		0	0	1770717535	1770717535
250	60	2	消息队列	QueueManage	queue	/system/queue/index		ri:stack-line	0	1				f	f	f			f	f	85	1	消息队列管理	0	0	1770719034	1770719034
418	143	2	登录日志	MemberLoginLog	member-login-log	/member/member-login-log/index		ri:file-list-line	0	1			["GET /admin/member-login-log/list"]	f	f	f			f	f	100	1		0	0	1770873777	1770873777
419	418	3	查看登录日志	MemberLoginLogView					0	0			["GET /admin/member-login-log/view"]	f	f	f			f	f	1	1		0	0	1770873777	1770873777
420	143	2	登录日志详情	MemberLoginLogDetail	member-login-log/detail	/member/member-login-log/detail/index			1	0			["GET /admin/member-login-log/view"]	f	f	f		/member-login-log	f	f	0	1		0	0	1770873777	1770873777
421	418	3	删除登录日志	MemberLoginLogDelete					0	0			["POST /admin/member-login-log/delete"]	f	f	f			f	f	4	1		0	0	1770873777	1770873777
422	418	3	导出登录日志	MemberLoginLogExport					0	0			["GET /admin/member-login-log/export"]	f	f	f			f	f	5	1		0	0	1770873777	1770873777
511	143	2	余额变动日志	MemberMoneyLog	member-money-log	/member/member-money-log/index		ri:file-list-line	0	1			["GET /admin/member-money-log/list"]	f	f	f			f	f	100	1		0	0	1770881561	1770881561
512	511	3	查看余额变动日志	MemberMoneyLogView					0	0			["GET /admin/member-money-log/view"]	f	f	f			f	f	1	1		0	0	1770881561	1770881561
513	511	3	新增余额变动日志	MemberMoneyLogAdd					0	0			["POST /admin/member-money-log/edit"]	f	f	f			f	f	2	1		0	0	1770881561	1770881561
514	511	3	编辑余额变动日志	MemberMoneyLogEdit					0	0			["POST /admin/member-money-log/edit","GET /admin/member-money-log/view"]	f	f	f			f	f	3	1		0	0	1770881561	1770881561
515	511	3	删除余额变动日志	MemberMoneyLogDelete					0	0			["POST /admin/member-money-log/delete"]	f	f	f			f	f	4	1		0	0	1770881561	1770881561
516	511	3	导出余额变动日志	MemberMoneyLogExport					0	0			["GET /admin/member-money-log/export"]	f	f	f			f	f	5	1		0	0	1770881561	1770881561
517	143	2	积分变动日志	MemberScoreLog	member-score-log	/member/member-score-log/index		ri:file-list-line	0	1			["GET /admin/member-score-log/list"]	f	f	f			f	f	100	1		0	0	1770881700	1770881700
617	143	2	会员通知	MemberNotice	member-notice	/member/member-notice/index		ri:notification-line	0	1			["GET /admin/member-notice/list"]	f	f	f			f	f	100	1		0	0	1770904531	1770904531
618	617	3	查看会员通知	MemberNoticeView					0	0			["GET /admin/member-notice/view"]	f	f	f			f	f	1	1		0	0	1770904531	1770904531
619	617	3	新增会员通知	MemberNoticeAdd					0	0			["POST /admin/member-notice/edit"]	f	f	f			f	f	2	1		0	0	1770904531	1770904531
620	617	3	编辑会员通知	MemberNoticeEdit					0	0			["POST /admin/member-notice/edit","GET /admin/member-notice/view"]	f	f	f			f	f	3	1		0	0	1770904531	1770904531
621	617	3	删除会员通知	MemberNoticeDelete					0	0			["POST /admin/member-notice/delete"]	f	f	f			f	f	4	1		0	0	1770904531	1770904531
622	617	3	导出会员通知	MemberNoticeExport					0	0			["GET /admin/member-notice/export"]	f	f	f			f	f	5	1		0	0	1770904531	1770904531
\.


--
-- Data for Name: xy_admin_notice; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_notice (id, title, type, content, tag, sender_id, receiver_id, status, sort, remark, read_count, created_at, updated_at) FROM stdin;
1	test a notify	t	我来了	info	1	0	t	0		2	1770706024	1770708972
1	test a notify	t	我来了	info	1	0	t	0		2	1770706024	1770708972
\.


--
-- Data for Name: xy_admin_notice_read; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_notice_read (id, notice_id, user_id, read_at) FROM stdin;
1	1	1	1770706027
2	1	2	1770708972
1	1	1	1770706027
2	1	2	1770708972
\.


--
-- Data for Name: xy_admin_operation_log; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_operation_log (id, user_id, username, module, title, method, url, ip, location, user_agent, request_body, response_body, error_message, status, elapsed, created_at) FROM stdin;
831	1	admin	操作日志	清空日志	POST	/admin/log/operation/clear	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	111	1770909791
832	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	30	1770909794
833	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	176	1770909794
834	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770909800
835	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770909800
836	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770909808
837	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	1	1770909808
838	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770909880
839	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770909880
840	1	admin	登录日志	清空日志	POST	/admin/log/login/clear	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	109	1770909944
841	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	11	1770909994
842	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	17	1770909994
843	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	8	1770910322
844	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	6	1770910322
845	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	11	1770910322
846	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	7	1770910322
847	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770910353
848	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770910353
849	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910356
850	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	7	1770910356
851	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770910357
852	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770910357
853	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	4	1770910370
854	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	5	1770910370
855	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	13	1770910370
856	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	12	1770910370
857	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770910387
858	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770910387
859	1	admin	menu	POST /admin/menu/save	POST	/admin/menu/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":164,"parentId":110,"type":2,"title":"性能分析","name":"SafeguardPerformance","path":"performance","component":"/safeguard/performance","icon":"ri:line-chart-line","resource":"admin_operation_log","hidden":0,"hideTab":0,"keepAlive":0,"redirect":"","frameSrc":"","perms":"","isFrame":0,"affix":0,"showBadge":0,"badgeText":"","activePath":"","isFullPage":0,"sort":124,"status":1,"remark":""}			t	94	1770910442
860	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910448
861	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770910448
862	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910471
863	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770910472
864	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910477
865	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	17	1770910477
866	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910481
867	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770910481
868	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770910485
869	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770910485
870	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770910509
871	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770910509
872	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910511
873	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	1	1770910511
874	1	admin	会员通知	编辑会员通知	POST	/admin/member-notice/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"title":"test a notify","content":"<p>这是一个测试通知</p>","type":"system","target":"all","targetId":0,"sender":"Xygo","status":1}			t	59	1770910671
875	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":39,"deleteFiles":true,"deleteMenus":true}			t	139	1770911898
876	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":38,"deleteFiles":true,"deleteMenus":true}			t	75	1770911907
899	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912670
900	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912670
877	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			t	12	1770911986
878	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			t	59	1770911988
879	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			t	636	1770911989
880	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	15	1770911998
881	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":68,"deleteFiles":true,"deleteMenus":true}		DELETE FROM `xy_sys_gen_codes` WHERE `id`=68: context canceled	f	132	1770912378
882	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			t	16	1770912448
901	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	3	1770912755
902	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912755
903	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912760
904	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912760
883	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			t	76	1770912450
884	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			t	564	1770912451
885	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	15	1770912461
886	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	3	1770912511
887	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770912511
888	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912525
889	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912525
890	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770912528
891	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770912528
892	1	admin	menu	POST /admin/menu/save	POST	/admin/menu/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":164,"parentId":110,"type":2,"title":"性能分析","name":"SafeguardPerformance","path":"performance","component":"/safeguard/performance","icon":"ri:line-chart-line","resource":"admin_operation_log","hidden":0,"hideTab":0,"keepAlive":0,"redirect":"","frameSrc":"","perms":"","isFrame":0,"affix":0,"showBadge":0,"badgeText":"","activePath":"","isFullPage":0,"sort":124,"status":1,"remark":""}			t	3	1770912625
893	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770912649
894	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770912649
895	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912654
896	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770912654
897	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770912659
898	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912659
905	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912765
906	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912765
907	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912768
908	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770912768
909	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770912807
910	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912807
911	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912811
912	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912811
913	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912816
914	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912816
915	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912830
916	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912830
917	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770913038
918	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770913038
919	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770913041
920	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770913041
921	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":68,"deleteFiles":true,"deleteMenus":true}			t	163	1770913411
831	1	admin	操作日志	清空日志	POST	/admin/log/operation/clear	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	111	1770909791
832	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	30	1770909794
833	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	176	1770909794
834	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770909800
835	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770909800
836	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770909808
837	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	1	1770909808
838	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770909880
839	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770909880
840	1	admin	登录日志	清空日志	POST	/admin/log/login/clear	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	109	1770909944
841	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	11	1770909994
842	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	17	1770909994
843	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	8	1770910322
844	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	6	1770910322
845	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	11	1770910322
846	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	7	1770910322
847	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770910353
848	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770910353
849	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910356
850	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	7	1770910356
851	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770910357
852	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770910357
853	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	4	1770910370
854	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	5	1770910370
855	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	13	1770910370
856	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	12	1770910370
857	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770910387
858	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770910387
859	1	admin	menu	POST /admin/menu/save	POST	/admin/menu/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":164,"parentId":110,"type":2,"title":"性能分析","name":"SafeguardPerformance","path":"performance","component":"/safeguard/performance","icon":"ri:line-chart-line","resource":"admin_operation_log","hidden":0,"hideTab":0,"keepAlive":0,"redirect":"","frameSrc":"","perms":"","isFrame":0,"affix":0,"showBadge":0,"badgeText":"","activePath":"","isFullPage":0,"sort":124,"status":1,"remark":""}			t	94	1770910442
860	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910448
861	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770910448
862	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910471
863	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770910472
864	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910477
865	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	17	1770910477
866	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910481
867	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770910481
868	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770910485
869	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770910485
870	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770910509
871	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770910509
872	1	admin	运维管理	性能分析	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770910511
873	1	admin	运维管理	性能分析	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	1	1770910511
874	1	admin	会员通知	编辑会员通知	POST	/admin/member-notice/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"title":"test a notify","content":"<p>这是一个测试通知</p>","type":"system","target":"all","targetId":0,"sender":"Xygo","status":1}			t	59	1770910671
875	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":39,"deleteFiles":true,"deleteMenus":true}			t	139	1770911898
876	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":38,"deleteFiles":true,"deleteMenus":true}			t	75	1770911907
899	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912670
900	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912670
877	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			t	12	1770911986
905	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912765
906	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912765
907	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912768
878	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			t	59	1770911988
879	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member_login_log\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"username\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"member_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"user_agent\\\\\\",\\\\\\"label\\\\\\":\\\\\\"User-Agent\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"message\\\\\\",\\\\\\"label\\\\\\":\\\\\\"提示信息\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"created_at\\\\\\",\\\\\\"label\\\\\\":\\\\\\"创建时间\\\\\\",\\\\\\"inList\\\\\\":true,\\\\\\"inSearch\\\\\\":true,\\\\\\"inExport\\\\\\":true,\\\\\\"searchType\\\\\\":\\\\\\"between\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"datetimerange\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"}]\\",\\"relation-fields\\":\\"created_at\\",\\"relation-search-fields\\":\\"created_at\\",\\"relation-export-fields\\":\\"created_at\\"},\\"_tableProps\\":{\\"render\\":\\"none\\",\\"operator\\":\\"eq\\",\\"sortable\\":\\"false\\"}}","dictType":"","sort":3}]}			t	636	1770911989
880	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	15	1770911998
881	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":68,"deleteFiles":true,"deleteMenus":true}		DELETE FROM `xy_sys_gen_codes` WHERE `id`=68: context canceled	f	132	1770912378
882	1	admin	开发工具	代码生成器	POST	/admin/genCodes/preview	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			t	16	1770912448
901	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	3	1770912755
902	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912755
903	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912760
904	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912760
908	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770912768
909	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770912807
910	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912807
911	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912811
883	1	admin	开发工具	代码生成器	POST	/admin/genCodes/edit	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			t	76	1770912450
884	1	admin	开发工具	代码生成器	POST	/admin/genCodes/build	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":0,"genType":10,"dbName":"","tableName":"xy_test_code","tableComment":"测试生成","varName":"TestCode","options":"{\\"genType\\":10,\\"headOps\\":[\\"add\\",\\"batchDel\\",\\"export\\"],\\"columnOps\\":[\\"edit\\",\\"del\\",\\"view\\",\\"status\\",\\"check\\"],\\"autoOps\\":[\\"genMenuPermissions\\",\\"runDao\\",\\"runService\\"],\\"viewMode\\":\\"drawer\\",\\"apiPrefix\\":\\"\\",\\"genPaths\\":{},\\"menu\\":{\\"pid\\":0,\\"icon\\":\\"ri:file-list-line\\",\\"sort\\":100},\\"tree\\":{\\"titleColumn\\":\\"name\\",\\"pidColumn\\":\\"parent_id\\"}}","columns":[{"id":0,"genId":0,"name":"id","goName":"Id","tsName":"id","dbType":"bigint(20) unsigned","goType":"uint64","tsType":"number","comment":"主键","isPk":1,"isRequired":0,"isList":1,"isEdit":0,"isQuery":0,"queryType":"eq","formType":"input","designType":"pk","extra":"","dictType":"","sort":1},{"id":0,"genId":0,"name":"name","goName":"Name","tsName":"name","dbType":"varchar(100)","goType":"string","tsType":"string","comment":"名称","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":1,"queryType":"like","formType":"input","designType":"string","extra":"","dictType":"","sort":2},{"id":0,"genId":0,"name":"member_id","goName":"MemberId","tsName":"memberId","dbType":"int(10) unsigned","goType":"uint","tsType":"number","comment":"关联ID","isPk":0,"isRequired":1,"isList":1,"isEdit":1,"isQuery":0,"queryType":"eq","formType":"remoteSelect","designType":"remoteSelect","extra":"{\\"_formProps\\":{\\"validator\\":[],\\"validatorMsg\\":\\"\\",\\"remote-table\\":\\"xy_member\\",\\"remote-pk\\":\\"id\\",\\"remote-field\\":\\"nickname\\",\\"relation-fields-config\\":\\"[{\\\\\\"field\\\\\\":\\\\\\"id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"username\\\\\\",\\\\\\"label\\\\\\":\\\\\\"用户名\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"password\\\\\\",\\\\\\"label\\\\\\":\\\\\\"密码（bcrypt加密）\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"mobile\\\\\\",\\\\\\"label\\\\\\":\\\\\\"手机号\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"email\\\\\\",\\\\\\"label\\\\\\":\\\\\\"邮箱\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"nickname\\\\\\",\\\\\\"label\\\\\\":\\\\\\"昵称\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"avatar\\\\\\",\\\\\\"label\\\\\\":\\\\\\"头像\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"gender\\\\\\",\\\\\\"label\\\\\\":\\\\\\"性别\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"birthday\\\\\\",\\\\\\"label\\\\\\":\\\\\\"生日\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"money\\\\\\",\\\\\\"label\\\\\\":\\\\\\"余额\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"score\\\\\\",\\\\\\"label\\\\\\":\\\\\\"积分\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"level\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员等级\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"group_id\\\\\\",\\\\\\"label\\\\\\":\\\\\\"会员分组ID\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"status\\\\\\",\\\\\\"label\\\\\\":\\\\\\"状态\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchComponent\\\\\\":\\\\\\"input\\\\\\",\\\\\\"listRender\\\\\\":\\\\\\"text\\\\\\"},{\\\\\\"field\\\\\\":\\\\\\"last_login_ip\\\\\\",\\\\\\"label\\\\\\":\\\\\\"最后登录IP\\\\\\",\\\\\\"inList\\\\\\":false,\\\\\\"inSearch\\\\\\":false,\\\\\\"inExport\\\\\\":false,\\\\\\"searchType\\\\\\":\\\\\\"like\\\\\\",\\\\\\"searchCompo...(truncated)			t	564	1770912451
885	1	admin	genCodes	POST /admin/genCodes/publishFrontend	POST	/admin/genCodes/publishFrontend	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0				t	15	1770912461
886	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	3	1770912511
887	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770912511
888	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912525
889	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912525
890	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	0	1770912528
891	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770912528
892	1	admin	menu	POST /admin/menu/save	POST	/admin/menu/save	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":164,"parentId":110,"type":2,"title":"性能分析","name":"SafeguardPerformance","path":"performance","component":"/safeguard/performance","icon":"ri:line-chart-line","resource":"admin_operation_log","hidden":0,"hideTab":0,"keepAlive":0,"redirect":"","frameSrc":"","perms":"","isFrame":0,"affix":0,"showBadge":0,"badgeText":"","activePath":"","isFullPage":0,"sort":124,"status":1,"remark":""}			t	3	1770912625
893	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770912649
894	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770912649
895	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912654
896	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	2	1770912654
897	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770912659
898	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912659
912	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770912811
913	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912816
914	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912816
915	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770912830
916	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	5	1770912830
917	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	2	1770913038
918	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	4	1770913038
919	1	admin	monitor	POST /admin/monitor/slow-top	POST	/admin/monitor/slow-top	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12","limit":20}			t	1	1770913041
920	1	admin	monitor	POST /admin/monitor/stats	POST	/admin/monitor/stats	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"startDate":"2026-02-12","endDate":"2026-02-12"}			t	3	1770913041
921	1	admin	开发工具	代码生成器	POST	/admin/genCodes/delete	127.0.0.1	本机	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	{"id":68,"deleteFiles":true,"deleteMenus":true}			t	163	1770913411
\.


--
-- Data for Name: xy_admin_post; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_post (id, code, name, sort, status, remark, created_by, updated_by, create_time, update_time) FROM stdin;
1	CEO	董事长	1	1	公司最高管理者	0	0	1768556833	1768556833
2	CTO	技术总监	2	1	技术部门负责人	0	0	1768556833	1768556833
3	CFO	财务总监	3	1	财务部门负责人	0	0	1768556833	1768556833
4	PM	产品经理	4	1	产品规划与设计	0	0	1768556833	1768556833
5	DEV	开发工程师	5	1	软件开发	0	0	1768556833	1768556833
6	QA	测试工程师	6	1	质量保证	0	0	1768556833	1768556833
7	UI	UI设计师	7	1	用户界面设计	0	0	1768556833	1768556833
1	CEO	董事长	1	1	公司最高管理者	0	0	1768556833	1768556833
2	CTO	技术总监	2	1	技术部门负责人	0	0	1768556833	1768556833
3	CFO	财务总监	3	1	财务部门负责人	0	0	1768556833	1768556833
4	PM	产品经理	4	1	产品规划与设计	0	0	1768556833	1768556833
5	DEV	开发工程师	5	1	软件开发	0	0	1768556833	1768556833
6	QA	测试工程师	6	1	质量保证	0	0	1768556833	1768556833
7	UI	UI设计师	7	1	用户界面设计	0	0	1768556833	1768556833
\.


--
-- Data for Name: xy_admin_role; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_role (id, name, key, data_scope, custom_depts, pid, level, tree, sort, status, remark, created_by, updated_by, create_time, update_time) FROM stdin;
1	超级管理员	super_admin	0	[]	0	1	0	0	1	系统内置超级管理员11	1	0	1768560139	1768560139
2	运维管理员	ops_admin	2	[]	1	2	0,1	0	1	负责运维与系统配置	1	0	1768560139	1768560139
3	业务管理员	biz_admin	1	[]	1	2	0,1	0	1	负责业务数据管理	1	0	1768560139	1768560139
4	访客	viewer	3		3	3	0,1,3	0	1	只读访问权限	1	0	1768560139	1768560139
5	测试二号管理员	node_add	0	[]	1	2	0,1	0	1	一个测试管理员	0	0	1768560139	1768560139
1	超级管理员	super_admin	0	[]	0	1	0	0	1	系统内置超级管理员11	1	0	1768560139	1768560139
2	运维管理员	ops_admin	2	[]	1	2	0,1	0	1	负责运维与系统配置	1	0	1768560139	1768560139
3	业务管理员	biz_admin	1	[]	1	2	0,1	0	1	负责业务数据管理	1	0	1768560139	1768560139
4	访客	viewer	3		3	3	0,1,3	0	1	只读访问权限	1	0	1768560139	1768560139
5	测试二号管理员	node_add	0	[]	1	2	0,1	0	1	一个测试管理员	0	0	1768560139	1768560139
\.


--
-- Data for Name: xy_admin_role_menu; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_role_menu (role_id, menu_id) FROM stdin;
2	1
4	1
2	2
4	2
2	3
4	3
2	4
4	4
4	61
2	80
2	81
2	82
2	83
2	84
2	110
2	111
4	122
4	123
4	124
4	125
4	141
2	144
2	157
2	158
2	159
2	160
2	161
2	162
2	163
2	164
2	202
2	1
4	1
2	2
4	2
2	3
4	3
2	4
4	4
4	61
2	80
2	81
2	82
2	83
2	84
2	110
2	111
4	122
4	123
4	124
4	125
4	141
2	144
2	157
2	158
2	159
2	160
2	161
2	162
2	163
2	164
2	202
\.


--
-- Data for Name: xy_admin_user; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_user (id, username, nickname, real_name, password, gender, salt, mobile, address, remark, email, avatar, dept_id, pid, is_super, status, last_login_at, last_login_ip, created_by, updated_by, create_time, update_time) FROM stdin;
1	admin	超级管理员	系统管理员	e10adc3949ba59abbe56e057f20f883e	t		15524812851	辽宁省-大连市-开发区	一个又懒又爱又帅气得男人	751300685@qq.com	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp	0	0	1	1	\N		0	0	1768575212	1768575212
2	admin2	测试用户2	\N	7e8bc594d2dfd02d6ba7b51aa34d839e	t	AwDVkR	15241328852	\N	\N	aaaa@qq.com		2	0	0	1	\N		1	1	1770708367	1770708956
3	testzong	测试总公司	\N	222ea6a32ab043cf11315020d5a828f9	t	eSDG3M	13895281214	\N	\N	aaa@qq.com		1	0	0	1	\N		1	1	1770711284	1770711284
4	xingxing	星韵	\N	38a82d3031b16b189ef047fdd897c331	t	6lmWUd	13898521473	\N	\N	bbb@qq.com	/attachment/upload/20260210/0a27edcc-e96c-4b2e-95f9-b69c772cde82.webp	5	0	0	1	\N		1	1	1770711602	1770711828
1	admin	超级管理员	系统管理员	e10adc3949ba59abbe56e057f20f883e	t		15524812851	辽宁省-大连市-开发区	一个又懒又爱又帅气得男人	751300685@qq.com	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp	0	0	1	1	\N		0	0	1768575212	1768575212
2	admin2	测试用户2	\N	7e8bc594d2dfd02d6ba7b51aa34d839e	t	AwDVkR	15241328852	\N	\N	aaaa@qq.com		2	0	0	1	\N		1	1	1770708367	1770708956
3	testzong	测试总公司	\N	222ea6a32ab043cf11315020d5a828f9	t	eSDG3M	13895281214	\N	\N	aaa@qq.com		1	0	0	1	\N		1	1	1770711284	1770711284
4	xingxing	星韵	\N	38a82d3031b16b189ef047fdd897c331	t	6lmWUd	13898521473	\N	\N	bbb@qq.com	/attachment/upload/20260210/0a27edcc-e96c-4b2e-95f9-b69c772cde82.webp	5	0	0	1	\N		1	1	1770711602	1770711828
\.


--
-- Data for Name: xy_admin_user_post; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_user_post (user_id, post_id) FROM stdin;
2	2
3	1
4	2
2	2
3	1
4	2
\.


--
-- Data for Name: xy_admin_user_role; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_admin_user_role (user_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
1	1
2	1
3	1
4	1
\.


--
-- Data for Name: xy_captcha; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_captcha (id, key, code, captcha, create_time, expire_time) FROM stdin;
\.


--
-- Data for Name: xy_demo_article; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_demo_article (id, category_id, title, cover, summary, content, author, views, sort, status, created_at, updated_at) FROM stdin;
1	3	Vue3 组合式API指南	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp			张三	100	1	t	1770653552	1770868163
2	4	GoFrame 入门教程	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp			李四	200	2	t	1770653552	1770868156
3	5	家常菜做法	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp			王五	50	3	t	1770653552	1770868145
1	3	Vue3 组合式API指南	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp			张三	100	1	t	1770653552	1770868163
2	4	GoFrame 入门教程	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp			李四	200	2	t	1770653552	1770868156
3	5	家常菜做法	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp			王五	50	3	t	1770653552	1770868145
\.


--
-- Data for Name: xy_demo_category; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_demo_category (id, parent_id, name, icon, sort, status, remark, created_at, updated_at) FROM stdin;
1	0	技术	ri:dashboard-fill	1	t	技术类文章	1770653552	1770812776
2	0	生活	ri:heart-line	2	t	生活类文章	1770653552	1770653552
3	1	前端	ri:html5-line	1	t	前端技术	1770653552	1770653552
4	1	后端	ri:server-line	2	t	后端技术	1770653552	1770653552
5	2	美食	ri:restaurant-line	1	t	美食分享	1770653552	1770653552
1	0	技术	ri:dashboard-fill	1	t	技术类文章	1770653552	1770812776
2	0	生活	ri:heart-line	2	t	生活类文章	1770653552	1770653552
3	1	前端	ri:html5-line	1	t	前端技术	1770653552	1770653552
4	1	后端	ri:server-line	2	t	后端技术	1770653552	1770653552
5	2	美食	ri:restaurant-line	1	t	美食分享	1770653552	1770653552
\.


--
-- Data for Name: xy_member; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member (id, username, password, mobile, email, nickname, avatar, gender, birthday, money, score, level, group_id, status, last_login_ip, last_login_at, login_count, created_at, updated_at, deleted_at) FROM stdin;
1	z312193608	$2a$10$ZP7cMjrRWrNJhgT3c5aJH.NC4FrXRTDnPSSS9NdzeLPBocvUTb/0q		751300685@qq.com	z312193608	/attachment/upload/20260212/cc679f09-57e9-4c35-9054-65e4afde8cd3.png	f	\N	0.00	11	1	1	t	127.0.0.1	1770909732	11	1770908432	1770913381	0
1	z312193608	$2a$10$ZP7cMjrRWrNJhgT3c5aJH.NC4FrXRTDnPSSS9NdzeLPBocvUTb/0q		751300685@qq.com	z312193608	/attachment/upload/20260212/cc679f09-57e9-4c35-9054-65e4afde8cd3.png	f	\N	0.00	11	1	1	t	127.0.0.1	1770909732	11	1770908432	1770913381	0
\.


--
-- Data for Name: xy_member_checkin; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_checkin (id, member_id, checkin_date, score, continuous_days, created_at) FROM stdin;
1	1	\N	5	1	\N
2	1	1770910155	4	1	1770910155
3	1	1770913381	2	2	1770913381
1	1	\N	5	1	\N
2	1	1770910155	4	1	1770910155
3	1	1770913381	2	2	1770913381
\.


--
-- Data for Name: xy_member_group; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_group (id, name, rules, status, sort, remark, created_at, updated_at) FROM stdin;
1	普通会员	*	t	0	默认分组	1770908749	1770908749
2	VIP会员	1,2,3,4,5	t	10	VIP用户	1770908749	1770908749
1	普通会员	*	t	0	默认分组	1770908749	1770908749
2	VIP会员	1,2,3,4,5	t	10	VIP用户	1770908749	1770908749
\.


--
-- Data for Name: xy_member_login_log; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_login_log (id, member_id, username, ip, user_agent, status, message, created_at) FROM stdin;
1	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
2	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	密码错误	1770908749
3	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
4	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	验证码错误	1770908749
5	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
6	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
7	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
10	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	t	登录成功	1770908749
11	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
12	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	验证码错误	1770908749
13	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
14	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
15	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	用户名或密码错误	1770908749
16	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	用户名或密码错误	1770908749
17	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	用户名或密码错误	1770908749
18	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	0
19	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770909732
1	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
2	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	密码错误	1770908749
3	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
4	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	验证码错误	1770908749
5	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
6	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
7	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
10	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36	t	登录成功	1770908749
11	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
12	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	验证码错误	1770908749
13	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
14	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770908749
15	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	用户名或密码错误	1770908749
16	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	用户名或密码错误	1770908749
17	0	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	f	用户名或密码错误	1770908749
18	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	0
19	1	z312193608	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0	t	登录成功	1770909732
\.


--
-- Data for Name: xy_member_menu; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_menu (id, pid, title, name, path, component, icon, menu_type, url, no_login_valid, extend, remark, type, permission, sort, status, created_at, updated_at) FROM stdin;
1	0	文档	docs	/docs	docs/index	ri:book-open-line	tab		t	none		nav		10	t	\N	\N
2	0	案例	cases	/cases	cases/index	ri:slideshow-line	tab		t	none		nav		20	t	\N	\N
3	0	社区	community	/community	community/index	ri:discuss-line	tab		t	none		nav		30	t	\N	\N
4	0	我的账户	account	/user		ri:user-line	tab		f	none		menu_dir		100	t	\N	\N
5	4	账户概览	overview	/user/overview	member/center	ri:home-4-line	tab		f	none		menu		101	t	\N	\N
6	4	每日签到	checkin	/user/checkin	member/center	ri:calendar-check-line	tab		f	none		menu		102	t	\N	\N
7	4	个人资料	profile	/user/profile	member/center	ri:user-line	tab		f	none		menu		103	t	\N	\N
8	4	修改密码	password	/user/password	member/center	ri:shield-keyhole-line	tab		f	none		menu		104	t	\N	\N
9	4	积分记录	points	/user/points	member/center	ri:copper-coin-line	tab		f	none		menu		105	t	\N	\N
10	4	余额记录	balance	/user/balance	member/center	ri:wallet-3-line	tab		f	none		menu		106	t	\N	\N
11	4	系统通知	notification	/user/notification	member/center	ri:notification-3-line	tab		f	none		menu		107	t	\N	\N
1	0	文档	docs	/docs	docs/index	ri:book-open-line	tab		t	none		nav		10	t	\N	\N
2	0	案例	cases	/cases	cases/index	ri:slideshow-line	tab		t	none		nav		20	t	\N	\N
3	0	社区	community	/community	community/index	ri:discuss-line	tab		t	none		nav		30	t	\N	\N
4	0	我的账户	account	/user		ri:user-line	tab		f	none		menu_dir		100	t	\N	\N
5	4	账户概览	overview	/user/overview	member/center	ri:home-4-line	tab		f	none		menu		101	t	\N	\N
6	4	每日签到	checkin	/user/checkin	member/center	ri:calendar-check-line	tab		f	none		menu		102	t	\N	\N
7	4	个人资料	profile	/user/profile	member/center	ri:user-line	tab		f	none		menu		103	t	\N	\N
8	4	修改密码	password	/user/password	member/center	ri:shield-keyhole-line	tab		f	none		menu		104	t	\N	\N
9	4	积分记录	points	/user/points	member/center	ri:copper-coin-line	tab		f	none		menu		105	t	\N	\N
10	4	余额记录	balance	/user/balance	member/center	ri:wallet-3-line	tab		f	none		menu		106	t	\N	\N
11	4	系统通知	notification	/user/notification	member/center	ri:notification-3-line	tab		f	none		menu		107	t	\N	\N
\.


--
-- Data for Name: xy_member_money_log; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_money_log (id, member_id, money, before, after, memo, created_at) FROM stdin;
\.


--
-- Data for Name: xy_member_notice; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_notice (id, title, content, type, target, target_id, sender, status, created_at) FROM stdin;
1	欢迎使用 XYGo Admin	感谢您注册成为我们的会员！您可以在会员中心管理个人信息、查看积分和余额变动记录。每天记得签到领取积分哦！	system	all	0	系统	t	1770908749
2	每日签到功能上线	全新的每日签到功能现已上线！每日签到可获得随机积分奖励，连续签到天数越多，奖励越丰厚。快来试试吧！	feature	all	0	系统	t	1770908749
3	test a notify	<p>这是一个测试通知</p>	system	all	0	Xygo	t	1770910671
1	欢迎使用 XYGo Admin	感谢您注册成为我们的会员！您可以在会员中心管理个人信息、查看积分和余额变动记录。每天记得签到领取积分哦！	system	all	0	系统	t	1770908749
2	每日签到功能上线	全新的每日签到功能现已上线！每日签到可获得随机积分奖励，连续签到天数越多，奖励越丰厚。快来试试吧！	feature	all	0	系统	t	1770908749
3	test a notify	<p>这是一个测试通知</p>	system	all	0	Xygo	t	1770910671
\.


--
-- Data for Name: xy_member_notice_read; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_notice_read (id, notice_id, member_id, read_at) FROM stdin;
1	2	1	\N
2	1	1	\N
3	3	1	1770910685
1	2	1	\N
2	1	1	\N
3	3	1	1770910685
\.


--
-- Data for Name: xy_member_score_log; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_member_score_log (id, member_id, score, before, after, memo, created_at) FROM stdin;
1	1	5	0	5	每日签到奖励	1770908749
2	1	4	5	9	每日签到奖励	1770910155
3	1	2	9	11	每日签到奖励	1770913381
1	1	5	0	5	每日签到奖励	1770908749
2	1	4	5	9	每日签到奖励	1770910155
3	1	2	9	11	每日签到奖励	1770913381
\.


--
-- Data for Name: xy_sys_attachment; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_sys_attachment (id, topic, user_id, url, width, height, name, size, mimetype, quote, storage, sha1, create_time, update_time) FROM stdin;
2	image	1	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp	0	0	单独logo (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1768618131	1768618131
3	image	1	/attachment/upload/20260210/b17249d2-0d9d-496d-a6a5-1c9c2c603459.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770710651	1770710651
4	image	1	/attachment/upload/20260210/19c3332f-d5db-44f6-bb69-c406e7f4c974.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711566	1770711566
5	image	1	/attachment/upload/20260210/5d77559d-27e2-4bec-8ed3-c4ea22f4e032.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711611	1770711611
6	image	1	/attachment/upload/20260210/e1469abb-5c58-42a1-b487-4f07d4efcfd2.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711730	1770711730
7	image	1	/attachment/upload/20260210/0a27edcc-e96c-4b2e-95f9-b69c772cde82.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711822	1770711822
8	image	1	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770738480	1770738480
2	image	1	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp	0	0	单独logo (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1768618131	1768618131
3	image	1	/attachment/upload/20260210/b17249d2-0d9d-496d-a6a5-1c9c2c603459.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770710651	1770710651
4	image	1	/attachment/upload/20260210/19c3332f-d5db-44f6-bb69-c406e7f4c974.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711566	1770711566
5	image	1	/attachment/upload/20260210/5d77559d-27e2-4bec-8ed3-c4ea22f4e032.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711611	1770711611
6	image	1	/attachment/upload/20260210/e1469abb-5c58-42a1-b487-4f07d4efcfd2.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711730	1770711730
7	image	1	/attachment/upload/20260210/0a27edcc-e96c-4b2e-95f9-b69c772cde82.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770711822	1770711822
8	image	1	/attachment/upload/20260210/2c2ddd0e-e4b2-4b76-ba31-1d992de4e0d7.webp	0	0	单独logo (1) (1).webp	4138	image/webp	1	local	b58012c1219a7a5f09248f01d73daa8cd077f597	1770738480	1770738480
\.


--
-- Data for Name: xy_sys_config; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_sys_config (id, "group", group_name, name, key, value, type, options, rules, sort, remark, allow_del, created_by, updated_by, create_time, update_time) FROM stdin;
1	basics	基础设置	站点名称	site_name	XYGo Admin	text	\N	{"max": 50, "required": true}	10	后台标题/LOGO文字	f	0	0	0	1770737799
2	basics	基础设置	站点副标题	site_subtitle	下一代 GoFrame 管理后台	text	\N	{"max": 100}	11	登录页/浏览器标题副文案	f	0	0	0	1770737799
3	basics	基础设置	ICP备案号	site_icp	粤ICP备000000号	text	\N	{"max": 50}	20	展示在页脚的备案号	f	0	0	0	1770737799
4	basics	基础设置	站点时区	site_timezone	Asia/Shanghai	select	{"options": [{"label": "上海(Asia/Shanghai)", "value": "Asia/Shanghai"}, {"label": "UTC", "value": "UTC"}]}	{"required": true}	30	影响时间显示/日志默认时区	f	0	0	0	1770737799
5	basics	基础设置	是否关闭站点	site_closed	0	switch	\N	{"required": true}	40	1=关闭，0=正常访问	f	0	0	0	1770737799
6	mail	邮件配置	SMTP 主机	smtp_host	smtp.example.com	text	\N	{"required": true}	10	邮件服务器地址	f	0	0	0	0
7	mail	邮件配置	SMTP 端口	smtp_port	465	number	\N	{"required": true}	20	常见为 25/465/587	f	0	0	0	0
8	mail	邮件配置	SSL 加密	smtp_secure	1	switch	\N	{"required": true}	30	1=启用 SSL，0=关闭	f	0	0	0	0
9	mail	邮件配置	发件人邮箱	smtp_user	noreply@example.com	text	\N	{"required": true}	40	用作登录用户名/From 地址	f	0	0	0	0
10	mail	邮件配置	发件邮箱密码	smtp_pass		text	\N	{"required": true}	50	SMTP 授权码或密码	f	0	0	0	0
11	oss	对象存储	存储驱动	oss_driver	local	select	{"options": [{"label": "本地", "value": "local"}, {"label": "阿里云OSS", "value": "oss"}, {"label": "七牛云", "value": "qiniu"}, {"label": "腾讯云cos", "value": "cos"}]}	{"required": true}	10	附件实际保存到哪里	f	0	0	0	0
13	security	安全设置	禁止访问 IP 列表	forbidden_ips	["127.0.0.1"]	textarea	\N	\N	10	每行一个 IP，支持 CIDR，示例：192.168.0.1 或 10.0.0.0/24	f	0	0	0	0
14	security	安全设置	登录失败锁定次数	login_fail_max	5	number	\N	{"required": true}	20	超过此次数可触发验证码/锁定策略	f	0	0	0	0
15	security	安全设置	登录验证码开关	login_captcha	1	switch	\N	{"required": true}	30	1=开启验证码，0=关闭	f	0	0	0	0
16	basics	基础设置	站点说明	site_description	这里是站点的简介文案，支持多行文本，用于 SEO 描述等。	textarea	\N	{"max": 300}	50	站点的详细介绍，前台可用作描述	f	0	0	0	1770737799
17	basics	基础设置	主题主色调	theme_color	#409EFF	color	{"showAlpha": false}	\N	60	前端主题主色，后续可用来生成主题变量	f	0	0	0	1770737799
18	basics	基础设置	站点 LOGO	site_logo	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp	image	{"tip": "建议 200x200 PNG", "limit": 1, "accept": "image/*"}	\N	70	后台左上角 LOGO 图片	f	0	0	0	1770737799
19	security	安全设置	密码强度要求	password_level	medium	radio	{"options": [{"label": "宽松", "value": "low"}, {"label": "中等", "value": "medium"}, {"label": "严格", "value": "high"}]}	{"required": true}	40	影响密码最小长度、复杂度校验等	f	0	0	0	0
20	security	安全设置	登录防护策略	login_protect	["ip_limit"]	checkbox	{"options": [{"label": "限制 IP 白名单", "value": "ip_limit"}, {"label": "启用登录验证码", "value": "captcha"}, {"label": "限制同账号多地登录", "value": "multi_login_limit"}]}	\N	50	多选组合策略，后续中间件可按值启用对应防护	f	0	0	0	0
23	basics	基础设置	示例三维数组	sample_array_3d	[{"name":"张三","role":"admin","tags":["vue","react"],"avatar":"https://example.com/avatars/zhangsan.jpg"},{"name":"李四","role":"user","tags":["react"],"avatar":"https://example.com/avatars/lisi.jpg"}]	array	{"fields": [{"key": "name", "type": "text", "label": "姓名", "placeholder": "请输入姓名"}, {"key": "role", "type": "select", "label": "角色", "options": [{"label": "管理员", "value": "admin"}, {"label": "用户", "value": "user"}, {"label": "访客", "value": "guest"}], "placeholder": "请选择角色"}, {"key": "tags", "type": "selects", "label": "标签", "options": [{"label": "Vue", "value": "vue"}, {"label": "React", "value": "react"}, {"label": "Angular", "value": "angular"}], "placeholder": "请选择标签"}, {"key": "avatar", "type": "image", "label": "头像", "maxSize": 5}]}	\N	99	用于测试多维数组渲染（可在高级 JSON 模式查看）	f	0	0	0	1770737799
24	security	安全设置	登录验证码模式	login_captcha_mode	qrcode	select	{"options": [{"label": "短信", "value": "sms"}, {"label": "邮箱", "value": "email"}, {"label": "二维码", "value": "qrcode"}]}	\N	120	单选下拉示例	f	0	0	0	0
25	security	安全设置	登录防护策略（多选）	login_protect_multi	["ip_limit","captcha","multi_login_limit"]	selects	{"options": [{"label": "限制 IP 白名单", "value": "ip_limit"}, {"label": "启用验证码", "value": "captcha"}, {"label": "限制同账号多地登录", "value": "multi_login_limit"}], "multiple": true}	\N	130	多选下拉示例	f	0	0	0	0
26	basics	基础设置	站点富文本	site_richtext	<p>测试服务这回可以了吧真的好厉害</p>	editor	{"mode": "default", "height": "360px", "placeholder": "请输入站点介绍...", "toolbarKeys": ["headerSelect", "bold", "underline", "italic", "through", "color", "bgColor", "link", "bulletedList", "numberedList", "todo", "justifyLeft", "justifyCenter", "justifyRight", "insertTable", "uploadImage", "codeBlock", "undo", "redo"], "uploadConfig": {"maxFileSize": 3145728, "maxNumberOfFiles": 5}}	\N	100	富文本示例，使用 ArtWangEditor	f	\N	\N	0	1770737799
27	basics	基础设置	站点富文本	site_textedio	<p>啊啊啊啊</p>	editor	{"mode": "default", "height": "360px", "placeholder": "请输入站点介绍...", "toolbarKeys": ["headerSelect", "bold", "underline", "italic", "through", "color", "bgColor", "link", "bulletedList", "numberedList", "todo", "justifyLeft", "justifyCenter", "justifyRight", "insertTable", "uploadImage", "codeBlock", "undo", "redo"], "uploadConfig": {"maxFileSize": 3145728, "maxNumberOfFiles": 5}}	\N	100	富文本示例，使用 ArtWangEditor	f	\N	\N	0	1770737799
16	basics	基础设置	站点说明	site_description	这里是站点的简介文案，支持多行文本，用于 SEO 描述等。	textarea	\N	{"max": 300}	50	站点的详细介绍，前台可用作描述	f	0	0	0	1770737799
17	basics	基础设置	主题主色调	theme_color	#409EFF	color	{"showAlpha": false}	\N	60	前端主题主色，后续可用来生成主题变量	f	0	0	0	1770737799
28	dictionary	字典配置	配置分组字典	config_group	[{"group":"basics","groupName":"基础设置","icon":"ri:settings-3-line","description":"系统常规信息配置","sort":0},{"group":"oss","groupName":"对象存储","icon":"ri:cloud-line","description":"对象存储配置","sort":10},{"group":"mail","groupName":"邮件配置","icon":"ri:mail-line","description":"邮箱账号信息配置","sort":20},{"group":"security","groupName":"安全设置","icon":"ri:shield-line","description":"安全相关配置","sort":30},{"group":"sms","groupName":"短信配置","icon":"ri:smartphone-line","description":"配置短信接口","sort":40}]	array	{"fields": [{"key": "group", "type": "text", "label": "分组标识", "placeholder": "如 basics/mail/oss"}, {"key": "groupName", "type": "text", "label": "分组名称", "placeholder": "显示名称"}, {"key": "icon", "type": "text", "label": "图标", "placeholder": "如 ri:settings-3-line"}, {"key": "description", "type": "text", "label": "描述", "placeholder": "分组描述信息"}, {"key": "sort", "min": 0, "type": "number", "label": "排序", "placeholder": "越大越靠后"}]}	\N	10	配置分组字典（key=group，value=显示名）	f	\N	\N	0	1770736665
34	oss	对象存储	阿里云 endpoint	oss_aliyun_endpoint		text	\N	\N	110	如 oss-cn-hangzhou.aliyuncs.com	f	\N	\N	0	0
35	oss	对象存储	阿里云 AccessKeyId	oss_aliyun_access_key_id		text	\N	\N	111		f	\N	\N	0	0
36	oss	对象存储	阿里云 AccessKeySecret	oss_aliyun_access_key_secret		text	\N	\N	112		f	\N	\N	0	0
37	oss	对象存储	阿里云 bucket	oss_aliyun_bucket		text	\N	\N	113		f	\N	\N	0	0
38	oss	对象存储	阿里云 domain	oss_aliyun_domain		text	\N	\N	114	建议配置为自定义域名/CDN，如 https://static.example.com	f	\N	\N	0	0
39	oss	对象存储	阿里云 root	oss_aliyun_root		text	\N	\N	115	可选，例如 uploads，留空则存根目录	f	\N	\N	0	0
40	oss	对象存储	七牛 AccessKey	oss_qiniu_access_key		text	\N	\N	120		f	\N	\N	0	0
41	oss	对象存储	七牛 SecretKey	oss_qiniu_secret_key		text	\N	\N	121		f	\N	\N	0	0
42	oss	对象存储	七牛 bucket	oss_qiniu_bucket		text	\N	\N	122		f	\N	\N	0	0
43	oss	对象存储	七牛 domain	oss_qiniu_domain		text	\N	\N	123	绑定域名，如 https://img.xxx.com	f	\N	\N	0	0
44	oss	对象存储	七牛 root	oss_qiniu_root		text	\N	\N	124	可选，留空存根目录	f	\N	\N	0	0
45	oss	对象存储	七牛 zone	oss_qiniu_zone		text	\N	\N	125	可选，留空自动；如 z0/z1	f	\N	\N	0	0
46	oss	对象存储	七牛 uplink	oss_qiniu_uplink		text	\N	\N	126	可空	f	\N	\N	0	0
47	oss	对象存储	COS SecretId	oss_cos_secret_id		text	\N	\N	130		f	\N	\N	0	0
48	oss	对象存储	COS SecretKey	oss_cos_secret_key		text	\N	\N	131		f	\N	\N	0	0
49	oss	对象存储	COS Region	oss_cos_region		text	\N	\N	132	如 ap-shanghai	f	\N	\N	0	0
50	oss	对象存储	COS bucket	oss_cos_bucket		text	\N	\N	133	含 AppId，如 xxx-125xxxx	f	\N	\N	0	0
51	oss	对象存储	COS domain	oss_cos_domain		text	\N	\N	134	可选自定义域名	f	\N	\N	0	0
52	oss	对象存储	COS root	oss_cos_root		text	\N	\N	135	可选，留空存根目录	f	\N	\N	0	0
53	oss	对象存储	COS schema	oss_cos_schema		text	\N	\N	136	http 或 https，默认 https	f	\N	\N	0	0
54	oss	对象存储	单文件最大大小	upload_max_size	10mb	text	\N	\N	10	支持 b、kb、mb、gb，例如 10mb	f	\N	\N	0	0
55	oss	对象存储	允许的文件后缀	upload_allowed_suffixes	jpg,png,bmp,jpeg,gif,webp,zip,rar,wav,mp4,mp3,docx	text	\N	\N	11	逗号分隔，小写字母	f	\N	\N	0	0
56	oss	对象存储	允许的MIME类型	upload_allowed_mime_types		text	\N	\N	12	留空表示不限制，例如 image/png,image/jpeg	f	\N	\N	0	0
57	basics	基础设置	前台会员中心	open_member_center	1	switch	{"activeText": "", "activeValue": "1", "inactiveText": "", "inactiveValue": "0"}	\N	100	如关闭则无法登录注册前台会员中心	f	\N	\N	1770736767	1770737799
1	basics	基础设置	站点名称	site_name	XYGo Admin	text	\N	{"max": 50, "required": true}	10	后台标题/LOGO文字	f	0	0	0	1770737799
2	basics	基础设置	站点副标题	site_subtitle	下一代 GoFrame 管理后台	text	\N	{"max": 100}	11	登录页/浏览器标题副文案	f	0	0	0	1770737799
3	basics	基础设置	ICP备案号	site_icp	粤ICP备000000号	text	\N	{"max": 50}	20	展示在页脚的备案号	f	0	0	0	1770737799
4	basics	基础设置	站点时区	site_timezone	Asia/Shanghai	select	{"options": [{"label": "上海(Asia/Shanghai)", "value": "Asia/Shanghai"}, {"label": "UTC", "value": "UTC"}]}	{"required": true}	30	影响时间显示/日志默认时区	f	0	0	0	1770737799
5	basics	基础设置	是否关闭站点	site_closed	0	switch	\N	{"required": true}	40	1=关闭，0=正常访问	f	0	0	0	1770737799
6	mail	邮件配置	SMTP 主机	smtp_host	smtp.example.com	text	\N	{"required": true}	10	邮件服务器地址	f	0	0	0	0
7	mail	邮件配置	SMTP 端口	smtp_port	465	number	\N	{"required": true}	20	常见为 25/465/587	f	0	0	0	0
8	mail	邮件配置	SSL 加密	smtp_secure	1	switch	\N	{"required": true}	30	1=启用 SSL，0=关闭	f	0	0	0	0
9	mail	邮件配置	发件人邮箱	smtp_user	noreply@example.com	text	\N	{"required": true}	40	用作登录用户名/From 地址	f	0	0	0	0
10	mail	邮件配置	发件邮箱密码	smtp_pass		text	\N	{"required": true}	50	SMTP 授权码或密码	f	0	0	0	0
11	oss	对象存储	存储驱动	oss_driver	local	select	{"options": [{"label": "本地", "value": "local"}, {"label": "阿里云OSS", "value": "oss"}, {"label": "七牛云", "value": "qiniu"}, {"label": "腾讯云cos", "value": "cos"}]}	{"required": true}	10	附件实际保存到哪里	f	0	0	0	0
13	security	安全设置	禁止访问 IP 列表	forbidden_ips	["127.0.0.1"]	textarea	\N	\N	10	每行一个 IP，支持 CIDR，示例：192.168.0.1 或 10.0.0.0/24	f	0	0	0	0
14	security	安全设置	登录失败锁定次数	login_fail_max	5	number	\N	{"required": true}	20	超过此次数可触发验证码/锁定策略	f	0	0	0	0
15	security	安全设置	登录验证码开关	login_captcha	1	switch	\N	{"required": true}	30	1=开启验证码，0=关闭	f	0	0	0	0
18	basics	基础设置	站点 LOGO	site_logo	/attachment/upload/20260117/995f9919-23d3-4ce2-8564-2460e4b1261d.webp	image	{"tip": "建议 200x200 PNG", "limit": 1, "accept": "image/*"}	\N	70	后台左上角 LOGO 图片	f	0	0	0	1770737799
19	security	安全设置	密码强度要求	password_level	medium	radio	{"options": [{"label": "宽松", "value": "low"}, {"label": "中等", "value": "medium"}, {"label": "严格", "value": "high"}]}	{"required": true}	40	影响密码最小长度、复杂度校验等	f	0	0	0	0
20	security	安全设置	登录防护策略	login_protect	["ip_limit"]	checkbox	{"options": [{"label": "限制 IP 白名单", "value": "ip_limit"}, {"label": "启用登录验证码", "value": "captcha"}, {"label": "限制同账号多地登录", "value": "multi_login_limit"}]}	\N	50	多选组合策略，后续中间件可按值启用对应防护	f	0	0	0	0
23	basics	基础设置	示例三维数组	sample_array_3d	[{"name":"张三","role":"admin","tags":["vue","react"],"avatar":"https://example.com/avatars/zhangsan.jpg"},{"name":"李四","role":"user","tags":["react"],"avatar":"https://example.com/avatars/lisi.jpg"}]	array	{"fields": [{"key": "name", "type": "text", "label": "姓名", "placeholder": "请输入姓名"}, {"key": "role", "type": "select", "label": "角色", "options": [{"label": "管理员", "value": "admin"}, {"label": "用户", "value": "user"}, {"label": "访客", "value": "guest"}], "placeholder": "请选择角色"}, {"key": "tags", "type": "selects", "label": "标签", "options": [{"label": "Vue", "value": "vue"}, {"label": "React", "value": "react"}, {"label": "Angular", "value": "angular"}], "placeholder": "请选择标签"}, {"key": "avatar", "type": "image", "label": "头像", "maxSize": 5}]}	\N	99	用于测试多维数组渲染（可在高级 JSON 模式查看）	f	0	0	0	1770737799
24	security	安全设置	登录验证码模式	login_captcha_mode	qrcode	select	{"options": [{"label": "短信", "value": "sms"}, {"label": "邮箱", "value": "email"}, {"label": "二维码", "value": "qrcode"}]}	\N	120	单选下拉示例	f	0	0	0	0
25	security	安全设置	登录防护策略（多选）	login_protect_multi	["ip_limit","captcha","multi_login_limit"]	selects	{"options": [{"label": "限制 IP 白名单", "value": "ip_limit"}, {"label": "启用验证码", "value": "captcha"}, {"label": "限制同账号多地登录", "value": "multi_login_limit"}], "multiple": true}	\N	130	多选下拉示例	f	0	0	0	0
26	basics	基础设置	站点富文本	site_richtext	<p>测试服务这回可以了吧真的好厉害</p>	editor	{"mode": "default", "height": "360px", "placeholder": "请输入站点介绍...", "toolbarKeys": ["headerSelect", "bold", "underline", "italic", "through", "color", "bgColor", "link", "bulletedList", "numberedList", "todo", "justifyLeft", "justifyCenter", "justifyRight", "insertTable", "uploadImage", "codeBlock", "undo", "redo"], "uploadConfig": {"maxFileSize": 3145728, "maxNumberOfFiles": 5}}	\N	100	富文本示例，使用 ArtWangEditor	f	\N	\N	0	1770737799
27	basics	基础设置	站点富文本	site_textedio	<p>啊啊啊啊</p>	editor	{"mode": "default", "height": "360px", "placeholder": "请输入站点介绍...", "toolbarKeys": ["headerSelect", "bold", "underline", "italic", "through", "color", "bgColor", "link", "bulletedList", "numberedList", "todo", "justifyLeft", "justifyCenter", "justifyRight", "insertTable", "uploadImage", "codeBlock", "undo", "redo"], "uploadConfig": {"maxFileSize": 3145728, "maxNumberOfFiles": 5}}	\N	100	富文本示例，使用 ArtWangEditor	f	\N	\N	0	1770737799
28	dictionary	字典配置	配置分组字典	config_group	[{"group":"basics","groupName":"基础设置","icon":"ri:settings-3-line","description":"系统常规信息配置","sort":0},{"group":"oss","groupName":"对象存储","icon":"ri:cloud-line","description":"对象存储配置","sort":10},{"group":"mail","groupName":"邮件配置","icon":"ri:mail-line","description":"邮箱账号信息配置","sort":20},{"group":"security","groupName":"安全设置","icon":"ri:shield-line","description":"安全相关配置","sort":30},{"group":"sms","groupName":"短信配置","icon":"ri:smartphone-line","description":"配置短信接口","sort":40}]	array	{"fields": [{"key": "group", "type": "text", "label": "分组标识", "placeholder": "如 basics/mail/oss"}, {"key": "groupName", "type": "text", "label": "分组名称", "placeholder": "显示名称"}, {"key": "icon", "type": "text", "label": "图标", "placeholder": "如 ri:settings-3-line"}, {"key": "description", "type": "text", "label": "描述", "placeholder": "分组描述信息"}, {"key": "sort", "min": 0, "type": "number", "label": "排序", "placeholder": "越大越靠后"}]}	\N	10	配置分组字典（key=group，value=显示名）	f	\N	\N	0	1770736665
34	oss	对象存储	阿里云 endpoint	oss_aliyun_endpoint		text	\N	\N	110	如 oss-cn-hangzhou.aliyuncs.com	f	\N	\N	0	0
35	oss	对象存储	阿里云 AccessKeyId	oss_aliyun_access_key_id		text	\N	\N	111		f	\N	\N	0	0
36	oss	对象存储	阿里云 AccessKeySecret	oss_aliyun_access_key_secret		text	\N	\N	112		f	\N	\N	0	0
37	oss	对象存储	阿里云 bucket	oss_aliyun_bucket		text	\N	\N	113		f	\N	\N	0	0
38	oss	对象存储	阿里云 domain	oss_aliyun_domain		text	\N	\N	114	建议配置为自定义域名/CDN，如 https://static.example.com	f	\N	\N	0	0
39	oss	对象存储	阿里云 root	oss_aliyun_root		text	\N	\N	115	可选，例如 uploads，留空则存根目录	f	\N	\N	0	0
40	oss	对象存储	七牛 AccessKey	oss_qiniu_access_key		text	\N	\N	120		f	\N	\N	0	0
41	oss	对象存储	七牛 SecretKey	oss_qiniu_secret_key		text	\N	\N	121		f	\N	\N	0	0
42	oss	对象存储	七牛 bucket	oss_qiniu_bucket		text	\N	\N	122		f	\N	\N	0	0
43	oss	对象存储	七牛 domain	oss_qiniu_domain		text	\N	\N	123	绑定域名，如 https://img.xxx.com	f	\N	\N	0	0
44	oss	对象存储	七牛 root	oss_qiniu_root		text	\N	\N	124	可选，留空存根目录	f	\N	\N	0	0
45	oss	对象存储	七牛 zone	oss_qiniu_zone		text	\N	\N	125	可选，留空自动；如 z0/z1	f	\N	\N	0	0
46	oss	对象存储	七牛 uplink	oss_qiniu_uplink		text	\N	\N	126	可空	f	\N	\N	0	0
47	oss	对象存储	COS SecretId	oss_cos_secret_id		text	\N	\N	130		f	\N	\N	0	0
48	oss	对象存储	COS SecretKey	oss_cos_secret_key		text	\N	\N	131		f	\N	\N	0	0
49	oss	对象存储	COS Region	oss_cos_region		text	\N	\N	132	如 ap-shanghai	f	\N	\N	0	0
50	oss	对象存储	COS bucket	oss_cos_bucket		text	\N	\N	133	含 AppId，如 xxx-125xxxx	f	\N	\N	0	0
51	oss	对象存储	COS domain	oss_cos_domain		text	\N	\N	134	可选自定义域名	f	\N	\N	0	0
52	oss	对象存储	COS root	oss_cos_root		text	\N	\N	135	可选，留空存根目录	f	\N	\N	0	0
53	oss	对象存储	COS schema	oss_cos_schema		text	\N	\N	136	http 或 https，默认 https	f	\N	\N	0	0
54	oss	对象存储	单文件最大大小	upload_max_size	10mb	text	\N	\N	10	支持 b、kb、mb、gb，例如 10mb	f	\N	\N	0	0
55	oss	对象存储	允许的文件后缀	upload_allowed_suffixes	jpg,png,bmp,jpeg,gif,webp,zip,rar,wav,mp4,mp3,docx	text	\N	\N	11	逗号分隔，小写字母	f	\N	\N	0	0
56	oss	对象存储	允许的MIME类型	upload_allowed_mime_types		text	\N	\N	12	留空表示不限制，例如 image/png,image/jpeg	f	\N	\N	0	0
57	basics	基础设置	前台会员中心	open_member_center	1	switch	{"activeText": "", "activeValue": "1", "inactiveText": "", "inactiveValue": "0"}	\N	100	如关闭则无法登录注册前台会员中心	f	\N	\N	1770736767	1770737799
\.


--
-- Data for Name: xy_sys_cron; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_sys_cron (id, group_id, title, name, params, pattern, policy, count, sort, remark, status, created_at, updated_at) FROM stdin;
1	2	测试定时任务	test	hello word	*/5 * * * * *	1	1	0	一个测试范例定时任务	0	1770718404	1770718450
2	1	监测队列状态	queue_alert	5,1	0 */5 * * * *	1	1	0	检测队列积压情况	0	1770720827	1770725448
1	2	测试定时任务	test	hello word	*/5 * * * * *	1	1	0	一个测试范例定时任务	0	1770718404	1770718450
2	1	监测队列状态	queue_alert	5,1	0 */5 * * * *	1	1	0	检测队列积压情况	0	1770720827	1770725448
\.


--
-- Data for Name: xy_sys_cron_group; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_sys_cron_group (id, name, sort, remark, status, created_at, updated_at) FROM stdin;
1	系统任务	0	系统内置定时任务	1	1770716554	1770716554
2	业务任务	10	业务自定义定时任务	1	1770716554	1770716554
1	系统任务	0	系统内置定时任务	1	1770716554	1770716554
2	业务任务	10	业务自定义定时任务	1	1770716554	1770716554
\.


--
-- Data for Name: xy_sys_cron_log; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_sys_cron_log (id, cron_id, name, title, params, status, output, err_msg, take_ms, created_at) FROM stdin;
1	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:25] hello word		0	1770718405
2	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:30] hello word		0	1770718410
3	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:35] hello word		0	1770718415
4	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:40] hello word		0	1770718420
5	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:45] hello word		0	1770718425
6	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:50] hello word		0	1770718430
7	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:55] hello word		0	1770718435
8	1	test	测试定时任务	hello word	1	[2026-02-10 18:14:00] hello word		0	1770718440
9	1	test	测试定时任务	hello word	1	[2026-02-10 18:14:05] hello word		0	1770718445
10	2	queue_alert	queue_alert	100,10	1	all queues normal		1	1770720900
11	2	queue_alert	queue_alert	100,10	1	all queues normal		2	1770721200
12	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770721426
13	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770721500
14	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770721514
15	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		4	1770721520
16	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		6	1770721622
17	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		5	1770721633
18	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770721649
19	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		4	1770721800
20	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770722100
21	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770722400
22	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770722700
23	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770723000
24	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		2	1770723300
25	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770723600
26	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		7	1770723900
27	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		5	1770724200
28	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		2	1770724500
29	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		5	1770724800
30	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770725100
31	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		4	1770725400
1	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:25] hello word		0	1770718405
2	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:30] hello word		0	1770718410
3	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:35] hello word		0	1770718415
4	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:40] hello word		0	1770718420
5	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:45] hello word		0	1770718425
6	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:50] hello word		0	1770718430
7	1	test	测试定时任务	hello word	1	[2026-02-10 18:13:55] hello word		0	1770718435
8	1	test	测试定时任务	hello word	1	[2026-02-10 18:14:00] hello word		0	1770718440
9	1	test	测试定时任务	hello word	1	[2026-02-10 18:14:05] hello word		0	1770718445
10	2	queue_alert	queue_alert	100,10	1	all queues normal		1	1770720900
11	2	queue_alert	queue_alert	100,10	1	all queues normal		2	1770721200
12	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770721426
13	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770721500
14	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		3	1770721514
15	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		4	1770721520
16	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		6	1770721622
17	2	queue_alert	queue_alert	5,1	1	告警 2 条，已推送给 1 位管理员:\n队列 login_log 积压 7 条（阈值 5）\n队列 login_log 死信 2 条（阈值 1）		5	1770721633
\.


--
-- Data for Name: xy_sys_gen_codes; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_sys_gen_codes (id, gen_type, db_name, table_name, table_comment, var_name, options, status, created_at, updated_at) FROM stdin;
37	10	xygonew	xy_member_login_log	登录日志	MemberLoginLog	{"menu": {"pid": 143, "icon": "ri:file-list-line", "sort": 100}, "tree": {"pidColumn": "parent_id", "titleColumn": "name"}, "autoOps": ["genMenuPermissions", "runDao", "runService"], "genType": 10, "headOps": ["batchDel", "export"], "genPaths": {}, "viewMode": "page", "apiPrefix": "", "columnOps": ["del", "view", "check"]}	2	1770873777	1770873777
\.


--
-- Data for Name: xy_sys_gen_codes_column; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_sys_gen_codes_column (id, gen_id, name, go_name, ts_name, db_type, go_type, ts_type, comment, is_pk, is_required, is_list, is_edit, is_query, query_type, design_type, extra, form_type, dict_type, sort) FROM stdin;
\.


--
-- Data for Name: xy_test_category; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_test_category (id, parent_id, name, icon, image, sort, status, remark, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: xy_test_code; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_test_code (id, name, member_id) FROM stdin;
\.


--
-- Data for Name: xy_test_codec; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_test_codec (id, status, create_time) FROM stdin;
\.


--
-- Data for Name: xy_test_order; Type: TABLE DATA; Schema: xygonew; Owner: postgres
--

COPY xygonew.xy_test_order (id, member_id, apply_id, amount, status, memo, created_at, updated_at) FROM stdin;
\.


--
-- Name: xy_admin_chat_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_chat_message_id_seq', 23, true);


--
-- Name: xy_admin_chat_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_chat_session_id_seq', 4, true);


--
-- Name: xy_admin_chat_session_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_chat_session_member_id_seq', 10, true);


--
-- Name: xy_admin_dept_closure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_dept_closure_id_seq', 19, true);


--
-- Name: xy_admin_dept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_dept_id_seq', 8, true);


--
-- Name: xy_admin_field_perm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_field_perm_id_seq', 1, true);


--
-- Name: xy_admin_login_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_login_log_id_seq', 8, true);


--
-- Name: xy_admin_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_menu_id_seq', 642, true);


--
-- Name: xy_admin_notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_notice_id_seq', 1, true);


--
-- Name: xy_admin_notice_read_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_notice_read_id_seq', 2, true);


--
-- Name: xy_admin_operation_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_operation_log_id_seq', 972, true);


--
-- Name: xy_admin_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_post_id_seq', 7, true);


--
-- Name: xy_admin_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_role_id_seq', 5, true);


--
-- Name: xy_admin_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_admin_user_id_seq', 4, true);


--
-- Name: xy_captcha_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_captcha_id_seq', 15, true);


--
-- Name: xy_cms_case_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_cms_case_category_id_seq', 5, true);


--
-- Name: xy_cms_case_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_cms_case_id_seq', 14, true);


--
-- Name: xy_cms_doc_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_cms_doc_category_id_seq', 604, true);


--
-- Name: xy_cms_doc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_cms_doc_id_seq', 33, true);


--
-- Name: xy_community_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_community_category_id_seq', 5, true);


--
-- Name: xy_community_collect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_community_collect_id_seq', 1, true);


--
-- Name: xy_community_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_community_like_id_seq', 1, false);


--
-- Name: xy_community_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_community_post_id_seq', 17, true);


--
-- Name: xy_community_reply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_community_reply_id_seq', 19, true);


--
-- Name: xy_community_search_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_community_search_log_id_seq', 23, true);


--
-- Name: xy_demo_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_demo_article_id_seq', 3, true);


--
-- Name: xy_demo_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_demo_category_id_seq', 5, true);


--
-- Name: xy_member_checkin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_checkin_id_seq', 5, true);


--
-- Name: xy_member_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_group_id_seq', 2, true);


--
-- Name: xy_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_id_seq', 1, true);


--
-- Name: xy_member_login_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_login_log_id_seq', 22, true);


--
-- Name: xy_member_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_menu_id_seq', 11, true);


--
-- Name: xy_member_money_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_money_log_id_seq', 1, true);


--
-- Name: xy_member_notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_notice_id_seq', 3, true);


--
-- Name: xy_member_notice_read_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_notice_read_id_seq', 3, true);


--
-- Name: xy_member_score_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_member_score_log_id_seq', 5, true);


--
-- Name: xy_sys_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_sys_attachment_id_seq', 8, true);


--
-- Name: xy_sys_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_sys_config_id_seq', 57, true);


--
-- Name: xy_sys_cron_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_sys_cron_group_id_seq', 2, true);


--
-- Name: xy_sys_cron_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_sys_cron_id_seq', 2, true);


--
-- Name: xy_sys_cron_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_sys_cron_log_id_seq', 31, true);


--
-- Name: xy_sys_gen_codes_column_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_sys_gen_codes_column_id_seq', 852, true);


--
-- Name: xy_sys_gen_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_sys_gen_codes_id_seq', 70, true);


--
-- Name: xy_test_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_test_category_id_seq', 13, true);


--
-- Name: xy_test_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_test_code_id_seq', 1, true);


--
-- Name: xy_test_codec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_test_codec_id_seq', 1, true);


--
-- Name: xy_test_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xy_test_order_id_seq', 5, true);


--
-- Name: xy_admin_chat_message_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_chat_message_id_seq', 23, true);


--
-- Name: xy_admin_chat_session_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_chat_session_id_seq', 4, true);


--
-- Name: xy_admin_chat_session_member_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_chat_session_member_id_seq', 10, true);


--
-- Name: xy_admin_dept_closure_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_dept_closure_id_seq', 19, true);


--
-- Name: xy_admin_dept_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_dept_id_seq', 8, true);


--
-- Name: xy_admin_field_perm_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_field_perm_id_seq', 1, true);


--
-- Name: xy_admin_login_log_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_login_log_id_seq', 1, true);


--
-- Name: xy_admin_menu_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_menu_id_seq', 622, true);


--
-- Name: xy_admin_notice_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_notice_id_seq', 1, true);


--
-- Name: xy_admin_notice_read_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_notice_read_id_seq', 2, true);


--
-- Name: xy_admin_operation_log_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_operation_log_id_seq', 921, true);


--
-- Name: xy_admin_post_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_post_id_seq', 7, true);


--
-- Name: xy_admin_role_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_role_id_seq', 5, true);


--
-- Name: xy_admin_user_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_admin_user_id_seq', 4, true);


--
-- Name: xy_captcha_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_captcha_id_seq', 1, true);


--
-- Name: xy_demo_article_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_demo_article_id_seq', 3, true);


--
-- Name: xy_demo_category_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_demo_category_id_seq', 5, true);


--
-- Name: xy_member_checkin_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_checkin_id_seq', 3, true);


--
-- Name: xy_member_group_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_group_id_seq', 2, true);


--
-- Name: xy_member_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_id_seq', 1, true);


--
-- Name: xy_member_login_log_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_login_log_id_seq', 19, true);


--
-- Name: xy_member_menu_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_menu_id_seq', 11, true);


--
-- Name: xy_member_money_log_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_money_log_id_seq', 1, true);


--
-- Name: xy_member_notice_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_notice_id_seq', 3, true);


--
-- Name: xy_member_notice_read_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_notice_read_id_seq', 3, true);


--
-- Name: xy_member_score_log_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_member_score_log_id_seq', 3, true);


--
-- Name: xy_sys_attachment_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_sys_attachment_id_seq', 8, true);


--
-- Name: xy_sys_config_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_sys_config_id_seq', 57, true);


--
-- Name: xy_sys_cron_group_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_sys_cron_group_id_seq', 2, true);


--
-- Name: xy_sys_cron_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_sys_cron_id_seq', 2, true);


--
-- Name: xy_sys_cron_log_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_sys_cron_log_id_seq', 31, true);


--
-- Name: xy_sys_gen_codes_column_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_sys_gen_codes_column_id_seq', 810, true);


--
-- Name: xy_sys_gen_codes_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_sys_gen_codes_id_seq', 67, true);


--
-- Name: xy_test_category_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_test_category_id_seq', 13, true);


--
-- Name: xy_test_code_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_test_code_id_seq', 1, true);


--
-- Name: xy_test_codec_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_test_codec_id_seq', 1, true);


--
-- Name: xy_test_order_id_seq; Type: SEQUENCE SET; Schema: xygonew; Owner: postgres
--

SELECT pg_catalog.setval('xygonew.xy_test_order_id_seq', 5, true);


--
-- Name: xy_admin_chat_message idx_17075_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_chat_message
    ADD CONSTRAINT idx_17075_primary PRIMARY KEY (id);


--
-- Name: xy_admin_chat_session idx_17086_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_chat_session
    ADD CONSTRAINT idx_17086_primary PRIMARY KEY (id);


--
-- Name: xy_admin_chat_session_member idx_17102_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_chat_session_member
    ADD CONSTRAINT idx_17102_primary PRIMARY KEY (id);


--
-- Name: xy_admin_dept idx_17115_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_dept
    ADD CONSTRAINT idx_17115_primary PRIMARY KEY (id);


--
-- Name: xy_admin_dept_closure idx_17126_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_dept_closure
    ADD CONSTRAINT idx_17126_primary PRIMARY KEY (id);


--
-- Name: xy_admin_field_perm idx_17132_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_field_perm
    ADD CONSTRAINT idx_17132_primary PRIMARY KEY (id);


--
-- Name: xy_admin_login_log idx_17142_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_login_log
    ADD CONSTRAINT idx_17142_primary PRIMARY KEY (id);


--
-- Name: xy_admin_menu idx_17158_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_menu
    ADD CONSTRAINT idx_17158_primary PRIMARY KEY (id);


--
-- Name: xy_admin_notice idx_17188_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_notice
    ADD CONSTRAINT idx_17188_primary PRIMARY KEY (id);


--
-- Name: xy_admin_notice_read idx_17206_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_notice_read
    ADD CONSTRAINT idx_17206_primary PRIMARY KEY (id);


--
-- Name: xy_admin_operation_log idx_17212_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_operation_log
    ADD CONSTRAINT idx_17212_primary PRIMARY KEY (id);


--
-- Name: xy_admin_post idx_17231_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_post
    ADD CONSTRAINT idx_17231_primary PRIMARY KEY (id);


--
-- Name: xy_admin_role idx_17245_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_role
    ADD CONSTRAINT idx_17245_primary PRIMARY KEY (id);


--
-- Name: xy_admin_role_menu idx_17260_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_role_menu
    ADD CONSTRAINT idx_17260_primary PRIMARY KEY (role_id, menu_id);


--
-- Name: xy_admin_user idx_17264_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_user
    ADD CONSTRAINT idx_17264_primary PRIMARY KEY (id);


--
-- Name: xy_admin_user_post idx_17283_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_user_post
    ADD CONSTRAINT idx_17283_primary PRIMARY KEY (user_id, post_id);


--
-- Name: xy_admin_user_role idx_17286_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_admin_user_role
    ADD CONSTRAINT idx_17286_primary PRIMARY KEY (user_id, role_id);


--
-- Name: xy_captcha idx_17290_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_captcha
    ADD CONSTRAINT idx_17290_primary PRIMARY KEY (id);


--
-- Name: xy_demo_article idx_17301_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_demo_article
    ADD CONSTRAINT idx_17301_primary PRIMARY KEY (id);


--
-- Name: xy_demo_category idx_17318_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_demo_category
    ADD CONSTRAINT idx_17318_primary PRIMARY KEY (id);


--
-- Name: xy_member idx_17331_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member
    ADD CONSTRAINT idx_17331_primary PRIMARY KEY (id);


--
-- Name: xy_member_checkin idx_17353_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_checkin
    ADD CONSTRAINT idx_17353_primary PRIMARY KEY (id);


--
-- Name: xy_member_group idx_17361_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_group
    ADD CONSTRAINT idx_17361_primary PRIMARY KEY (id);


--
-- Name: xy_member_login_log idx_17372_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_login_log
    ADD CONSTRAINT idx_17372_primary PRIMARY KEY (id);


--
-- Name: xy_member_menu idx_17385_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_menu
    ADD CONSTRAINT idx_17385_primary PRIMARY KEY (id);


--
-- Name: xy_member_money_log idx_17407_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_money_log
    ADD CONSTRAINT idx_17407_primary PRIMARY KEY (id);


--
-- Name: xy_member_notice idx_17417_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_notice
    ADD CONSTRAINT idx_17417_primary PRIMARY KEY (id);


--
-- Name: xy_member_notice_read idx_17430_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_notice_read
    ADD CONSTRAINT idx_17430_primary PRIMARY KEY (id);


--
-- Name: xy_member_score_log idx_17437_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_member_score_log
    ADD CONSTRAINT idx_17437_primary PRIMARY KEY (id);


--
-- Name: xy_sys_attachment idx_17447_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_attachment
    ADD CONSTRAINT idx_17447_primary PRIMARY KEY (id);


--
-- Name: xy_sys_config idx_17465_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_config
    ADD CONSTRAINT idx_17465_primary PRIMARY KEY (id);


--
-- Name: xy_sys_cron idx_17480_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_cron
    ADD CONSTRAINT idx_17480_primary PRIMARY KEY (id);


--
-- Name: xy_sys_cron_group idx_17499_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_cron_group
    ADD CONSTRAINT idx_17499_primary PRIMARY KEY (id);


--
-- Name: xy_sys_cron_log idx_17512_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_cron_log
    ADD CONSTRAINT idx_17512_primary PRIMARY KEY (id);


--
-- Name: xy_sys_gen_codes idx_17526_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_gen_codes
    ADD CONSTRAINT idx_17526_primary PRIMARY KEY (id);


--
-- Name: xy_sys_gen_codes_column idx_17541_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_sys_gen_codes_column
    ADD CONSTRAINT idx_17541_primary PRIMARY KEY (id);


--
-- Name: xy_test_category idx_17565_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_category
    ADD CONSTRAINT idx_17565_primary PRIMARY KEY (id);


--
-- Name: xy_test_code idx_17579_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_code
    ADD CONSTRAINT idx_17579_primary PRIMARY KEY (id);


--
-- Name: xy_test_codec idx_17586_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_codec
    ADD CONSTRAINT idx_17586_primary PRIMARY KEY (id);


--
-- Name: xy_test_order idx_17592_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_test_order
    ADD CONSTRAINT idx_17592_primary PRIMARY KEY (id);


--
-- Name: xy_cms_case_category xy_cms_case_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_case_category
    ADD CONSTRAINT xy_cms_case_category_pkey PRIMARY KEY (id);


--
-- Name: xy_cms_case xy_cms_case_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_case
    ADD CONSTRAINT xy_cms_case_pkey PRIMARY KEY (id);


--
-- Name: xy_cms_doc_category xy_cms_doc_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_doc_category
    ADD CONSTRAINT xy_cms_doc_category_pkey PRIMARY KEY (id);


--
-- Name: xy_cms_doc xy_cms_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_cms_doc
    ADD CONSTRAINT xy_cms_doc_pkey PRIMARY KEY (id);


--
-- Name: xy_community_category xy_community_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_category
    ADD CONSTRAINT xy_community_category_pkey PRIMARY KEY (id);


--
-- Name: xy_community_collect xy_community_collect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_collect
    ADD CONSTRAINT xy_community_collect_pkey PRIMARY KEY (id);


--
-- Name: xy_community_like xy_community_like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_like
    ADD CONSTRAINT xy_community_like_pkey PRIMARY KEY (id);


--
-- Name: xy_community_post xy_community_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_post
    ADD CONSTRAINT xy_community_post_pkey PRIMARY KEY (id);


--
-- Name: xy_community_reply xy_community_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_reply
    ADD CONSTRAINT xy_community_reply_pkey PRIMARY KEY (id);


--
-- Name: xy_community_search_log xy_community_search_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xy_community_search_log
    ADD CONSTRAINT xy_community_search_log_pkey PRIMARY KEY (id);


--
-- Name: idx_17075_idx_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17075_idx_created_at ON public.xy_admin_chat_message USING btree (created_at);


--
-- Name: idx_17075_idx_sender_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17075_idx_sender_id ON public.xy_admin_chat_message USING btree (sender_id);


--
-- Name: idx_17075_idx_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17075_idx_session_id ON public.xy_admin_chat_message USING btree (session_id);


--
-- Name: idx_17086_idx_creator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17086_idx_creator_id ON public.xy_admin_chat_session USING btree (creator_id);


--
-- Name: idx_17086_idx_last_message_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17086_idx_last_message_time ON public.xy_admin_chat_session USING btree (last_message_time);


--
-- Name: idx_17102_idx_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17102_idx_session_id ON public.xy_admin_chat_session_member USING btree (session_id);


--
-- Name: idx_17102_idx_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17102_idx_user_id ON public.xy_admin_chat_session_member USING btree (user_id);


--
-- Name: idx_17102_uk_session_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17102_uk_session_user ON public.xy_admin_chat_session_member USING btree (session_id, user_id);


--
-- Name: idx_17126_idx_ancestor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17126_idx_ancestor ON public.xy_admin_dept_closure USING btree (ancestor);


--
-- Name: idx_17126_idx_descendant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17126_idx_descendant ON public.xy_admin_dept_closure USING btree (descendant);


--
-- Name: idx_17132_idx_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17132_idx_resource ON public.xy_admin_field_perm USING btree (resource);


--
-- Name: idx_17132_idx_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17132_idx_role_id ON public.xy_admin_field_perm USING btree (role_id);


--
-- Name: idx_17132_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17132_idx_status ON public.xy_admin_field_perm USING btree (status);


--
-- Name: idx_17132_uk_role_resource_field; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17132_uk_role_resource_field ON public.xy_admin_field_perm USING btree (role_id, resource, field_name);


--
-- Name: idx_17142_idx_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17142_idx_created_at ON public.xy_admin_login_log USING btree (created_at);


--
-- Name: idx_17142_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17142_idx_status ON public.xy_admin_login_log USING btree (status);


--
-- Name: idx_17142_idx_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17142_idx_user_id ON public.xy_admin_login_log USING btree (user_id);


--
-- Name: idx_17142_idx_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17142_idx_username ON public.xy_admin_login_log USING btree (username);


--
-- Name: idx_17158_idx_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17158_idx_parent_id ON public.xy_admin_menu USING btree (parent_id);


--
-- Name: idx_17158_idx_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17158_idx_type ON public.xy_admin_menu USING btree (type);


--
-- Name: idx_17188_idx_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17188_idx_created ON public.xy_admin_notice USING btree (created_at);


--
-- Name: idx_17188_idx_receiver; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17188_idx_receiver ON public.xy_admin_notice USING btree (receiver_id);


--
-- Name: idx_17188_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17188_idx_status ON public.xy_admin_notice USING btree (status);


--
-- Name: idx_17188_idx_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17188_idx_type ON public.xy_admin_notice USING btree (type);


--
-- Name: idx_17206_idx_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17206_idx_user ON public.xy_admin_notice_read USING btree (user_id);


--
-- Name: idx_17206_uk_notice_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17206_uk_notice_user ON public.xy_admin_notice_read USING btree (notice_id, user_id);


--
-- Name: idx_17212_idx_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17212_idx_created_at ON public.xy_admin_operation_log USING btree (created_at);


--
-- Name: idx_17212_idx_module; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17212_idx_module ON public.xy_admin_operation_log USING btree (module);


--
-- Name: idx_17212_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17212_idx_status ON public.xy_admin_operation_log USING btree (status);


--
-- Name: idx_17212_idx_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17212_idx_user_id ON public.xy_admin_operation_log USING btree (user_id);


--
-- Name: idx_17231_idx_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17231_idx_created_by ON public.xy_admin_post USING btree (created_by);


--
-- Name: idx_17231_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17231_idx_status ON public.xy_admin_post USING btree (status);


--
-- Name: idx_17231_uk_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17231_uk_code ON public.xy_admin_post USING btree (code);


--
-- Name: idx_17245_uk_role_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17245_uk_role_key ON public.xy_admin_role USING btree (key);


--
-- Name: idx_17260_idx_menu_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17260_idx_menu_id ON public.xy_admin_role_menu USING btree (menu_id);


--
-- Name: idx_17264_idx_dept_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17264_idx_dept_id ON public.xy_admin_user USING btree (dept_id);


--
-- Name: idx_17264_idx_pid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17264_idx_pid ON public.xy_admin_user USING btree (pid);


--
-- Name: idx_17264_uk_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17264_uk_username ON public.xy_admin_user USING btree (username);


--
-- Name: idx_17283_idx_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17283_idx_post_id ON public.xy_admin_user_post USING btree (post_id);


--
-- Name: idx_17283_idx_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17283_idx_user_id ON public.xy_admin_user_post USING btree (user_id);


--
-- Name: idx_17286_idx_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17286_idx_role_id ON public.xy_admin_user_role USING btree (role_id);


--
-- Name: idx_17290_uk_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17290_uk_key ON public.xy_captcha USING btree (key);


--
-- Name: idx_17301_idx_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17301_idx_category ON public.xy_demo_article USING btree (category_id);


--
-- Name: idx_17301_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17301_idx_status ON public.xy_demo_article USING btree (status);


--
-- Name: idx_17318_idx_parent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17318_idx_parent ON public.xy_demo_category USING btree (parent_id);


--
-- Name: idx_17331_idx_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17331_idx_group_id ON public.xy_member USING btree (group_id);


--
-- Name: idx_17331_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17331_idx_status ON public.xy_member USING btree (status);


--
-- Name: idx_17331_uk_mobile; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17331_uk_mobile ON public.xy_member USING btree (mobile);


--
-- Name: idx_17331_uk_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17331_uk_username ON public.xy_member USING btree (username);


--
-- Name: idx_17353_idx_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17353_idx_member_id ON public.xy_member_checkin USING btree (member_id);


--
-- Name: idx_17353_uk_member_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17353_uk_member_date ON public.xy_member_checkin USING btree (member_id, checkin_date);


--
-- Name: idx_17372_idx_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17372_idx_created_at ON public.xy_member_login_log USING btree (created_at);


--
-- Name: idx_17372_idx_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17372_idx_member_id ON public.xy_member_login_log USING btree (member_id);


--
-- Name: idx_17385_idx_pid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17385_idx_pid ON public.xy_member_menu USING btree (pid);


--
-- Name: idx_17407_idx_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17407_idx_member_id ON public.xy_member_money_log USING btree (member_id);


--
-- Name: idx_17417_idx_status_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17417_idx_status_created ON public.xy_member_notice USING btree (status, created_at);


--
-- Name: idx_17430_idx_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17430_idx_member_id ON public.xy_member_notice_read USING btree (member_id);


--
-- Name: idx_17430_uk_notice_member; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17430_uk_notice_member ON public.xy_member_notice_read USING btree (notice_id, member_id);


--
-- Name: idx_17437_idx_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17437_idx_member_id ON public.xy_member_score_log USING btree (member_id);


--
-- Name: idx_17465_idx_group_sort; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17465_idx_group_sort ON public.xy_sys_config USING btree ("group", sort);


--
-- Name: idx_17465_uk_config_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17465_uk_config_key ON public.xy_sys_config USING btree (key);


--
-- Name: idx_17480_idx_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17480_idx_group_id ON public.xy_sys_cron USING btree (group_id);


--
-- Name: idx_17480_idx_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17480_idx_status ON public.xy_sys_cron USING btree (status);


--
-- Name: idx_17480_uk_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17480_uk_name ON public.xy_sys_cron USING btree (name);


--
-- Name: idx_17512_idx_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17512_idx_created_at ON public.xy_sys_cron_log USING btree (created_at);


--
-- Name: idx_17512_idx_cron_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17512_idx_cron_id ON public.xy_sys_cron_log USING btree (cron_id);


--
-- Name: idx_17526_uk_table; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_17526_uk_table ON public.xy_sys_gen_codes USING btree (db_name, table_name);


--
-- Name: idx_17541_idx_gen_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_17541_idx_gen_id ON public.xy_sys_gen_codes_column USING btree (gen_id);


--
-- Name: idx_cms_case_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_case_category_id ON public.xy_cms_case USING btree (category_id);


--
-- Name: idx_cms_case_category_pid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_case_category_pid ON public.xy_cms_case_category USING btree (pid);


--
-- Name: idx_cms_case_category_status_sort; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_case_category_status_sort ON public.xy_cms_case_category USING btree (status, sort);


--
-- Name: idx_cms_case_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_case_created_at ON public.xy_cms_case USING btree (created_at);


--
-- Name: idx_cms_case_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_case_deleted_at ON public.xy_cms_case USING btree (deleted_at);


--
-- Name: idx_cms_case_sort; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_case_sort ON public.xy_cms_case USING btree (sort);


--
-- Name: idx_cms_case_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_case_status ON public.xy_cms_case USING btree (status);


--
-- Name: idx_cms_doc_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_doc_category_id ON public.xy_cms_doc USING btree (category_id);


--
-- Name: idx_cms_doc_category_pid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_doc_category_pid ON public.xy_cms_doc_category USING btree (pid);


--
-- Name: idx_cms_doc_category_status_sort; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_doc_category_status_sort ON public.xy_cms_doc_category USING btree (status, sort);


--
-- Name: idx_cms_doc_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_doc_created_at ON public.xy_cms_doc USING btree (created_at);


--
-- Name: idx_cms_doc_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_doc_deleted_at ON public.xy_cms_doc USING btree (deleted_at);


--
-- Name: idx_cms_doc_sort; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_doc_sort ON public.xy_cms_doc USING btree (sort);


--
-- Name: idx_cms_doc_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cms_doc_status ON public.xy_cms_doc USING btree (status);


--
-- Name: idx_community_category_status_sort; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_category_status_sort ON public.xy_community_category USING btree (status, sort);


--
-- Name: idx_community_collect_member; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_collect_member ON public.xy_community_collect USING btree (member_id);


--
-- Name: idx_community_collect_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_community_collect_unique ON public.xy_community_collect USING btree (member_id, post_id);


--
-- Name: idx_community_like_target; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_like_target ON public.xy_community_like USING btree (target_type, target_id);


--
-- Name: idx_community_like_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_community_like_unique ON public.xy_community_like USING btree (member_id, target_type, target_id);


--
-- Name: idx_community_post_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_post_category_id ON public.xy_community_post USING btree (category_id);


--
-- Name: idx_community_post_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_post_created_at ON public.xy_community_post USING btree (created_at);


--
-- Name: idx_community_post_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_post_deleted_at ON public.xy_community_post USING btree (deleted_at);


--
-- Name: idx_community_post_is_top; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_post_is_top ON public.xy_community_post USING btree (is_top);


--
-- Name: idx_community_post_last_reply_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_post_last_reply_at ON public.xy_community_post USING btree (last_reply_at);


--
-- Name: idx_community_post_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_post_member_id ON public.xy_community_post USING btree (member_id);


--
-- Name: idx_community_post_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_post_status ON public.xy_community_post USING btree (status);


--
-- Name: idx_community_reply_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_reply_deleted_at ON public.xy_community_reply USING btree (deleted_at);


--
-- Name: idx_community_reply_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_reply_member_id ON public.xy_community_reply USING btree (member_id);


--
-- Name: idx_community_reply_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_reply_parent_id ON public.xy_community_reply USING btree (parent_id);


--
-- Name: idx_community_reply_post_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_reply_post_id ON public.xy_community_reply USING btree (post_id);


--
-- Name: idx_community_search_log_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_search_log_created_at ON public.xy_community_search_log USING btree (created_at);


--
-- Name: idx_community_search_log_keyword; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_community_search_log_keyword ON public.xy_community_search_log USING btree (keyword);


--
-- Name: uk_cms_doc_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uk_cms_doc_slug ON public.xy_cms_doc USING btree (slug);


--
-- PostgreSQL database dump complete
--

