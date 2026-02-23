SET client_encoding TO 'UTF8';

-- ============================================================
-- 社区管理后台菜单（挂在内容管理 id=80 下）
-- ============================================================

-- 社区管理菜单
INSERT INTO public.xy_admin_menu (id, parent_id, type, title, name, path, component, icon, hidden, keep_alive, sort, status, perms, remark, create_time, update_time)
VALUES
  (650, 80, 2, '社区管理', 'CmsCommunity', 'community', '/cms/community', 'ri:discuss-line', 0, 1, 5, 1, '', '社区帖子管理', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int);

-- 按钮权限
INSERT INTO public.xy_admin_menu (id, parent_id, type, title, name, path, component, icon, hidden, keep_alive, sort, status, perms, remark, create_time, update_time)
VALUES
  (651, 650, 3, '编辑帖子', 'CmsCommunityPostUpdate', '', '', '', 0, 0, 1, 1, '/admin/cms/community/postUpdate', '编辑帖子(置顶/精华/状态)', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (652, 650, 3, '删除帖子', 'CmsCommunityPostDelete', '', '', '', 0, 0, 2, 1, '/admin/cms/community/postDelete', '删除帖子', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (653, 650, 3, '管理分类', 'CmsCommunityCategory', '', '', '', 0, 0, 3, 1, '/admin/cms/community/categorySave', '管理社区分类', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (654, 650, 3, '删除回复', 'CmsCommunityReplyDelete', '', '', '', 0, 0, 4, 1, '/admin/cms/community/replyDelete', '删除回复', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int);
