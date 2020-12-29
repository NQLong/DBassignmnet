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

DELIMITER;