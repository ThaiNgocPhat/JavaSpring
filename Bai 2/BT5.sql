create database Baitap5;
use Baitap5;

create table users(
    id int primary key auto_increment,
    fullName varchar(100)
    email varchar(255) unique not null,
    password varchar(255) not null,
    phone varchar(11) not null,
    permission bit,
    status bit
);

create table address(
    id int primary key auto_increment,
    userId int,
    receiveAddress varchar(100),
    receiveName varchar(100),
    receivePhone varchar(11),
    isDefault bit,
    foreign key (userId) references users(id)
);

create table order(
    id int primary key auto_increment,
    userId int,
    orderAt datetime,
    totals double,
    status bit,
    foreign key (userId) references users(id)
);

create table orderDetail(
    id int primary key auto_increment,
    orderId int,
    bookId int,
    quantity int,
    unit_price double,
    foreign key (orderId) references order(id),
    foreign key (bookId) references books(id)
);

create table books(
    id int primary key auto_increment,
    name varchar(255),
    price double,
    stock int,
    status bit,
);

create table catalog(
    id int primary key auto_increment,
    name varchar(255),
    status bit
);

create table book_catalog(
    catalogId int,
    bookId int,
    foreign key  (catalogId) references catalog(id),
    foreign key (bookId) references books(id)
);