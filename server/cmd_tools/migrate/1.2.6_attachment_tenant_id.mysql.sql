-- Migration: 1.2.6
-- Description: 附件表增加 tenant_id 字段，支持按租户隔离

DELIMITER $$
DROP PROCEDURE IF EXISTS _add_col$$
CREATE PROCEDURE _add_col(IN p_tbl VARCHAR(64), IN p_col VARCHAR(64), IN p_def TEXT)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = DATABASE() AND table_name = p_tbl AND column_name = p_col
    ) THEN
        SET @sql = CONCAT('ALTER TABLE `', p_tbl, '` ADD COLUMN `', p_col, '` ', p_def);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$
DELIMITER ;

CALL _add_col('xy_sys_attachment', 'tenant_id', "bigint NOT NULL DEFAULT 0 COMMENT '所属租户ID（0=平台）'");

DROP PROCEDURE IF EXISTS _add_col;

DELIMITER $$
DROP PROCEDURE IF EXISTS _add_idx$$
CREATE PROCEDURE _add_idx(IN p_tbl VARCHAR(64), IN p_idx VARCHAR(64), IN p_def TEXT)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE() AND table_name = p_tbl AND index_name = p_idx
    ) THEN
        SET @sql = CONCAT('ALTER TABLE `', p_tbl, '` ADD INDEX `', p_idx, '` ', p_def);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$
DELIMITER ;

CALL _add_idx('xy_sys_attachment', 'idx_att_tenant', '(`tenant_id`)');

DROP PROCEDURE IF EXISTS _add_idx;
