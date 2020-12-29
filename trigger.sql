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
        If (select count(*) from YeuCauLayHang Where ID = new.YeuCauLayHang <> 0) Then
            update YeuCauLayHang
            Set TrangThai = 'DaXuLy'
            Where ID = new.YeuCauLayHang;
        End IF;
    END IF;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_TaiXe
    after DELETE
    ON TaiXe FOR EACH ROW
BEGIN
    
    Delete from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_LoXe
    after DELETE
    ON LoXe FOR EACH ROW
BEGIN
    
    Delete from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delete_NguoiQuanLy
    after DELETE
    ON NguoiQuanLy FOR EACH ROW
BEGIN
    
    Delete from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER delete_NhanVienNhapXuat
    after DELETE
    ON NhanVienNhapXuat FOR EACH ROW
BEGIN
    Delete from NhanVienNhapXuat where CMND = old.CMND;
END$$

DELIMITER ;

