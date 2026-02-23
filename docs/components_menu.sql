-- ============================================================
-- 组件中心 - 新增组件菜单 SQL
-- ============================================================
-- 说明：将新创建的组件添加到组件中心（Widgets）菜单下
-- 父级菜单 parent_id = 20 (组件中心 - Widgets)
-- ============================================================

-- 1. 图标选择器 (Icon Selector)
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `create_time`, `update_time`
) VALUES (
  20, -- parent_id: 组件中心
  2, -- type: 页面
  '图标选择器', -- title
  'IconSelector', -- name
  'icon-selector', -- path
  '/widgets/icon-selector', -- component
  'ri:palette-line', -- icon
  0, -- hidden: 显示
  1, -- keep_alive: 缓存
  '', -- redirect
  '', -- frame_src
  '', -- perms
  0, -- is_frame
  0, -- affix
  0, -- show_badge
  '', -- badge_text
  '', -- active_path
  0, -- hide_tab
  0, -- is_full_page
  33, -- sort
  1, -- status: 启用
  '图标选择器组件', -- remark
  UNIX_TIMESTAMP(), -- create_time
  UNIX_TIMESTAMP() -- update_time
);

-- 2. 颜色选择器 (Color Picker)
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `create_time`, `update_time`
) VALUES (
  20,
  2,
  '颜色选择器',
  'ColorPicker',
  'color-picker',
  '/widgets/color-picker',
  'ri:palette-fill',
  0,
  1,
  '',
  '',
  '',
  0,
  0,
  0,
  '',
  '',
  0,
  0,
  34,
  1,
  '颜色选择器组件',
  UNIX_TIMESTAMP(),
  UNIX_TIMESTAMP()
);

-- 3. 图片上传 (Image Upload)
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `create_time`, `update_time`
) VALUES (
  20,
  2,
  '图片上传',
  'ImageUpload',
  'image-upload',
  '/widgets/image-upload',
  'ri:image-2-line',
  0,
  1,
  '',
  '',
  '',
  0,
  0,
  0,
  '',
  '',
  0,
  0,
  35,
  1,
  '图片上传组件',
  UNIX_TIMESTAMP(),
  UNIX_TIMESTAMP()
);

-- 4. 文件上传 (File Upload)
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `create_time`, `update_time`
) VALUES (
  20,
  2,
  '文件上传',
  'FileUpload',
  'file-upload',
  '/widgets/file-upload',
  'ri:file-upload-line',
  0,
  1,
  '',
  '',
  '',
  0,
  0,
  0,
  '',
  '',
  0,
  0,
  36,
  1,
  '文件上传组件',
  UNIX_TIMESTAMP(),
  UNIX_TIMESTAMP()
);

-- 5. 数组编辑器 (Array Editor)
INSERT INTO `xy_admin_menu` (
  `parent_id`, `type`, `title`, `name`, `path`, `component`, 
  `icon`, `hidden`, `keep_alive`, `redirect`, `frame_src`, 
  `perms`, `is_frame`, `affix`, `show_badge`, `badge_text`, 
  `active_path`, `hide_tab`, `is_full_page`, `sort`, `status`, `remark`,
  `create_time`, `update_time`
) VALUES (
  20,
  2,
  '数组编辑器',
  'ArrayEditor',
  'array-editor',
  '/widgets/array-editor',
  'ri:list-settings-line',
  0,
  1,
  '',
  '',
  '',
  0,
  0,
  0,
  '',
  '',
  0,
  0,
  37,
  1,
  '多维数组编辑器组件',
  UNIX_TIMESTAMP(),
  UNIX_TIMESTAMP()
);

-- ============================================================
-- 菜单说明
-- ============================================================
-- parent_id: 20 = 组件中心 (Widgets)
-- type: 1=菜单, 2=页面
-- sort: 33-36 (紧跟在现有组件后面)
-- icon: 使用 Remix Icon
--   - ri:palette-line (调色板线性)
--   - ri:palette-fill (调色板填充)
--   - ri:image-2-line (图片)
--   - ri:file-upload-line (文件上传)
-- ============================================================

-- 验证查询
SELECT 
  id, parent_id, type, title, name, path, component, icon, sort, status
FROM `xy_admin_menu`
WHERE parent_id = 20
ORDER BY sort ASC;
