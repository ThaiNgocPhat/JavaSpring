create database Baitap6;
use Baitap6;

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
    productId int,
    quantity int,
    unit_price double,
    foreign key (orderId) references order(id),
    foreign key (productId) references products(id)
);

create table wishlist(
    userId int,
    productId int,
    foreign key (userId) references users(id),
    foreign key (productId) references products(id)
);

create table shopping_cart(
    id int  primary key auto_increment,
    userId int,
    productId int,
    quantity int,
    foreign key (userId) references users(id),
    foreign key (productId) references products(id)
);

create table products(
    id int primary key auto_increment,
    catalogId int,
    name varchar(255),
    price double,
    stock int,
    status bit,
    foreign key (catalogId) references catalog(id)

create table catalog(
    id int primary key auto_increment,
    name varchar(255),
    status bit
);