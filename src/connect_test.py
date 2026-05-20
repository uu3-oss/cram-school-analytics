import pyodbc
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=.\sqlexpress;"
    "DATABASE=CramSchool;"
    "Trusted_Connection=yes;"
)
conn=pyodbc.connect(conn_str)
cursor=conn.cursor()
cursor.execute("""
SELECT s.name, e.exam_name, sc.subject, sc.score 
FROM scores sc 
JOIN students s ON sc.student_id = s.student_id 
JOIN exams e ON sc.exam_id = e.exam_id 
""")

for row in cursor.fetchall():
    print(f"{row.name}-{row.exam_name}-{row.subject}-{row.score}")


conn.close()
print("連線成功")

