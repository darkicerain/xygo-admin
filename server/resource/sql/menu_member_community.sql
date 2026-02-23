SET client_encoding TO 'UTF8';

-- 会员中心「我的社区」菜单
-- 在「我的账户」(id=4) 同级新增一个目录，下挂三个子菜单
-- 现有最大 ID = 11，从 20 开始留出空间

-- 1. 「我的社区」目录（menu_dir，与「我的账户」同级）
INSERT INTO public.xy_member_menu (id, pid, title, name, path, component, icon, menu_type, url, no_login_valid, extend, remark, type, permission, sort, status, created_at, updated_at)
VALUES (20, 0, '我的社区', 'my-community', '/user/community', '', 'ri:discuss-line', 'tab', '', 0, 'none', '', 'menu_dir', '', 110, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint);

-- 2. 我的帖子（name 对应 center.vue 里 activeMenu === 'my-posts'）
INSERT INTO public.xy_member_menu (id, pid, title, name, path, component, icon, menu_type, url, no_login_valid, extend, remark, type, permission, sort, status, created_at, updated_at)
VALUES (21, 20, '我的帖子', 'my-posts', '/user/my-posts', 'member/center', 'ri:file-text-line', 'tab', '', 0, 'none', '', 'menu', '', 111, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint);

-- 3. 我的回复
INSERT INTO public.xy_member_menu (id, pid, title, name, path, component, icon, menu_type, url, no_login_valid, extend, remark, type, permission, sort, status, created_at, updated_at)
VALUES (22, 20, '我的回复', 'my-replies', '/user/my-replies', 'member/center', 'ri:chat-3-line', 'tab', '', 0, 'none', '', 'menu', '', 112, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint);

-- 4. 我的收藏
INSERT INTO public.xy_member_menu (id, pid, title, name, path, component, icon, menu_type, url, no_login_valid, extend, remark, type, permission, sort, status, created_at, updated_at)
VALUES (23, 20, '我的收藏', 'my-collects', '/user/my-collects', 'member/center', 'ri:bookmark-line', 'tab', '', 0, 'none', '', 'menu', '', 113, 1, EXTRACT(EPOCH FROM NOW())::bigint, EXTRACT(EPOCH FROM NOW())::bigint);
