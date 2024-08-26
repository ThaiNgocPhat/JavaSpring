create database Baitap1;
use Baitap1;

create table color(
	id int primary key auto_increment,
    name varchar(100),
    status bit
);

create table product(
	id int primary key auto_increment,
    name varchar(100),
    created date
);

create table size(
	id int primary key auto_increment,
    name varchar(100),
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