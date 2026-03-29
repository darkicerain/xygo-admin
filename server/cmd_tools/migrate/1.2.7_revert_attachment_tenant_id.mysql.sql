-- Migration: 1.2.7
-- Description: 回滚测试 - 删除附件表的 tenant_id 字段和索引

DELIMITER $$
DROP PROCEDURE IF EXISTS _drop_idx$$
CREATE PROCEDURE _drop_idx(IN p_tbl VARCHAR(64), IN p_idx VARCHAR(64))
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.statistics
        WHERE table_schema = DATABASE() AND table_name = p_tbl AND index_name = p_idx
    ) THEN
        SET @sql = CONCAT('ALTER TABLE `', p_tbl, '` DROP INDEX `', p_idx, '`');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$
DELIMITER ;

CALL _drop_idx('xy_sys_attachment', 'idx_att_tenant');
DROP PROCEDURE IF EXISTS _drop_idx;

DELIMITER $$
DROP PROCEDURE IF EXISTS _drop_col$$
CREATE PROCEDURE _drop_col(IN p_tbl VARCHAR(64), IN p_col VARCHAR(64))
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.columns
        WHERE table_schema = DATABASE() AND table_name = p_tbl AND column_name = p_col
    ) THEN
        SET @sql = CONCAT('ALTER TABLE `', p_tbl, '` DROP COLUMN `', p_col, '`');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END$$
DELIMITER ;

CALL _drop_col('xy_sys_attachment', 'tenant_id');
DROP PROCEDURE IF EXISTS _drop_col;
