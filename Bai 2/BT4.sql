create database Baitap4;
use Baitap4;

create table users(
    id int primary key auto_increment,
    fullName varchar(100)
    email varchar(255) unique not null,
    password varchar(255) not null,
    phone varchar(11) not null,
    permission bit,
    status bit
);

create table history(
    id int primary key auto_increment,
    userId int,
    point int,
    examDate datetime not null,
    foreign key (userId) references users(id)
);

create table history_detail(
    id int primary key auto_increment,
    historyId int,
    questionId int,
    result bit,
    foreign key (historyId) references history(id),
    foreign key (questionId) references questions(id)
);

create table answer(
    id int primary key auto_increment,
    content varchar(255) not null,
    questionId int not null,
    answerTrue bit not null,
    foreign key (questionId) references questions(id)
);

create table questions(
    id int primary key auto_increment,
    content varchar(255) not null,
    exam_id int,
    status bit,
    foreign key (exam_id) references exams(id)
);

create table exams(
    id int primary key auto_increment,
    name varchar(255) not null,
    duration int,
    status bit
);