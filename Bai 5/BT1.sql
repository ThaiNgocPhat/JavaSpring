create database Baitap1;
use Baitap1;

create table customer(
    cid int primary key auto_increment,
    cName varchar(255),
    cAge int
);

create table orders(
    oid int primary key auto_increment,
    cid int,
    oDate date,
    oTotalPrice double,
    foreign key (cid) references customer(cid)
);

create table products(
    pid int primary key auto_increment,
    pName varchar(255),
    pPrice double
);

create table orderDetail(
    oid int,
    pid int,
    odQuantity int,
    foreign key (oid) references orders(oid),
    foreign key (pid) references products(pid)
);

insert into customer(cName, cAge) values 
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 30);

insert into orders(cid, oDate, oTotalPrice) values
(1, str_to_date('21/03/2006', '%d/%m/%Y'), 150000),
(2, str_to_date('23/03/2006', '%d/%m/%Y'), 200000),
(1, str_to_date('16/03/2006', '%d/%m/%Y'), 170000);

insert into products(pName, pPrice) values
("May giat", 300),
("Tu lanh", 500),
("Dieu hoa", 700),
("Quat", 100),
("Bep dien", 200),
("May hut bui", 500);

insert into orderDetail(oid, pid, odQuantity) values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 8),
(2, 3, 3);

-- Tạo view hiển thị tất cả customer
CREATE VIEW view_all_customers AS
SELECT * FROM customer;


-- Tạo view hiển thị tất cả order có oTotalPrice trên 150000
CREATE VIEW view_orders_above_150000 AS
SELECT * FROM orders
WHERE oTotalPrice > 150000;


-- Đánh index cho bảng customer ở cột cName
CREATE INDEX idx_customer_name ON customer(cName);


-- Đánh index cho bảng product ở cột pName
CREATE INDEX idx_product_name ON products(pName);


-- Tạo store procedure hiển thị ra đơn hàng có tổng tiền bé nhất
DELIMITER //

CREATE PROCEDURE get_min_total_order()
BEGIN
    SELECT * FROM orders
    ORDER BY oTotalPrice ASC
    LIMIT 1;
END //

DELIMITER ;


-- Tạo store procedure hiển thị người dùng nào mua sản phẩm “May Giat” ít nhất

