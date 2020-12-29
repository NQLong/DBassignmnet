DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `KhachHangDenTu`(diachi1 varchar(10))
BEGIN
	select * from KhachHang
    where instr(DiaChi, diachi1) <> 0;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `TopNKhachHangGui`(n int)
BEGIN
	select count(*) as SoLanGui, ID, Ho, Ten from BienBanGui join KhachHang
    where ID = IDNguoiGui
    group by ID
    order by SoLanGui
    limit n;
END$$
DELIMITER ;
