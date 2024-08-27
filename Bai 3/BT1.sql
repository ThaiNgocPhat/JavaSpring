create database Baitai1;
use Baitai1;

create table color(
    id int primary key auto_increment,
    name varchar(100) not null,
    status bit
);

create table product(
    id int primary key auto_increment,
    name varchar(100) not null,
    create date not null
);

create table size(
    id int primary key auto_increment,
    name varchar(100) not null,
    status bit
);

create table product_details(
    id int primary key auto_increment,
    product_id int,
    color_id int,
    size_id int,
    price double,
    stock int,
    status bit,
    foreign key (product_id) references product(id),
    foreign key (color_id) references color(id),
    foreign key (size_id) references size(id)
);


insert into color(name, status) values
('Red', true),
('Blue', true),
('Green', true);

insert into size(name, status) values
('X', true),
('M', true),
('L', true),
('XL', true),
('XXL', true);

insert into product(name, create_date) values
('quần dài', str_to_date('12/5/1990', '%d/%m/%Y')),
('áo dài', str_to_date('05/10/2005', '%d/%m/%Y')),
('mũ phớt', str_to_date('07/07/1995', '%d/%m/%Y'));

insert into product_details(product_id, color_id, size_id, price, stock, status) values
(1, 1, 1, 1200, 5, true),
(2, 1, 1, 1500, 2, true),
(1, 2, 3, 500, 3, true),
(1, 2, 3, 1600, 3, false),
(3, 1, 4, 1200, 5, true),
(3, 3, 5, 1200, 6, true),
(2, 3, 5, 2000, 10, false);


--hiển thị thông sản phẩm có giá hơn 1200
select * from product_details
where price > 1200;

-- chọn bảng màu
select * from color;

--chọn bảng size
select * from size;

--hiển thị toàn bộ thông sản phẩm có id là 1
select * from product_details
where product_id = 1;