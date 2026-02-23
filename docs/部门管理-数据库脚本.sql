-- 部门管理表结构和初始数据

-- 1. 创建部门表（如果不存在）
CREATE TABLE IF NOT EXISTS `xy_admin_dept` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',
    `parent_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT '上级部门ID',
    `name` varchar(50) NOT NULL COMMENT '部门名称',
    `sort` int NOT NULL DEFAULT '0' COMMENT '排序',
    `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态:0禁用,1启用',
    `remark` varchar(500) DEFAULT NULL COMMENT '备注',
    `create_by` bigint unsigned DEFAULT '0' COMMENT '创建人',
    `create_time` int unsigned DEFAULT NULL COMMENT '创建时间',
    `update_time` int unsigned DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门管理';

-- 2. 创建部门闭包表（用于快速查询部门层级关系）
CREATE TABLE IF NOT EXISTS `xy_admin_dept_closure` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `ancestor` bigint unsigned NOT NULL COMMENT '祖先部门ID',
    `descendant` bigint unsigned NOT NULL COMMENT '后代部门ID',
    `level` int NOT NULL DEFAULT '0' COMMENT '层级深度',
    PRIMARY KEY (`id`),
    KEY `idx_ancestor` (`ancestor`),
    KEY `idx_descendant` (`descendant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='部门闭包表';

-- 3. 插入初始数据（总公司及其下属部门）
INSERT INTO `xy_admin_dept` (`parent_id`, `name`, `sort`, `status`, `remark`, `create_time`, `update_time`) VALUES
(0, '总公司', 1, 1, '顶级部门', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(1, '技术部', 1, 1, '负责技术开发', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(1, '市场部', 2, 1, '负责市场推广', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(1, '财务部', 3, 1, '负责财务管理', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, '前端组', 1, 1, '前端开发团队', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(2, '后端组', 2, 1, '后端开发团队', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(3, '线上推广组', 1, 1, '负责线上营销', UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
(3, '线下推广组', 2, 1, '负责线下活动', UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

-- 4. 构建闭包关系（手动插入，实际项目中可通过触发器自动维护）
-- 总公司（id=1）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES (1, 1, 0);

-- 技术部（id=2）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES 
(1, 2, 1), (2, 2, 0);

-- 市场部（id=3）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES 
(1, 3, 1), (3, 3, 0);

-- 财务部（id=4）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES 
(1, 4, 1), (4, 4, 0);

-- 前端组（id=5）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES 
(1, 5, 2), (2, 5, 1), (5, 5, 0);

-- 后端组（id=6）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES 
(1, 6, 2), (2, 6, 1), (6, 6, 0);

-- 线上推广组（id=7）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES 
(1, 7, 2), (3, 7, 1), (7, 7, 0);

-- 线下推广组（id=8）
INSERT INTO `xy_admin_dept_closure` (`ancestor`, `descendant`, `level`) VALUES 
(1, 8, 2), (3, 8, 1), (8, 8, 0);
