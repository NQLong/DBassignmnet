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
    
    delete from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_LoXe
    after DELETE
    ON LoXe FOR EACH ROW
BEGIN
    
    delete from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delete_NguoiQuanLy
    after DELETE
    ON NguoiQuanLy FOR EACH ROW
BEGIN
    
    delete from NhanVien where CMND = old.CMND;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER delete_NhanVienNhapXuat
    after DELETE
    ON NhanVienNhapXuat FOR EACH ROW
BEGIN
    delete from NhanVienNhapXuat where CMND = old.CMND;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delete_BienBanGui
    after DELETE
    ON BienBanGui FOR EACH ROW
BEGIN
    delete from BienBanNguoIDung where ID = old.ID;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_BienBanNhan
    after DELETE
    ON BienBanNhan FOR EACH ROW
BEGIN
    delete from BienBanNguoIDung where ID = old.ID;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER delete_BienBanXuat
    after DELETE
    ON BienBanXuat FOR EACH ROW
BEGIN
    delete from BienBanNhapXuat where ID = old.ID;
END$$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delete_BienBanNhap
    after DELETE
    ON BienBanNhap FOR EACH ROW
BEGIN
    delete from BienBanNhapXuat where ID = old.ID;
END$$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delete_XeNoiThanh
    after DELETE
    ON XeNoiThanh FOR EACH ROW
BEGIN
    delete from PhuongTien where BienSoXe = old.BienSoXe;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER delete_XeLienTinh
    after DELETE
    ON XeLienTinh FOR EACH ROW
BEGIN
    delete from PhuongTien where BienSoXe = old.BienSoXe;
END$$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER CHECK_AREA
    BEFORE UPDATE
    ON kho FOR EACH ROW
BEGIN 
    IF NEW.DienTich < 10 THEN
		SIGNAL sqlstate '45001' set message_text = "Hay nhap lai";
    END IF;
END$$    
DELIMITER ;

DELIMITER $$
DROP TRIGGER IF EXISTS CHECK_CUSTOMER;
CREATE TRIGGER CHECK_CUSTOMER
    BEFORE INSERT
    ON khachhang FOR EACH ROW
BEGIN 
    IF NEW.Ten REGEXP '[0123456789]' THEN
		SIGNAL sqlstate '45001' set message_text = "No way ! You cannot do this !";
    END IF;
END$$    
DELIMITER ;