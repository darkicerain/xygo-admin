SET client_encoding TO 'UTF8';

-- ============================================================
-- CMS 案例分类初始数据（PostgreSQL 版本）
-- 表: xy_cms_case_category
-- ============================================================

INSERT INTO xy_cms_case_category (pid, title, icon, sort, status, remark, created_at, updated_at) VALUES
(0, '小程序',   'ri:mini-program-line', 5, 1, '', EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
(0, '公众号',   'ri:wechat-line',       4, 1, '', EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
(0, 'APP',      'ri:smartphone-line',   3, 1, '', EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
(0, '网站系统', 'ri:computer-line',     2, 1, '', EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint),
(0, '物联网',   'ri:router-line',       1, 1, '', EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint);
