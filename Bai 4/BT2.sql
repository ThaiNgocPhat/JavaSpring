create database Baitap2;
use Baitap2;

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

-- 1. Hiển thị tất cả customer có đơn hàng trên 150000
SELECT DISTINCT c.cid, c.cName, c.cAge
FROM customer c
JOIN orders o ON c.cid = o.cid
WHERE o.oTotalPrice > 150000;


-- 2. Hiển thị sản phẩm chưa được bán cho bất cứ ai
SELECT p.pid, p.pName, p.pPrice
FROM products p
LEFT JOIN orderDetail od ON p.pid = od.pid
WHERE od.pid IS NULL;

-- 3. Hiển thị tất cả đơn hàng mua trên 2 sản phẩm
SELECT o.oid, o.cid, o.oDate, o.oTotalPrice
FROM orders o
JOIN orderDetail od ON o.oid = od.oid
GROUP BY o.oid
HAVING COUNT(od.pid) > 2;


-- 4. Hiển thị đơn hàng có tổng giá tiền lớn nhất
SELECT oid, cid, oDate, oTotalPrice
FROM orders
WHERE oTotalPrice = (
    SELECT MAX(oTotalPrice)
    FROM orders
);


-- 5. Hiển thị sản phẩm có giá tiền lớn nhất
SELECT pid, pName, pPrice
FROM products
WHERE pPrice = (
    SELECT MAX(pPrice)
    FROM products
);

-- 6. Hiển thị người dùng nào mua nhiều sản phẩm “Bep Dien” nhất
SELECT c.cid, c.cName, c.cAge, SUM(od.odQuantity) AS total_quantity
FROM customer c
JOIN orders o ON c.cid = o.cid
JOIN orderDetail od ON o.oid = od.oid
JOIN products p ON od.pid = p.pid
WHERE p.pName = 'Bep dien'
GROUP BY c.cid, c.cName, c.cAge
ORDER BY total_quantity DESC
LIMIT 1;
