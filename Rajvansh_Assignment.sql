-- TASK 1
-- CREATING DATABASE 
create database SISDB
USE SISDB 

-- TABLE CREATION 
-- STUDENTS TABLE
CREATE TABLE Students(
    student_id INT NOT NULL PRIMARY KEY,               
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) ,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE
)
--TEACHER TABLE
CREATE TABLE Teacher(
    teacher_id INT NOT NULL PRIMARY KEY,                
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) ,
    email VARCHAR(100) NOT NULL UNIQUE
)
--PAYMENTS TABLE
CREATE TABLE Payments(
    payment_id INT PRIMARY KEY,                
    student_id INT NOT NULL,                            
    amount INT NOT NULL,
    payment_date DATE NOT NULL,
    CONSTRAINT FK_Student_Payments FOREIGN KEY (student_id) 
    REFERENCES Students(student_id)
    ON DELETE CASCADE ON UPDATE CASCADE    
)
-- COURSES TABLE
CREATE TABLE Courses(
    course_id INT PRIMARY KEY,                 
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT ,                            
    CONSTRAINT FK_Teacher_Courses FOREIGN KEY (teacher_id) 
    REFERENCES Teacher(teacher_id)
    ON DELETE SET NULL ON UPDATE CASCADE  
)
--ENROLLMENTS TABLE
CREATE TABLE Enrollments(
    enrollment_id INT PRIMARY KEY,             
    student_id INT,                            
    course_id INT,                             
    enrollment_date DATE NOT NULL,
    CONSTRAINT FK_Student_Enrollments FOREIGN KEY (student_id) 
    REFERENCES Students(student_id)
    ON DELETE CASCADE ON UPDATE CASCADE,   
    CONSTRAINT FK_Course_Enrollments FOREIGN KEY (course_id) 
    REFERENCES Courses(course_id)
    ON DELETE CASCADE ON UPDATE CASCADE    
)

--INSERTING 10 SAMPLE VALUES 

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Joe', 'Don', '2000-01-15', 'joe.don@email.com', '1234567891'),
(2, 'Jane', 'Smith', '1999-03-22', 'jane.smith@email.com', '2345678901'),
(3, 'Alice', 'Johnson', '1998-07-10', 'alice.johnson@email.com', '3456789012'),
(4, 'Bob', 'Brown', '1997-11-05', 'bob.brown@email.com', '4567890123'),
(5, 'Charlie', 'Davis', '2001-02-20', 'charlie.davis@email.com', '5678901234'),
(6, 'David', 'Wilson', '1998-08-18', 'david.wilson@email.com', '6789012345'),
(7, 'Eva', 'Martinez', '1999-12-30', 'eva.martinez@email.com', '7890123456'),
(8, 'Frank', 'Garcia', '2000-06-11', 'frank.garcia@email.com', '8901234567'),
(9, 'Grace', 'Clark', '1997-09-25', 'grace.clark@email.com', '9012345678'),
(10, 'Henry', 'Miller', '1999-10-19', 'henry.miller@email.com', '0123456789')


INSERT INTO Teacher (teacher_id, first_name, last_name, email) VALUES
(1, 'Laura', 'Adams', 'laura.adams@email.com'),
(2, 'Michael', 'Brown', 'michael.brown@email.com'),
(3, 'Jessica', 'Taylor', 'jessica.taylor@email.com'),
(4, 'James', 'Anderson', 'james.anderson@email.com'),
(5, 'Sarah', 'Thomas', 'sarah.thomas@email.com')

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 500, '2024-09-10'),
(2, 2, 600, '2024-09-12'),
(3, 3, 700, '2024-09-11'),
(4, 4, 800, '2024-09-13'),
(5, 5, 900, '2024-09-18'),
(6, 6, 1000, '2024-09-15'),
(7, 7, 1100, '2024-09-19'),
(8, 8, 1200, '2024-09-17'),
(9, 9, 1300, '2024-09-14'),
(10, 10, 1400, '2024-09-16')

INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Math 101', 4, 1),
(2, 'Physics 101', 3, 2),
(3, 'Computer Science 101', 4, 3),
(4, 'Chemistry 101', 3, 4),
(5, 'Biology 101', 4, 5),
(6, 'Math 201', 4, 1),
(7, 'Physics 201', 3, 2),
(8, 'Computer Science 201', 4, 3),
(9, 'Chemistry 201', 3, 4),
(10, 'Biology 201', 4, 5)

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 1, '2024-09-01'),
(2, 2, 1, '2024-09-01'),
(3, 3, 2, '2024-09-02'),
(4, 4, 3, '2024-09-03'),
(5, 5, 4, '2024-09-04'),
(6, 6, 5, '2024-09-05'),
(7, 7, 6, '2024-09-06'),
(8, 8, 7, '2024-09-07'),
(9, 9, 8, '2024-09-08'),
(10, 10, 9, '2024-09-09')


--------------------------------------------------------------
-- TASK 2: Select, Where, Between, AND, LIKE:  


--1. Write an SQL query to insert a new student into the "Students" table with the following details: 
INSERT INTO Students VALUES(11,'John','Doe','1995-08-15','john.doe@example.com','1234567890')

select * from Students

--2. Write an SQL query to enroll a student in a course.Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date. 
INSERT INTO Enrollments VALUES(11, 3, 5, '2024-09-19')

select * from Enrollments

--3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address. 
UPDATE Teacher
SET email = 'sidak@stpsexample.com'
WHERE teacher_id = 5

select * from Teacher

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course. 
DELETE FROM Enrollments
WHERE student_id = 4 AND course_id = 3

select * from Enrollments

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables. 
UPDATE Courses
SET teacher_id=5
WHERE course_id=8

--6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity. 
DELETE FROM Students
WHERE student_id=4

select * from Students

--7. Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount. 
UPDATE Payments
SET amount=2200
WHERE payment_id=5

select * from Payments


--------------------------------------------------------------
-- Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:  


--1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID. 
SELECT S.student_id, S.first_name, S.last_name, SUM(P.amount) AS total_payments
FROM Students S
INNER JOIN Payments P ON S.student_id = P.student_id
WHERE S.student_id = 7 
GROUP BY S.student_id, S.first_name, S.last_name

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
SELECT C.course_id, C.course_name,COUNT(E.student_id) AS enrolled_students_count
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.course_id IS NULL

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
SELECT S.first_name, S.last_name, C.course_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
SELECT T.first_name, T.last_name, C.course_name
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
SELECT S.first_name, S.last_name, E.enrollment_date
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
WHERE C.course_id = 9

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records. 
SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
SELECT C.course_name
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL

--9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
SELECT S.first_name, S.last_name, COUNT(E.course_id) AS courses_enrolled
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.first_name, S.last_name
HAVING COUNT(E.course_id) > 1

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.
SELECT T.first_name, T.last_name
FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
WHERE C.course_id IS NULL


--------------------------------------------------------------
-- Task 4. Subquery and its type: 


--1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this. 
select avg(student_count) as avg_students_per_course
from (select course_id, count(student_id) as student_count from Enrollments
group by course_id) as course_counts

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount. 
SELECT student_id, amount 
FROM Payments
WHERE amount = (SELECT MAX(amount) FROM Payments)

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count. 
select c.course_id, c.course_name, enrollment_count
from Courses c
join (select course_id, count(*) as enrollment_count from Enrollments 
group by course_id) as e on c.course_id = e.course_id
where e.enrollment_count = (select max(enrollment_count)
from (select course_id, count(*) as enrollment_count from Enrollments group by course_id) as max_enrollments)

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses. 
select t.teacher_id, t.first_name, t.last_name, coalesce(to_p, 0) as to_p
from Teacher t
left join (select c.teacher_id, sum(p.amount) as to_p from Courses c
join Enrollments e on c.course_id = e.course_id
join Payments p on e.student_id = p.student_id
group by c.teacher_id) as course_payments on t.teacher_id = course_payments.teacher_id

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.
SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(course_id) FROM Courses)

--6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments. 
SELECT first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (SELECT teacher_id FROM Courses)

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth. 
SELECT AVG(age) AS avg_age
FROM ( SELECT FLOOR(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS age FROM Students) AS Agecal

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollmentrecords. 
SELECT course_id, course_name 
FROM Courses 
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments)

--9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments. 
SELECT S.student_id, S.first_name, S.last_name, C.course_name, 
(SELECT SUM(P.amount) 
FROM Payments P 
INNER JOIN Enrollments E2 ON P.student_id = E2.student_id 
WHERE E2.course_id = C.course_id AND E2.student_id = S.student_id) AS total_payments
FROM Students S
INNER JOIN Enrollments E ON S.student_id = E.student_id
INNER JOIN Courses C ON E.course_id = C.course_id
ORDER BY S.student_id, C.course_name

--10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one. 
SELECT S.student_id, S.first_name, S.last_name
FROM Students S
WHERE (SELECT COUNT(*) FROM Payments P WHERE P.student_id = S.student_id) > 1

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student. 
SELECT S.student_id, S.first_name, S.last_name, 
(SELECT SUM(P.amount) FROM Payments P WHERE P.student_id = S.student_id) AS to_p
FROM Students S

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments. 
SELECT course_name, 
(SELECT COUNT(student_id) 
FROM Enrollments E
WHERE E.course_id = C.course_id) AS st_count
FROM Courses C

--13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT S.student_id, S.first_name, S.last_name, AVG(P.amount) AS avg_pay
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name

-- or if Without join 
SELECT student_id, (SELECT AVG(amount) FROM Payments P
WHERE P.student_id = S.student_id) AS avg_payment
FROM Students S
--------------------------------------------------------------