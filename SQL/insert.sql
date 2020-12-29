call INSERT_NHANVIENNHAPXUAT("251215170","2020-12-12","KTX khu A","Dang","Manh");
call INSERT_NHANVIENNHAPXUAT("251215200","2018-12-20","KTX khu B","Dang","Sieu");
call INSERT_NHANVIENNHAPXUAT("251215230","2016-7-15","Linh Trung,Thu Duc","Nguyen","Cuong");
call INSERT_NHANVIENNHAPXUAT("251215260","2014-7-30","Linh Dong, Thu Duc","Tran","Vinh");
call INSERT_NHANVIENNHAPXUAT("251215290","2017-9-24","Phuong 12, quan Tan Binh","Ly","Cuong");
select*FROM NHANVIENNHAPXUAT;

call INSERT_NGUOIQUANLY("251215171","2020-12-12","KTX khu A","Dang","Manh");
call INSERT_NGUOIQUANLY("251215201","2018-12-20","KTX khu B","Dang","Sieu");
call INSERT_NGUOIQUANLY("251215231","2016-7-15","Linh Trung,Thu Duc","Nguyen","Cuong");
call INSERT_NGUOIQUANLY("251215261","2014-7-30","Linh Dong, Thu Duc","Tran","Vinh");
call INSERT_NGUOIQUANLY("251215291","2017-9-24","Phuong 12, quan Tan Binh","Ly","Cuong");
select*FROM NGUOIQUANLY;

call INSERT_LOXE("251215172","2020-12-12","KTX khu A","Dang","Manh");
call INSERT_LOXE("251215202","2018-12-20","KTX khu B","Dang","Sieu");
call INSERT_LOXE("251215232","2016-7-15","Linh Trung,Thu Duc","Nguyen","Cuong");
call INSERT_LOXE("251215262","2014-7-30","Linh Dong, Thu Duc","Tran","Vinh");
call INSERT_LOXE("251215292","2017-9-24","Phuong 12, quan Tan Binh","Ly","Cuong");
select*FROM LOXE;

call INSERT_TAIXE("251215173","2020-12-12","KTX khu A","Dang","Manh");
call INSERT_TAIXE("251215203","2018-12-20","KTX khu B","Dang","Sieu");
call INSERT_TAIXE("251215233","2016-7-15","Linh Trung,Thu Duc","Nguyen","Cuong");
call INSERT_TAIXE("251215263","2014-7-30","Linh Dong, Thu Duc","Tran","Vinh");
call INSERT_TAIXE("251215293","2017-9-24","Phuong 12, quan Tan Binh","Ly","Cuong");
select*FROM TAIXE;

call INSERT_KHACHHANG("Long","Phuong 14, quan 10");
call INSERT_KHACHHANG("Quoc","Lam Dong");
call INSERT_KHACHHANG("Thang","An Giang");
call INSERT_KHACHHANG("Dung","Ha Noi");
call INSERT_KHACHHANG("Long","Da Nang");
select * FROM KhachHang;

call INSERT_SDTKHACHHANG("0837219282",2);
call INSERT_SDTKHACHHANG("0982878192",1);
call INSERT_SDTKHACHHANG("0974622812",1);
call INSERT_SDTKHACHHANG("0908827123",1);
call INSERT_SDTKHACHHANG("0983727182",2);
select * FROM sdtkhachhang;

call INSERT_PHUONGTIEN("49G1-15677","Toyota","2016-06-15");
call INSERT_PHUONGTIEN("60G1-39512","Hyundai","2016-06-15");
call INSERT_PHUONGTIEN("40G1-14677","Isuzu","2012-06-15");
call INSERT_PHUONGTIEN("50G1-28765","Toyota","2012-06-15");
call INSERT_PHUONGTIEN("20G1-18721","Hyundai","2012-06-15");
SELECT*FROM PhuongTien;



call INSERT_NHANVIENNHAPXUAT("252215170","2020-12-12","KTX khu A","Dang","Manh");

delete from NHANVIENNHAPXUAT where CMND = '252215170';

CALL INSERT_NGUOIGUI("Long","Phuong 14, quan 10");
call INSERT_NGUOIGUI("Quoc","Lam Dong");

