import pyodbc
import pandas as pd
conn= pyodbc.connect(
"DRIVER={ODBC Driver 17 for SQL Server};"
"SERVER=.\\sqlexpress;"
"DATABASE=CramSchool;"
"Trusted_Connection=yes;"
)


df = pd.read_sql("""
SELECT s.class_name AS 班級, e.exam_name AS 考試, AVG(sc.score) AS 平均分
FROM scores sc
JOIN students s ON sc.student_id = s.student_id
JOIN exams e ON sc.exam_id = e.exam_id
GROUP BY s.class_name, e.exam_name
""", conn)

df.to_excel("班級平均報表.xlsx", index=False)
print("報表已輸出")