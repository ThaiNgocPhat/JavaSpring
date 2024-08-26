create database Baitap3;
use Baitap3;

create table PhieuXuat(
    soPx int primary key auto_increment,
    ngayXuat datetime
);

create table PhieuXuatChiTiet(
    soPx int,
    maVT int,
    donGiaXuat double,
    soLuongXuat int,
    foreign key (soPx) references PhieuXuat(soPx),
    foreign key (maVT) references VatTu(maVT)
);

create table ChiTietDonDatHang(
    maVt int,
    soHD int,
    foreign key (maVT) references VatTu(maVT),
    foreign key (soHD) references DonDatHang(soHD)
);

create table VatTu(
    maVT int primary key auto_increment,
    tenVT varchar(255)
)

create table DonDatHang(
    soHD int primary key auto_increment,
    maNCC int,
    ngayDH datetime
)

create table PhieuNhap(
    soPn int primary key auto_increment,
    ngayNhap datetime
);

create table PhieuNhapChiTiet(
    soPn int,
    maVT int,
    donGiaNhap double,
    soLuongNhap int,
    foreign key (soPn) references PhieuNhap(soPn),
    foreign key (maVT) references VatTu(maVT)
);

create table NhaCungCap(
    maNCC int,
    tenNCC varchar(255),
    diachi varchar(255),
    soDienThoai varchar(20),
    primary key (maNCC) references DonDatHang(maNCC)
);