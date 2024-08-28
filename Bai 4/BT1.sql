CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Tạo bảng class
CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(100),
    start_date DATETIME,
    status BIT
);

-- Tạo bảng students
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(11),
    class_id INT,
    status BIT,
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

-- Tạo bảng subject
CREATE TABLE subject (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(100),
    credit INT,
    status BIT
);

-- Tạo bảng mark
CREATE TABLE mark (
    id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT,
    student_id INT,
    point DOUBLE,
    exam_time DATETIME,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Thêm dữ liệu vào bảng class
INSERT INTO class (class_name, start_date, status) VALUES 
('HN-JV231103', str_to_date('03/11/2023', '%d/%m/%Y'), true),
('HN-JV231229', str_to_date('29/12/2023', '%d/%m/%Y'), true),
('HN-JV230615', str_to_date('15/06/2023', '%d/%m/%Y'), true);

-- Thêm dữ liệu vào bảng students
INSERT INTO students (student_name, address, phone, class_id, status) VALUES 
('Hồ Gia Hùng', 'Hà Nội', '0987654321', 1, true),
('Phan Văn Giang', 'Đà Nẵng', '0967811255', 1, true),
('Dương Mỹ Huyền', 'Hà Nội', '0385546611', 2, true),
('Hoàng Minh Hiếu', 'Nghệ An', '0964425633', 2, true),
('Nguyễn Vịnh', 'Hà Nội', '0964425633', 3, true),
('Nam Cao', 'Hà Tĩnh', '0919191919', 1, true),
('Nguyễn Du', 'Nghệ An', '0353535353', 3, true);


-- Thêm dữ liệu vào bảng subject
INSERT INTO subject (subject_name, credit, status) VALUES 
('Toán', 3, true),
('Văn', 3, true),
('Anh', 2, true);

-- Thêm dữ liệu vào bảng mark
INSERT INTO mark (subject_id, student_id, point, exam_time) VALUES 
(1, 1, 7, str_to_date('12/05/2024', '%d/%m/%Y')),
(1, 1, 7, str_to_date('15/03/2024', '%d/%m/%Y')),
(2, 2, 8, str_to_date('15/05/2024', '%d/%m/%Y')),
(2, 3, 9, str_to_date('08/03/2024', '%d/%m/%Y')),
(3, 3, 10, str_to_date('11/02/2023', '%d/%m/%Y'));

-- Hiển thị tất cả lớp học được sắp xếp theo tên giảm dần
SELECT * FROM class ORDER BY class_name DESC;
-- Hiển thị tất cả học sinh có address ở “Hà Nội”
SELECT * FROM students WHERE address = 'Hà Nội';
-- Hiển thị tất cả học sinh thuộc lớp HN-JV231103
SELECT * FROM students WHERE class_id = 1;
-- Hiển thị tát cả các môn học có credit trên 2
SELECT * FROM subject WHERE credit > 2;
-- Hiển thị tất cả học sinh có phone bắt đầu bằng số 09
SELECT * FROM students WHERE phone LIKE '09%';

-- 1. Hiển thị số lượng sinh viên theo từng địa chỉ nơi ở
SELECT address, COUNT(*) AS student_count
FROM students
GROUP BY address;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất
SELECT s.subject_id, s.subject_name, MAX(m.point) AS max_point
FROM subject s
JOIN mark m ON s.subject_id = m.subject_id
GROUP BY s.subject_id, s.subject_name
HAVING MAX(m.point) = (
    SELECT MAX(point)
    FROM mark
);


-- Tính điểm trung bình các môn học của từng học sinh
SELECT st.student_id, st.student_name, AVG(m.point) AS average_point
FROM students st
JOIN mark m ON st.student_id = m.student_id
GROUP BY st.student_id, st.student_name;


-- Hiển thị những học viên có điểm trung bình các môn học nhỏ hơn hoặc bằng 70
SELECT st.student_id, st.student_name, AVG(m.point) AS average_point
FROM students st
JOIN mark m ON st.student_id = m.student_id
GROUP BY st.student_id, st.student_name
HAVING AVG(m.point) <= 7;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT st.student_id, st.student_name, AVG(m.point) AS average_point
FROM students st
JOIN mark m ON st.student_id = m.student_id
GROUP BY st.student_id, st.student_name
ORDER BY average_point DESC;
