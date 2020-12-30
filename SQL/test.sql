use ass2;

-- cau 1 

CALL INSERT_KIENHANG(-5, 1, 1);	
CALL INSERT_YEUCAULAYHANG(-10, 10, 1);
CALL INSERT_KHO("Tp HCM", "Dai Hoc Bach Khoa", -1000, "Kho Bach Khoa");
CALL INSERT_SDTNHANVIEN("1234567890", "285763778");
call INSERT_CUOCXE("2020-12-12", "2020-12-14", "xe may", "285763777", "285763778");
CALL INSERT_XELIENTINH("93A-1234", "TOYOTA", "2020-2-2", -2);
CALL INSERT_SDTKHACHHANG("1234367892", 1);
CALL UPDATE_KHO(1, "Tp HCM", "Dai Hoc Bach Khoa", -1000, "Kho Bach Khoa 1");

-- -------------------------------------------------------------------------------------------------------------------
-- cau 2 trigger
-- trigger 1 ,2 xoa tai xe hoac lo xe, nhan vien do cung bi xoa
 
-- call INSERT_TAIXE("295763772", "2020-1-2", "KTX KHU A", "Nguyen", "Long");
-- call INSERT_TAIXE("291263256", "2020-1-2", "KTX KHU A", "Le", "Hung");
-- call INSERT_TAIXE("295763133", "2020-1-2", "KTX KHU A", "Le", "An");
-- call INSERT_TAIXE("295734643", "2020-1-2", "KTX KHU A", "Le", "Hieu");
-- call INSERT_TAIXE("291263743", "2020-1-2", "KTX KHU A", "Le", "Trung");
-- call INSERT_LOXE("285763778", "2020-2-2", "KTX KHU B", "TRUONG", "LONG");
-- call INSERT_LOXE("285234578", "2020-2-2", "KTX KHU B", "Vu", "Le");
-- call INSERT_LOXE("281234778", "2020-2-2", "KTX KHU B", "Hai", "Long");
-- call INSERT_LOXE("132243778", "2020-2-2", "KTX KHU B", "Le", "LONG");
-- call INSERT_LOXE("546783778", "2020-2-2", "KTX KHU B", "Binh", "LONG");
-- delete from taixe where 1;
-- delete from loxe where 1;

delete from taixe where CMND="295763772";
delete from LoXe where CMND="285763778";

select* from NhanVien;
select* from TaiXe;
select* from LoXe;

-- -------------------------------------------------------------------------------------------------------------------
-- trigger 3  xoa xe noi thanh, phuong tien cung bi xoa

-- CALL INSERT_XENOITHANH("49G1-15677","Toyota","2016-06-15", "container");
-- CALL INSERT_XENOITHANH("60G1-39512","Hyundai","2016-06-15", "container");
-- CALL INSERT_XENOITHANH("40G1-14677","Isuzu","2012-06-15", "container");
-- CALL INSERT_XENOITHANH("50G1-28765","Toyota","2012-06-15", "container");
-- CALL INSERT_XENOITHANH("20G1-18721","Hyundai","2012-06-15", "container");

select* from XeNoiThanh;
select* from PhuongTien;
DELETE	FROM XeNoiThanh WHERE BienSoXe = "20G1-18721";
delete from XeNoiThanh where 1; 
delete from PhuongTien;

-- trigger 4 khi update kho kiem tra dien tich kho phai lon hon 10

select * from kho;
CALL UPDATE_KHO(1, "Tp HCM", "Dai Hoc Bach Khoa", 5, "Kho Bach Khoa 1");

-- trigger 5 , khi them khach hang, kiem tra ten nguoi do hop le (khong co chu so)
CALL INSERT_KHACHHANG("Long123", "KTX khu B");

-- test cau 3, proce
-- proce tim khach hang theo dia chi 

-- DELETE FROM KHACHHANG WHERE 1;
-- DELETE FROM NGUOIGUI WHERE 1;
-- DELETE FROM NGUOINHAN WHERE 1;
-- CALL INSERT_NGUOIGUI("Long","Phuong 14, quan 10");
-- call INSERT_NGUOIGUI("Quoc","Lam Dong");
-- call INSERT_NGUOIGUI("Thang","An Giang");
-- call INSERT_NGUOINHAN("Dung","Ha Noi");
-- call INSERT_NGUOINHAN("Long","Da Nang");
-- select * FROM NGUOIGUI;
-- select * FROM NGUOINHAN;

select * FROM KhachHang;
call KhachHangDenTu("ong");

-- proce tim top khach hang 
-- CALL INSERT_KHO("Tp HCM", "Dai Hoc Bach Khoa", 1000, "Kho Bach Khoa");
-- CALL INSERT_BIENBANGUI(1,100000,"2020-12-12",1,5);
-- CALL INSERT_BIENBANGUI(1,100000,"2020-12-12",2,4);
-- CALL INSERT_BIENBANGUI(1,100000,"2020-12-12",1,4);
-- CALL INSERT_BIENBANGUI(1,100000,"2020-12-12",2,4);
-- CALL INSERT_BIENBANGUI(1,100000,"2020-12-12",2,4);
-- drop procedure TopNKhachHangGui;
-- DELETE FROM BIENBANGUI WHERE 1;

select * from BIENBANGUI;

CALL TopNKhachHangGui(2);
SELECT * FROM KHO;

-- -------------------------------------------------------------------------------------------------------------------
-- Cau 4 funtionc
-- funtion 1 loi nhuan trong nam 

select * from BIENBANNhan;
-- 	IDKHO INT, 	PHILIENTINH INT, NGAYNHAN DATE,	PHINOITHANH INT, 	IDNGUOIGUI INT, 	IDNGUOINHAN INT
CALL INSERT_BIENBANNHAN(1, 100000, "2020-12-12", 200, 1,5);
CALL INSERT_BIENBANNHAN(1, 120000, "2020-12-12", 300, 2,4);
CALL INSERT_BIENBANNHAN(1, 130000, "2020-12-12", 400, 1,4);
CALL INSERT_BIENBANNHAN(1, 150000, "2020-12-12", 200, 2,4);
CALL INSERT_BIENBANNHAN(1, 200000, "2020-12-12", 100, 2,4);

SELECT LoinhuanTrongNam("2020") ;
DELETE FROM BIENBANNHAN;
