USE CramSchool;

-- 學生
INSERT INTO students (student_id, name, class_name, enroll_date) VALUES
(1, N'王小明', N'國三A班', '2024-09-01'),
(2, N'陳小美', N'國三A班', '2024-09-01'),
(3, N'林大同', N'高一B班', '2025-02-15');

-- 考試
INSERT INTO exams (exam_id, exam_name, exam_date) VALUES
(1, N'第一次段考', '2025-03-20'),
(2, N'第二次段考', '2025-05-15');

-- 成績
INSERT INTO scores (student_id, exam_id, subject, score) VALUES
(1, 1, N'數學', 85),
(1, 1, N'英文', 78),
(2, 1, N'數學', 92),
(2, 1, N'英文', 88),
(3, 2, N'數學', 70),
(3, 2, N'英文', 65);