create database Baitap3;
use Baitap3;
drop database Baitap3;

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
);

create table DonDatHang(
    soHD int primary key auto_increment,
    maNCC int,
    ngayDH datetime,
    index (maNCC) -- Add an index to the maNCC column
);

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
    maNCC int primary key auto_increment,
    tenNCC varchar(255),
    diachi varchar(255),
    soDienThoai varchar(20)
);

INSERT INTO VatTu (tenVT) VALUES 
('Xi măng'), 
('Gạch'), 
('Sắt'), 
('Gỗ'), 
('Cát'), 
('Sơn'), 
('Ống nước'), 
('Gạch men'), 
('Vôi'), 
('Thép');

INSERT INTO NhaCungCap (maNCC, tenNCC, diaChi, soDienThoai) VALUES 
(1, 'Công ty A', 'Hà Nội', '0123456789'),
(2, 'Công ty B', 'Hồ Chí Minh', '0987654321'),
(3, 'Công ty C', 'Đà Nẵng', '0909090909'),
(4, 'Công ty D', 'Hải Phòng', '0808080808'),
(5, 'Công ty E', 'Cần Thơ', '0707070707');

INSERT INTO DonDatHang (maNCC, ngayDH) VALUES 
(1, '2024-02-10 09:00:00'),
(2, '2024-02-15 10:00:00'),
(3, '2024-02-18 11:00:00'),
(4, '2024-02-22 12:00:00'),
(5, '2024-01-30 13:00:00');

INSERT INTO ChiTietDonDatHang (maVt, soHD) VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

INSERT INTO PhieuXuat (ngayXuat) VALUES 
('2024-02-01 14:00:00'),
('2024-02-05 15:00:00'),
('2024-02-08 16:00:00'),
('2024-02-11 17:00:00'),
('2024-02-14 18:00:00');

INSERT INTO PhieuXuatChiTiet (soPx, maVT, donGiaXuat, soLuongXuat) VALUES 
(1, 1, 50000, 10),
(1, 2, 30000, 15),
(2, 3, 40000, 20),
(2, 4, 20000, 25),
(3, 5, 35000, 30),
(3, 6, 25000, 35),
(4, 7, 45000, 40),
(4, 8, 15000, 45),
(5, 9, 10000, 50),
(5, 10, 12000, 55);

INSERT INTO PhieuNhap (ngayNhap) VALUES 
('2024-02-01 14:00:00'),
('2024-02-05 15:00:00'),
('2024-02-08 16:00:00'),
('2024-02-11 17:00:00'),
('2024-02-14 18:00:00');

INSERT INTO PhieuNhapChiTiet (soPn, maVT, donGiaNhap, soLuongNhap) VALUES 
(1, 1, 40000, 60),
(1, 2, 35000, 70),
(2, 3, 50000, 80),
(2, 4, 45000, 90),
(3, 5, 55000, 100),
(3, 6, 30000, 110),
(4, 7, 60000, 120),
(4, 8, 50000, 130),
(5, 9, 45000, 140),
(5, 10, 40000, 150);

-- Hiển thị tất cả vật tự dựa vào phiếu xuất có số lượng lớn hơn 10
SELECT DISTINCT v.maVT, v.tenVT
FROM VatTu v
JOIN PhieuXuatChiTiet pxct ON v.maVT = pxct.maVT
WHERE pxct.soLuongXuat > 10;

-- Hiển thị tất cả vật tư mua vào ngày 12/2/2023
SELECT DISTINCT v.maVT, v.tenVT
FROM VatTu v
JOIN ChiTietDonDatHang ctdh ON v.maVT = ctdh.maVt
JOIN DonDatHang ddh ON ctdh.soHD = ddh.soHD
WHERE DATE(ddh.ngayDH) = '2024-02-15';

-- Hiển thị tất cả vật tư được nhập vào với đơn giá lớn hơn 1.200.000
SELECT DISTINCT v.maVT, v.tenVT
FROM VatTu v
JOIN PhieuNhapChiTiet pnc ON v.maVT = pnc.maVT
WHERE pnc.donGiaNhap > 50000;

-- Hiển thị tất cả vật tư được dựa vào phiếu xuất có số lượng lớn hơn 5
SELECT DISTINCT v.maVT, v.tenVT
FROM VatTu v
JOIN PhieuXuatChiTiet pxct ON v.maVT = pxct.maVT
WHERE pxct.soLuongXuat > 5;

-- Hiển thị tất cả nhà cung cấp ở long biên có SoDienThoai bắt đầu với 09
SELECT maNCC, tenNCC, diachi, soDienThoai
FROM NhaCungCap
WHERE soDienThoai LIKE '09%';

