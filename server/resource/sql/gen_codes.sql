-- ============================================================
-- 代码生成器 - 建表脚本
-- ============================================================

-- 生成配置主表
CREATE TABLE IF NOT EXISTS `xy_sys_gen_codes` (
  `id`            bigint       UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gen_type`      tinyint      UNSIGNED NOT NULL DEFAULT 10     COMMENT '生成类型:10=普通列表,11=树表',
  `db_name`       varchar(50)  NOT NULL DEFAULT ''              COMMENT '数据库名',
  `table_name`    varchar(100) NOT NULL DEFAULT ''              COMMENT '数据表名',
  `table_comment` varchar(200) NOT NULL DEFAULT ''              COMMENT '表注释(菜单名)',
  `var_name`      varchar(100) NOT NULL DEFAULT ''              COMMENT '实体名(PascalCase)',
  `options`       json                  DEFAULT NULL            COMMENT '生成选项(JSON)',
  `status`        tinyint      UNSIGNED NOT NULL DEFAULT 2      COMMENT '状态:1=已生成,2=未生成',
  `created_at`    bigint       UNSIGNED NOT NULL DEFAULT 0      COMMENT '创建时间戳',
  `updated_at`    bigint       UNSIGNED NOT NULL DEFAULT 0      COMMENT '更新时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_table` (`db_name`, `table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成配置主表';

-- 字段配置表
CREATE TABLE IF NOT EXISTS `xy_sys_gen_codes_column` (
  `id`          bigint       UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gen_id`      bigint       UNSIGNED NOT NULL DEFAULT 0      COMMENT '关联gen_codes.id',
  `name`        varchar(100) NOT NULL DEFAULT ''              COMMENT '数据库字段名',
  `go_name`     varchar(100) NOT NULL DEFAULT ''              COMMENT 'Go字段名',
  `ts_name`     varchar(100) NOT NULL DEFAULT ''              COMMENT 'TS字段名',
  `db_type`     varchar(50)  NOT NULL DEFAULT ''              COMMENT '数据库类型',
  `go_type`     varchar(50)  NOT NULL DEFAULT ''              COMMENT 'Go类型',
  `ts_type`     varchar(50)  NOT NULL DEFAULT ''              COMMENT 'TS类型',
  `comment`     varchar(200) NOT NULL DEFAULT ''              COMMENT '字段注释',
  `is_pk`       tinyint      UNSIGNED NOT NULL DEFAULT 0      COMMENT '是否主键:0=否,1=是',
  `is_required` tinyint      UNSIGNED NOT NULL DEFAULT 0      COMMENT '是否必填:0=否,1=是',
  `is_list`     tinyint      UNSIGNED NOT NULL DEFAULT 1      COMMENT '表格列显示:0=否,1=是',
  `is_edit`     tinyint      UNSIGNED NOT NULL DEFAULT 1      COMMENT '表单编辑显示:0=否,1=是',
  `is_query`    tinyint      UNSIGNED NOT NULL DEFAULT 0      COMMENT '搜索条件:0=否,1=是',
  `query_type`  varchar(20)  NOT NULL DEFAULT 'eq'            COMMENT '查询方式:eq/like/between/gt/in',
  `form_type`   varchar(30)  NOT NULL DEFAULT 'input'         COMMENT '表单组件类型',
  `design_type` varchar(30)  NOT NULL DEFAULT ''              COMMENT '设计类型(designType)',
  `extra`       text                  DEFAULT NULL            COMMENT '扩展配置JSON',
  `dict_type`   varchar(50)  NOT NULL DEFAULT ''              COMMENT '关联字典',
  `sort`        int          UNSIGNED NOT NULL DEFAULT 0      COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `idx_gen_id` (`gen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成字段配置表';
