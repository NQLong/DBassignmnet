DELIMITER $$
CREATE TRIGGER after_Gan_update
AFTER UPDATE
ON Gan FOR EACH ROW
BEGIN
    IF new.PhanHoi = 'ChapNhan' THEN
        UPDATE Gan
		SET PhanHoi = 'DaCoPhanHoi'
		WHERE YeuCauID = old.YeuCauID and CuocXeID != old.CuocXeID and PhanHoi = 'Cho';


        update YeuCauLayHang
        Set TrangThai = 'DangXuLy'
        Where ID = old.YeuCauID;
    END IF;
END$$

DELIMITER ;


DELIMITER $$
CREATE TRIGGER after_BienBanGui_insert
AFTER INSERT
ON BienBanGui FOR EACH ROW
BEGIN
    IF new.YeuCauLayHang <> null THEN
        If select count(*) from YeuCauLayHang <> 0 Then
            update YeuCauLayHang
            Set TrangThai = 'DaXuLy'
            Where ID = old.YeuCauID;
        End IF;
    END IF;
END$$

DELIMITER ;



