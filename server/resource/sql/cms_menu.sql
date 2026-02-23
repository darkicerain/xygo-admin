SET client_encoding TO 'UTF8';

-- CMS 文档模块菜单数据

-- 1. 更新顶级目录
UPDATE public.xy_admin_menu SET
  title = '内容管理',
  path = '/cms',
  name = 'Cms',
  icon = 'ri:article-line',
  sort = 85
WHERE id = 80;

-- 2. 删除旧的子菜单
DELETE FROM public.xy_admin_menu WHERE parent_id = 80;

-- 3. 文档分类菜单
INSERT INTO public.xy_admin_menu (id, parent_id, type, title, name, path, component, icon, hidden, keep_alive, sort, status, perms, remark, create_time, update_time)
VALUES
  (630, 80, 2, '文档分类', 'CmsDocCategory', 'doc-category', '/cms/doc-category', 'ri:folder-line', 0, 1, 1, 1, '', '文档分类管理', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int);

-- 4. 文档管理菜单
INSERT INTO public.xy_admin_menu (id, parent_id, type, title, name, path, component, icon, hidden, keep_alive, sort, status, perms, remark, create_time, update_time)
VALUES
  (631, 80, 2, '文档管理', 'CmsDoc', 'doc', '/cms/doc', 'ri:file-text-line', 0, 1, 2, 1, '', '文档内容管理', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int);

-- 5. 按钮权限
INSERT INTO public.xy_admin_menu (id, parent_id, type, title, name, path, component, icon, hidden, keep_alive, sort, status, perms, remark, create_time, update_time)
VALUES
  (632, 631, 3, '新增/编辑', 'CmsDocSave', '', '', '', 0, 0, 1, 1, '/admin/cms/doc/save', '新增或编辑文档', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (633, 631, 3, '删除', 'CmsDocDelete', '', '', '', 0, 0, 2, 1, '/admin/cms/doc/delete', '删除文档', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (634, 630, 3, '新增/编辑', 'CmsDocCategorySave', '', '', '', 0, 0, 1, 1, '/admin/cms/docCategory/save', '新增或编辑分类', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (635, 630, 3, '删除', 'CmsDocCategoryDelete', '', '', '', 0, 0, 2, 1, '/admin/cms/docCategory/delete', '删除分类', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int);

-- =============================================
-- 6. 案例管理菜单（分类管理集成在页面内，不单独建菜单）
-- =============================================
INSERT INTO public.xy_admin_menu (id, parent_id, type, title, name, path, component, icon, hidden, keep_alive, sort, status, perms, remark, create_time, update_time)
VALUES
  (641, 80, 2, '案例管理', 'CmsCase', 'case', '/cms/case', 'ri:gallery-line', 0, 1, 3, 1, '', '案例内容管理', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int);

-- 7. 案例模块按钮权限（全部挂在案例管理 641 下）
INSERT INTO public.xy_admin_menu (id, parent_id, type, title, name, path, component, icon, hidden, keep_alive, sort, status, perms, remark, create_time, update_time)
VALUES
  (642, 641, 3, '新增/编辑', 'CmsCaseSave', '', '', '', 0, 0, 1, 1, '/admin/cms/case/save', '新增或编辑案例', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (643, 641, 3, '删除', 'CmsCaseDelete', '', '', '', 0, 0, 2, 1, '/admin/cms/case/delete', '删除案例', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (644, 641, 3, '管理分类', 'CmsCaseCategorySave', '', '', '', 0, 0, 3, 1, '/admin/cms/caseCategory/save', '新增或编辑案例分类', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int),
  (645, 641, 3, '删除分类', 'CmsCaseCategoryDelete', '', '', '', 0, 0, 4, 1, '/admin/cms/caseCategory/delete', '删除案例分类', EXTRACT(EPOCH FROM NOW())::int, EXTRACT(EPOCH FROM NOW())::int);
