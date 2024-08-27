SELECT studentId,studentName,address
FROM Student;

SELECT *
FROM Student
WHERE status = true;

SELECT *
FROM Subject
WHERE credit < 10;

SELECT Student.studentId, Student.studentName, Class.className
FROM Student join Class  on Student.classId = Class.classID;

SELECT Student.studentId, Student.studentName, Class.className
FROM Student join Class  on Student.classId = Class.classID;
WHERE C.ClassName = 'A1';

SELECT s.StudentId, s.StudentName, sub.SubName, m.Mark
FROM Student s 
join Mark m on s.studentId = m.studentId 
join Subject sub on m.subjectId = sub.subId
WHERE sub.subName = 'CF';