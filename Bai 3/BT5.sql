create database Baitap5;
use Baitap5;

create table account(
    id int primary key auto_increment,
    username varchar(255) not null unique,
    password varchar(255) not null,
    address varchar(255) not null,
    status bit
);

create table bill(
    id int primary key auto_increment,
    bill_type bit,
    account_id int,
    create datetime,
    auth_date datetime,
    foreign key (account_id) references account(id)
);

create table product(
    id int primary key auto_increment,
    name varchar(255) not null,
    create date,
    price decimal(10,2) not null,
    stock int not null,
    status bit
);
create table bill_details(
    id int primary key auto_increment,
    bill_id int,
    product_id int,
    quantity int not null,
    price decimal(10,2) not null,
    foreign key (bill_id) references bill(id),
    foreign key (product_id) references product(id)
);

insert into account(username, password, address, status) values
('Hùng', 123456, 'Nghệ An', true),
('Cường', 654321, 'Hà Nội', true),
('Bách', 135790, 'Đà Nẵng', true);

insert into bill(bill_type, account_id, create, auth_date) values
(0, 1, str_to_date('11/02/2022', '%d/%m/%Y'), str_to_date('12/03/2022', '%d/%m/%Y')),
(0, 1, str_to_date('05/10/2023', '%d/%m/%Y'), str_to_date('10/10/2023', '%d/%m/%Y')),
(1, 2, str_to_date('15/05/2024', '%d/%m/%Y'), str_to_date('20/05/2024', '%d/%m/%Y')),
(1, 3, str_to_date('01/02/2022', '%d/%m/%Y'), str_to_date('10/02/2022', '%d/%m/%Y'));

insert into product(name, create, price, stock, status) values
("Quần dài", str_to_date('12/03/2022', '%d/%m/%Y'), 1200, 5, true),
("Áo dài", str_to_date('15/03/2023', '%d/%m/%Y'), 1500, 8, true),
("Mũ cối", str_to_date('08/03/1999', '%d/%m/%Y'), 1600, 10, true);

insert into bill_details(bill_id, product_id, quantity, price) values
(1, 1, 3, 1200),
(1, 2, 4, 1500),
(2, 1, 1, 1200),
(3, 2, 4, 1500),
(4, 3, 7, 1600);

-- Hiển thị tất cả account và sắp xếp theo user_name theo chiều giảm dần
SELECT * FROM account
ORDER BY username DESC;

-- Hiển thị tất cả bill từ ngày 11/2/2023 đến 15/5/2023
SELECT * FROM bill
WHERE create BETWEEN str_to_date('11/02/2023', '%d/%m/%Y') AND str_to_date('15/05/2023', '%d/%m/%Y');

-- Hiển thị tất cả bill_detail theo bill_id
SELECT * FROM bill_details
ORDER BY bill_id;

-- Hiển thị tất cả product theo tên và sắp xếp theo chiều giảm dần
SELECT * FROM product
ORDER BY name DESC;

-- Hiển thị tất cả product có số lượng lớn hơn 10
SELECT * FROM product
WHERE stock > 10;

-- Hiển thị tất cả product còn hoạt động (dựa vào product_status)
SELECT * FROM product
WHERE status = true;

