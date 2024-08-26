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
    odQuantity,
    foreign key (oid) references orders(oid),
    foreign key (pid) references products(pid)
);