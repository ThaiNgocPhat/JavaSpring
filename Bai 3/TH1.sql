create database ThucHanh1;
use ThucHanh1;

create table Class(
    classId int primary key auto_increment,
    className varchar(255) not null,
    startDate date not null,
    status bit
);

create table Student(
    studentId int primary key auto_increment,
    studentName varchar(255) not null,
    address varchar(255),
    phone varchar(255),
    status bit,
    classId int,
    foreign key (classId) references Class(classId)
);

create table Subject(
    subId int primary key auto_increment,
    subName varchar(255) not null,
    credit int default 1 check (credit >= 1),
    status bit default 1
);

create table Mark(
    markId int primary key auto_increment,
    mark double default 0 check (mark >= 0 and mark <= 100),
    examtime int default 1,
    studentId int,
    subId int,
    foreign key (studentId) references Student(studentId),
    foreign key (subId) references Subject(subId)
);

insert into Class (className, startDate, status) values 
('A1', '2008-12-20', 1),
('A2', '2008-12-22', 1),
('B3', current_date, 0);

 insert into Student (studentName, address, phone, status, classId) values
('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong', 1, 1),
('Manh', 'HCM', '0123123123', 1, 2),
('Lan', 'HCM', '0912345678', 0, 2);

 insert into Subject (subName, credit, status) values
('CF', 5, 1),
('C', 6, 1),
('HDJ', 5, 1),
'RDBMS', 10, 1);

insert into Mark (StudentId, Mark, ExamTimes)values 
(1, 60, 1),
(2, 40, 2),
(1, 70, 1),
(3, 80, 1),
(3, 90, 1);