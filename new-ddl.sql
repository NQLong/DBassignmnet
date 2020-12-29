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
    foreign key(CMNDNhanVien) references NhanVien(CMND) on delete cascade
);
create table NguoiQuanLy(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND) on delete cascade
);
create table TaiXe(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND) on delete cascade
);
create table LoXe(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND) on delete cascade
);
create table NhanVienNhapXuat(
    CMND varchar(15) not null,
    FOREIGN KEY (CMND) REFERENCES NhanVien(CMND) on delete cascade
);
create table Kho(
    Tinh varchar(50),
    DiaChi varchar(50),
    DienTich float,
    Ten varchar(50),
    NguoiQuanLy VARCHAR(15),
    ID INT NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (NguoiQuanLy) REFERENCES NhanVien(CMND) on delete cascade,
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
    foreign key (TaiXeCMND) REFERENCES TaiXe(CMND) on delete cascade,
    foreign key (LoXeCMND) REFERENCES LoXe(CMND) on delete cascade
);
create table CuocXeLienTinh(
    ID int not null,
    foreign key (ID) REFERENCES CuocXe(ID) on delete cascade
);
create table CuocXeNoiThanh(
    ID int not null,
    foreign key (ID) REFERENCES CuocXe(ID) on delete cascade
);
create table BienBanNhapXuat(
    ID INT NOT NULL AUTO_INCREMENT,
    KhoID int,
    NhanVienIO varchar(15),
    CuocXeID int not null,
    FOREIGN KEY (KhoID) REFERENCES Kho(ID) on delete cascade,
    FOREIGN KEY (NhanVienIO) REFERENCES NhanVienNhapXuat(CMND) on delete cascade,
    FOREIGN KEY (CuocXeID) REFERENCES CuocXeLienTinh(ID) on delete cascade,
    primary key (ID)
);
create table BienBanXuat(
    ID INT NOT NULL,
    KhoDichID int not null,
    ##Kho đích
    foreign key (ID) REFERENCES BienBanNhapXuat(ID) on delete cascade,
    foreign key (KhoDichID) REFERENCES Kho(ID) on delete cascade
);
create table BienBanNhap(
    ID INT NOT NULL,
    KhoNguonID int not null,
    ##Kho nguồn
    foreign key (ID) REFERENCES BienBanNhapXuat(ID) on delete cascade,
    foreign key (KhoNguonID) REFERENCES Kho(ID) on delete cascade
);
create table KhachHang(
    ID int not null auto_increment primary key,
    Ten char(30),
    DiaChi varchar(50)
);
create table SdtKhachHang(
    Sdt char(10) primary key,
    IDKhachHang int not null auto_increment,
    foreign key(IDKhachHang) references KhachHang(ID) on delete cascade
);

create table NguoiGui(
    ID int not null auto_increment,
    foreign key(ID) references KhachHang(ID) on delete cascade
);

create table NguoiNhan(
    ID int not null auto_increment,
    foreign key(ID) references KhachHang(ID) on delete cascade
);

create table BienBanNguoIDung(
    ID int not null auto_increment primary key,
    IDKho int not null,
    CuocXeID int, 
    foreign key (CuocXeID) references CuocXeNoiThanh(ID) on delete cascade,
    foreign key (IDKho) references Kho(ID) on delete cascade
);

CREATE TABLE YeuCauLayHang (
    ID int not null auto_increment,
    SoKienHang int,
    KhoiLuong int,
    TrangThai enum('ChuaXuLy', 'DangXuLy', 'DaXuLy') default 'ChuaXuLy', 
    primary key (ID)
    
);

create table BienBanGui(
    ID int not null auto_increment,
    PhiNoiThanh int,
    NgayGui date,
    IDNguoiGui int,
    IDNGuoiNhan int,
    YeuCauLayHang int,
    foreign key(YeuCauLayHang) references YeuCauLayHang(ID) on delete cascade,
    foreign key(ID) references BienBanNguoIDung(ID) on delete cascade,
    foreign key(IDNguoiGui) references NguoiGui(ID) on delete cascade,
    foreign key(IDNguoiNhan) references NguoiNhan(ID) on delete cascade
);

create table BienBanNhan(
    ID int not null auto_increment,
    PhiLienTinh int,
    NgayNhan date,
    PhiNoiThanh int,
    IDNguoiGui int,
    IDNGuoiNhan int,
    foreign key(ID) references BienBanNguoIDung(ID) on delete cascade,
    foreign key(IDNguoiGui) references NguoiGui(ID) on delete cascade,
    foreign key(IDNguoiNhan) references NguoiNhan(ID) on delete cascade
);

create table KienHang(
    ID int not null auto_increment primary key,
    KhoiLuong int,
    IDBienBanNguoIDung int,
    IDBienBanNhapXuat int,
    foreign key(IDBienBanNguoIDung) references BienBanNguoIDung(ID) on delete cascade,
    foreign key(IDBienBanNhapXuat) references BienBanNhapXuat(ID) on delete cascade
);

CREATE TABLE PhuongTien (
    BienSoXe varchar(20) not null primary key,
    HangXe varchar(50),
    NgayMuaVe Date
);

CREATE TABLE XeNoiThanh (
    BienSoXe varchar(20),
    LoaiXe varchar(20),
    foreign key (BienSoXe) references PhuongTien(BienSoXe) on delete cascade
);
CREATE TABLE XeLienTinh (
    BienSoXe varchar(20) not null,
    SoContainer int,
    foreign key (BienSoXe) references PhuongTien(BienSoXe) on delete cascade
);

CREATE TABLE YeuCau (
    YeuCauID int not null primary key,
    KhachHangID int,
    foreign key (YeuCauID) references YeuCauLayHang(ID) on delete cascade,
    foreign key (KhachHangID) references NguoiGui(ID) on delete cascade
);

CREATE TABLE Gan (
    YeuCauID int not null,
    CuocXeID int not null,
    NguoiGui int not null,
    PhanHoi enum('Cho','TuChoi','ChapNhan','DaCoPhanHoi') default 'Cho',
    primary key (YeuCauID, CuocXeID),
    foreign key (YeuCauID) references YeuCauLayHang(ID) on delete cascade,
    foreign key (YeuCauID) references YeuCauLayHang(ID) on delete cascade,
    foreign key (CuocXeID) references CuocXe(ID) on delete cascade
);