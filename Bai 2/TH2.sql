CREATE TABLE Class (
    classId INT PRIMARY KEY AUTO_INCREMENT,
    className VARCHAR(255) NOT NULL,
    startDate DATE NOT NULL,
    status BIT
);

CREATE TABLE Student (
    studentId INT PRIMARY KEY AUTO_INCREMENT,
    studentName VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(255),
    status BIT,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Class(classId)
);

CREATE TABLE Subject (
    subId INT PRIMARY KEY AUTO_INCREMENT,
    subName VARCHAR(255) NOT NULL,
    credit INT DEFAULT 1 CHECK (credit >= 1),
    status BIT DEFAULT 1
);

CREATE TABLE Mark (
    markId INT PRIMARY KEY AUTO_INCREMENT,
    subjectId INT,
    studentId INT,
    mark DOUBLE DEFAULT 0 CHECK (mark >= 0 AND mark <= 100),
    examtime INT DEFAULT 1,
    FOREIGN KEY (subjectId) REFERENCES Subject(subId),
    FOREIGN KEY (studentId) REFERENCES Student(studentId)
);
