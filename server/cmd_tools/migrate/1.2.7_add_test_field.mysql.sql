-- Migration: 1.2.7
-- Description: 测试字段 - 给 sys_config 表加 test_field

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

CALL _add_col('xy_sys_config', 'test_field', "varchar(32) NOT NULL DEFAULT '' COMMENT '测试字段（v1.2.7）'");

DROP PROCEDURE IF EXISTS _add_col;
