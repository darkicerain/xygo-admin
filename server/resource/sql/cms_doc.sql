-- ============================================================
-- CMS 文档模块建表脚本（MySQL 版本）
-- 表前缀: xy_
-- ============================================================

-- --------------------------------------------------------
-- 表的结构 `xy_cms_doc_category` — 文档分类（树形）
-- --------------------------------------------------------

CREATE TABLE `xy_cms_doc_category` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '分类ID',
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父分类ID(0=顶级)',
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `icon` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序(越大越靠前)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:1=正常,2=禁用',
  `remark` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文档分类表';

-- --------------------------------------------------------
-- 表的结构 `xy_cms_doc` — 文档内容
-- --------------------------------------------------------

CREATE TABLE `xy_cms_doc` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '文档ID',
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文档标题',
  `slug` varchar(200) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'URL标识(唯一)',
  `cover` varchar(500) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `summary` varchar(500) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '摘要',
  `content` longtext COLLATE utf8mb4_general_ci COMMENT '文档内容(Markdown)',
  `author` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '浏览量',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序(越大越靠前)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:1=已发布,2=草稿,3=下架',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶:0=否,1=是',
  `tags` varchar(500) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签(JSON数组)',
  `created_by` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `updated_by` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新人ID',
  `created_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `deleted_at` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '删除时间(软删除)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文档内容表';

-- --------------------------------------------------------
-- 索引
-- --------------------------------------------------------

ALTER TABLE `xy_cms_doc_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pid` (`pid`),
  ADD KEY `idx_status_sort` (`status`, `sort`);

ALTER TABLE `xy_cms_doc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_slug` (`slug`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_sort` (`sort`),
  ADD KEY `idx_created` (`created_at`),
  ADD KEY `idx_deleted` (`deleted_at`);

-- --------------------------------------------------------
-- AUTO_INCREMENT
-- --------------------------------------------------------

ALTER TABLE `xy_cms_doc_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID';

ALTER TABLE `xy_cms_doc`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID';
