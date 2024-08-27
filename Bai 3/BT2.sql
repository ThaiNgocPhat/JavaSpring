create database Baitai2;
use Baitai2;

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
    odQuantity,
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

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oid, oDate, oTotalPrice 
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách hàng đó.
select customer.cName, products.pName
from customer
join orders on customer.cid = orders.cid
join orderDetail on orders.oid = orderDetail.oid
join products on orderDetail.pid = products.pid;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName 
from customer 
where cid not in (
    select cid 
    from orders
);


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY * pPrice)

select orders.oid, orders.oDate, 
       SUM(orderDetail.odQuantity * products.pPrice) as oTotalPrice
from orders
join orderDetail on orders.oid = orderDetail.oid
join products on orderDetail.pid = products.pid
group by orders.oid, orders.oDate;
