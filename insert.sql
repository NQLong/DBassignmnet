call INSERT_TAIXE('12345678','2012-12-12','123455', '12345', '6789');
select * from TaiXe join NhanVien where TaiXe.CMND = NhanVien.CMND;
delete from TaiXe where CMND = '12345678';