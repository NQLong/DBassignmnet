drop database something;
create database something;
use something;

create table NhanVien(
    CMND varchar(15) not null,
    NgayTuyendung date,
    DiaChi char(255),
    Ho char(255),
    Ten char(255),
    primary key (CMND)
);
create table SdtNhanVien(
	Std char(10) primary key,
    CMNDNhanVien varchar(15) not null,
    foreign key(CMNDNhanVien) references NhanVien(CMND)
);
create table NguoiQuanLy(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND)
);
create table TaiXe(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND)
);
create table LoXe(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND)
);
create table NhanVienNhapXuat(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND)
);
create table Kho(
    Tinh varchar(50),
    DiaChi varchar(50),
    DienTich float,
    Ten varchar(50),
    ID INT NOT NULL AUTO_INCREMENT,
    primary key (ID)
);
create table CuocXe(
    ID INT NOT NULL AUTO_INCREMENT,
    NgayDen date,
    NgayDi date,
    PhuongTien varchar(20),
    TaiXeCMND varchar(15),
    LoXeCMND varchar(15),
    primary key (ID),
    foreign key (TaiXeCMND) REFERENCES TaiXe(CMND),
    foreign key (LoXeCMND) REFERENCES LoXe(CMND)
);
create table CuocXeLienTinh(
    ID int not null,
    foreign key (ID) REFERENCES CuocXe(ID)
);
create table CuocXeNoiThanh(
    ID int not null,
    foreign key (ID) REFERENCES CuocXe(ID)
);
create table BienBanNhapXuat(
    ID INT NOT NULL AUTO_INCREMENT,
    KhoID int,
    NhanVienIO varchar(15),
    CuocXeID int not null,
    FOREIGN KEY (KhoID) REFERENCES Kho(ID),
    FOREIGN KEY (NhanVienIO) REFERENCES NhanVienNhapXuat(CMND),
    FOREIGN KEY (CuocXeID) REFERENCES CuocXeLienTinh(ID),
    primary key (ID)
);
create table BienBanXuat(
    ID INT NOT NULL,
    KhoDichID int not null,
    ##Kho đích
    foreign key (ID) REFERENCES BienBanNhapXuat(ID),
    foreign key (KhoDichID) REFERENCES Kho(ID)
);
create table BienBanNhap(
    ID INT NOT NULL,
    KhoNguonID int not null,
    ##Kho nguồn
    foreign key (ID) REFERENCES BienBanNhapXuat(ID),
    foreign key (KhoNguonID) REFERENCES Kho(ID)
);
create table KhachHang(
    ID int not null auto_increment primary key,
    Ten char(30),
    DiaChi varchar(50)
);
create table SdtKhachHang(
    Sdt char(10) primary key,
    IDKhachHang int not null auto_increment,
    foreign key(IDKhachHang) references KhachHang(ID)
);
create table NguoiGui(
    ID int not null auto_increment,
    foreign key(ID) references KhachHang(ID)
);

create table NguoiNhan(
    ID int not null auto_increment,
    foreign key(ID) references KhachHang(ID)
);

create table BienBanNguoIDung(
    ID int not null auto_increment primary key,
    IDKho int not null,
    foreign key (IDKho) references Kho(ID)
);

create table BienBanGui(
    ID int not null auto_increment,
    PhiNoiThanh int,
    NgayGui date,
    IDNguoiGui int,
    IDNGuoiNhan int,
    foreign key(ID) references BienBanNguoIDung(ID),
    foreign key(IDNguoiGui) references NguoiGui(ID),
    foreign key(IDNguoiNhan) references NguoiNhan(ID)
);
create table BienBanNhan(
    ID int not null auto_increment,
    PhiLienTinh int,
    NgayNhan date,
    PhiNoiThanh int,
    IDNguoiGui int,
    IDNGuoiNhan int,
    foreign key(ID) references BienBanNguoIDung(ID),
    foreign key(IDNguoiGui) references NguoiGui(ID),
    foreign key(IDNguoiNhan) references NguoiNhan(ID)
);
create table KienHang(
    ID int not null auto_increment primary key,
    KhoiLuong int,
    IDBienBanNguoIDung int,
    IDBienBanNhapXuat int,
    foreign key(IDBienBanNguoIDung) references BienBanNguoIDung(ID),
    foreign key(IDBienBanNhapXuat) references BienBanNhapXuat(ID)
);
CREATE TABLE PhuongTien (
    BienSoXe varchar(20) not null primary key,
    HangXe varchar(50),
    NgayMuaVe Date
);
CREATE TABLE XeNoiThanh (
    BienSoXe varchar(20),
    LoaiXe varchar(20),
    foreign key (BienSoXe) references PhuongTien(BienSoXe)
);
CREATE TABLE XeLienTinh (
    BienSoXe varchar(20) not null,
    SoContainer int,
    foreign key (BienSoXe) references PhuongTien(BienSoXe)
);

CREATE TABLE YeuCauLayHang (
    ID int not null auto_increment,
    SoKienHang int,
    KhoiLuong int,
    IDBienBanGui int,
    TrangThai enum('ChuaXuLy', 'DangXuLy', 'DaXuLy') default 'ChuaXuLy', 
    primary key (ID),
    foreign key (IDBienBanGui) references BienBanGui(ID)
);

CREATE TABLE YeuCau (
    YeuCauID int not null primary key,
    KhachHangID int,
    foreign key (YeuCauID) references YeuCauLayHang(ID),
    foreign key (KhachHangID) references NguoiGui(ID)
);

CREATE TABLE Gan (
    YeuCauID int not null,
    CuocXeID int not null,
    NguoiGui int not null,
    PhanHoi enum('Cho', 'TuChoi', 'ChapNhan') default 'cho',
    primary key (YeuCauID, CuocXeID),
    foreign key (YeuCauID) references YeuCauLayHang(ID),
    foreign key (YeuCauID) references YeuCauLayHang(ID),
    foreign key (CuocXeID) references CuocXe(ID)
);

-- DELIMITER $$
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `UPDATE_GAN`(YCID INT, CXID INT, PHANHOI enum('Cho','TuChoi','ChapNhan','ChapNhanBoiChuyenKhac'))
-- BEGIN
-- 		if (select count(*) from Gan where PhanHoi = 'ChapNhan' = 0) Then
-- 			UPDATE Gan
-- 			SET PhanHoi = PHANHOI
-- 			WHERE YeuCauID = YCID and CuocXeID = CXID;
            
--             if PHANHOI = 'ChapNhan' Then
-- 				UPDATE Gan
-- 				SET PhanHoi = 'ChapNhanBoiChuyenKhac'
-- 				WHERE YeuCauID = YCID and CuocXeID != CXID and PhanHoi = 'Cho';
                
                
--                 update YeuCauLayHang
--                 Set TrangThai = 'DangXuLy'
--                 Where ID = YCID;
--             end if;
            
            
--         end if;
        
-- END$$
-- DELIMITER ;