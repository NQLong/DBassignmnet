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
    
    delete CASCADE from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_LoXe
    after DELETE
    ON LoXe FOR EACH ROW
BEGIN
    
    delete CASCADE from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delete_NguoiQuanLy
    after DELETE
    ON NguoiQuanLy FOR EACH ROW
BEGIN
    
    delete CASCADE from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER delete_NhanVienNhapXuat
    after DELETE
    ON NhanVienNhapXuat FOR EACH ROW
BEGIN
    delete CASCADE from NhanVienNhapXuat where CMND = old.CMND;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delete_BienBanGui
    after DELETE
    ON BienBanGui FOR EACH ROW
BEGIN
    delete CASCADE from BienBanNguoIDung where ID = old.ID;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_BienBanNhan
    after DELETE
    ON BienBanNhan FOR EACH ROW
BEGIN
    delete CASCADE from BienBanNguoIDung where ID = old.ID;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER delete_BienBanXuat
    after DELETE
    ON BienBanXuat FOR EACH ROW
BEGIN
    delete CASCADE from BienBanNhapXuat where ID = old.ID;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delete_BienBanNhap
    after DELETE
    ON BienBanNhap FOR EACH ROW
BEGIN
    delete CASCADE from BienBanNhapXuat where ID = old.ID;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_XeNoiThanh
    after DELETE
    ON XeNoiThanh FOR EACH ROW
BEGIN
    delete CASCADE from PhuongTien where BienSoXe = old.BienSoXe;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER delete_XeLienTinh
    after DELETE
    ON XeLienTinh FOR EACH ROW
BEGIN
    delete CASCADE from PhuongTien where BienSoXe = old.BienSoXe;
END$$

DELIMITER ;