DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_NHANVIEN`(FCMND VARCHAR(15))
BEGIN
	DELETE FROM NHANVIEN WHERE CMND = FCMND;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_KHO`(KID INT)
BEGIN
	DELETE FROM KHO WHERE ID = KID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_KIENHANG`(PID INT)
BEGIN
	DELETE FROM KIENHANG WHERE ID = PID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_khachhang`(CID INT, TEN varchar(40), DIACHI text, SDT varchar(15))
BEGIN
	IF SUBSTRING(SDT, 1, 1) != '0' THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'SO DIEN THOAI KHONG HOP LE';
	ELSE 
		UPDATE KHACHHANG
        SET TEN=TEN, DIACHI=DIACHI, SDT=SDT
        WHERE ID = CID;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_YEUCAULAYHANG`(UID INT)
BEGIN
	DELETE FROM YEUCAULAYHANG WHERE ID = UID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_CUOCXE`(CID INT)
BEGIN
	DELETE FROM CUOCXE WHERE ID = CID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DELETE_BIENBANNGUOIDUNG`(BID INT)
BEGIN
	DELETE FROM BIENBANNGUOIDUNG WHERE ID = BID; 
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_KHO`(TEN VARCHAR(40), TINH VARCHAR(40), DIACHI varchar(40), DIENTICH FLOAT)
BEGIN
	insert INTO KHO (TEN, TINH, DIACHI, DIENTICH)
    VALUES (TEN, TINH, DIACHI, DIENTICH);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_CUOCXE`(NGAYDI DATE, NGAYDEN DATE)
BEGIN
	IF datediff(NGAYDEN, NGAYDI) < 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'NGAYDEN HOAC NGAYDI KHONG HOP LE';
	ELSE
		INSERT INTO CUOCXE (NGAYDEN, NGAYDI)
        VALUES (NGAYDEN, NGAYDI);
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_KIENHANG`(KHOILUONG FLOAT)
BEGIN
	IF KHOILUONG <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'KHOI LUONG PHAI LON HON 0';
	else
		INSERT INTO KIENHANG (KHOILUONG)
        VALUES (KHOILUONG);
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_khachhang`(CID INT)
BEGIN
	DELETE FROM KHACHHANG WHERE ID = CID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_khachhang`(TEN varchar(40), DIACHI text, SDT varchar(15))
BEGIN
	IF SUBSTRING(SDT, 1, 1) != '0' THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'SO DIEN THOAI KHONG HOP LE';
	ELSE 
		INSERT INTO KHACHHANG (TEN, DIACHI, SDT)
        VALUES (TEN, DIACHI, SDT);
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_KIENHANG`(PID INT , KHOILUONG FLOAT)
BEGIN
	IF KHOILUONG <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'KHOI LUONG PHAI LON HON 0';
	else
		UPDATE KIENHANG 
        SET KHOILUONG = KHOILUONG
        WHERE ID = PID;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_NHANVIEN`(OCMND varchar(15), NCMND varchar(15), NGAYTUYENDUNG DATE, DIACHI VARCHAR(100), HO VARCHAR(10), TEN VARCHAR(40))
BEGIN
	IF OCMND != NCMND THEN
		IF (SELECT COUNT(CMND) FROM NHANVIEN WHERE CMND = NCMND) != 0 THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'SO CMND DA DUOC DANG KY';
			END IF;
		UPDATE NHANVIEN 
        SET CMND = NCMND, NGAYTUYENDUNG = NGAYTUYENDUNG, DIACHI = DIACHI, HO = HO, TEN = TEN
        WHERE CMND = OCMND;
	ELSE 
		UPDATE NHANVIEN 
        SET NGAYTUYENDUNG = NGAYTUYENDUNG, DIACHI = DIACHI, HO = HO, TEN = TEN
        WHERE CMND = OCMND;
	end if;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_KHO`(KID INT, TEN VARCHAR(40), TINH VARCHAR(40), DIACHI varchar(40), DIENTICH FLOAT )
BEGIN
	UPDATE KHO
    SET TEN = TEN, TINH = TINH, DIACHI = DIACHI, DIENTICH = DIENTICH
    WHERE ID = KID;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_BIENBANGUI`(NGAYGUI DATE, PHINOITHANH INT)
BEGIN
    IF PHINOITHANH < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'PHI NOI THANH PHAI LON HON 0';
	end if;
		CALL INSERT_BIENBANNGUOIDUNG();
        
        INSERT INTO BIENBANGUI (ID, NGAYGUI, PHINOITHANH)
        SELECT LAST_INSERT_ID() FROM BIENBANNGUOIDUNG, NGAYGUI, PHINOITHANH;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_CUOCXE`(CID INT, NGAYDI DATE, NGAYDEN DATE)
BEGIN
	IF datediff(NGAYDEN, NGAYDI) < 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'NGAYDEN HOAC NGAYDI KHONG HOP LE';
	ELSE
		UPDATE CUOCXE 
        SET NGAYDI = NGAYDI, NGAYDEN = NGAYDEN
        WHERE ID = CID;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_NHANVIEN`(TCMND varchar(15), NGAYTUYENDUNG DATE, DIACHI VARCHAR(100), HO VARCHAR(10), TEN VARCHAR(40), INIT_PHONE VARCHAR(15))
BEGIN
	IF SUBSTRING(INIT_PHONE, 1, 1) != '0' THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'SO DIEN THOAI KHONG HOP LE';
	END IF;
    
    IF (SELECT COUNT(CMND) FROM NHANVIEN WHERE CMND = TCMND) != 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'SO CMND DA DUOC DANG KY';
	END IF;
    
		-- CREATE A NHANVIEN AND A SDT
	INSERT INTO NHANVIEN (CMND, NGAYTUYENDUNG, DIACHI, HO, TEN)
    VALUES (TCMND, NGAYTUYENDUNG, DIACHI, HO, TEN);
    
    INSERT INTO SDT (CMND, SDT)
    VALUES (TCMND, INIT_PHONE);
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_YEUCAULAYHANG`(UID INT, TRANGTHAI VARCHAR(100), SOKIENHANG INT, KHOILUONG FLOAT )
BEGIN
	IF SOKIENHANG <= 0 THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'SO KIEN HANG PHAI LON HON 0';
	ELSEIF KHOILUONG <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'KHOI LUONG PHAI LON HON 0';
	else
		UPDATE YEUCAULAYHANG
        SET TRANGTHAI = TRANGTHAI, SOKIENHANG = SOKIENHANG, KHOILUONG = KHOILUONG
        WHERE ID = UID;
	END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_YEUCAULAYHANG`(TRANGTHAI VARCHAR(100), SOKIENHANG INT, KHOILUONG FLOAT)
BEGIN
	IF SOKIENHANG <= 0 THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'SO KIEN HANG PHAI LON HON 0';
	ELSEIF KHOILUONG <= 0 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'KHOI LUONG PHAI LON HON 0';
	else
		INSERT INTO YEU_CAU_LAY_HANG (TRANGTHAI, SOKIENHANG, KHOILUONG)
        VALUES (TRANGTHAI, SOKIENHANG, KHOILUONG);
	END IF;
END$$
DELIMITER ;
