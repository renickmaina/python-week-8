CREATE DATABASE student_db;
USE student_db;

-- Students table
CREATE TABLE students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  date_of_birth DATE
);

-- Courses table
CREATE TABLE courses (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  course_name VARCHAR(100) NOT NULL,
  course_code VARCHAR(10) NOT NULL UNIQUE
);

-- Enrollments table (many-to-many)
CREATE TABLE enrollments (
  enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT NOT NULL,
  course_id INT NOT NULL,
  enrollment_date DATE NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
  UNIQUE(student_id, course_id) -- A student can’t enroll in the same course twice
);

INSERT INTO students (name, email, date_of_birth) VALUES
('Alice Johnson', 'alice@student.com', '2000-04-12'),
('Bob Smith', 'bob@student.com', '1999-11-23'),
('Charlie Brown', 'charlie@student.com', '2001-02-05');

INSERT INTO courses (course_name, course_code) VALUES
('Database Systems', 'DB101'),
('Web Development', 'WD201'),
('Data Structures', 'DS301');

INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-01-15'),
(1, 2, '2025-01-16'),
(2, 1, '2025-01-17'),
(3, 3, '2025-01-18');

-- Example Queries (optional for demo)
-- 1. Show all students with their enrolled courses
SELECT s.name, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 2. Show all courses with the number of students enrolled
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;
