-- 01_create_tables.sql
IF DB_ID('CramSchool') IS NULL CREATE DATABASE CramSchool;
GO
USE CramSchool;
GO

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name NVARCHAR(50),
    class_name NVARCHAR(20),
    enroll_date DATE
);

CREATE TABLE exams (
    exam_id INT PRIMARY KEY,
    exam_name NVARCHAR(50),
    exam_date DATE
);

CREATE TABLE scores (
    score_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT FOREIGN KEY REFERENCES students(student_id),
    exam_id INT FOREIGN KEY REFERENCES exams(exam_id),
    subject NVARCHAR(20),
    score INT CHECK (score BETWEEN 0 AND 100)
);
