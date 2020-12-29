DELIMITER $$ CREATE DEFINER = `root` @`localhost` FUNCTION `LoinhuanTrongNam`(YR YEAR) RETURNS int(11) BEGIN
SET @Noithanh_GUI = 0;
SET @Noithanh_NHAN = 0;
SET @Lientinh_GUI = 0;
select SUM(PhiNoiThanh) into @Noithanh_GUI
from BienBanGui
where (
        select year(NgayGui)
        from BienBanGui
    ) = YR;
select SUM(PhiNoiThanh) into @Noithanh_NHAN
from BienBanNhan
where (
        select year(NgayNhan)
        from BienBanNhan
    ) = YR;
select SUM(PhiLienTinh) into @Lientinh_GUI
from BienBanGui
where (
        select year(NgayGui)
        from BienBanGui
    ) = YR;
RETURN @Noithanh_GUI + @Noithanh_NHAN + @Lientinh_GUI;
END Delimiter;
DELIMITER $$ CREATE DEFINER = `root` @`localhost` FUNCTION `TongChiTieuCuaKhachHang`(id int) RETURNS int(11) BEGIN
set @gui = 0;
select Sum(PhiNoithanh) into @gui
from BienBanGui
where IDNguoiGui = id;
set @nhan = 0;
select (Sum(PhiLientinh) + Sum(PhiNoithanh)) into @nhan
from BienBanNhan
where IDNguoiNhan = id;
RETURN @gui + @nhan;
END Delimiter;