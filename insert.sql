call INSERT_TAIXE('12345678','2012-12-12','123455', '12345', '6789');
select * from TaiXe join NhanVien where TaiXe.CMND = NhanVien.CMND;
delete from TaiXe where CMND = '12345678';
call INSERT_PHUONGTIEN("49G1-15677","Toyota","2016-06-15")
call INSERT_PHUONGTIEN("60G1-39512","Hyundai","2016-06-15")
call INSERT_PHUONGTIEN("40G1-14677","Isuzu","2012-06-15")
call INSERT_PHUONGTIEN("50G1-28765","Toyota","2012-06-15")
call INSERT_PHUONGTIEN("20G1-18721","Hyundai","2012-06-15")
SELECT*FROM PhuongTien
call INSERT_NHANVIEN("251215170","2020-12-12","KTX khu A","Dang","Manh"),
call INSERT_NHANVIEN("251215200","2018-12-20","KTX khu B","Dang","Sieu")
call INSERT_NHANVIEN("251215230","2016-7-15","Linh Trung,Thu Duc","Nguyen","Cuong")
call INSERT_NHANVIEN("251215260","2014-7-30","Linh Dong, Thu Duc","Tran","Vinh")
call INSERT_NHANVIEN("251215290","2017-9-24","Phuong 12, quan Tan Binh","Ly","Cuong")
select*FROM NhanVien
call INSERT_KHACHHANG("Long","Phuong 14, quan 10")
call INSERT_KHACHHANG("Quoc","Lam Dong")
call INSERT_KHACHHANG("Thang","An Giang")
call INSERT_KHACHHANG("Dung","Ha Noi")
call INSERT_KHACHHANG("Long","Da Nang")
select * FROM KhachHang
