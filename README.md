# 補習班成績分析系統 Cram School Analytics

同學們好，我是原本在補習班教數理的老師。教了十年，我發現每次段考後整理成績最花時間：要算平均、排名、標準差，還要找出退步的學生。

這個小專案，就是把我平常手動做的事，變成 Python + MSSQL 自動化。目標不是做一個大平台，而是示範「如何用資料庫思維解決教學現場問題」。

## 一、我們要解決什麼問題
1. 匯入學生的各科成績 CSV
2. 自動計算班級平均、分數分布、個人進步幅度
3. 產出老師可以直接拿去家長會用的報表

## 二、資料表設計（關聯式思考）
我們用三張表，避免資料重複：

**students 學生基本檔**
- student_id (PK), name, class_name, enroll_date

**exams 考試檔**
- exam_id (PK), exam_name, exam_date

**scores 成績檔**
- score_id (PK), student_id (FK), exam_id (FK), subject, score

這樣設計，未來要加新科目或新考試，不用改結構，只要加資料。

## 三、怎麼跑（第一次操作請照順序）
環境：Windows 10/11，Python 3.10+，MSSQL (本機或 Azure)

1. 建立資料庫
   - 開啟 SSMS，執行 `sql/01_create_tables.sql`
2. 安裝套件
   ```bash
   pip install pyodbc pandas
   ```
3. 設定連線
   - 打開 `src/db_connect.py`，修改 SERVER, DATABASE, USERNAME, PASSWORD
4. 匯入範例成績
   ```bash
   python src/import_scores.py
   ```
5. 查詢報表
   ```bash
   python src/query_report.py
   ```
   會印出班級平均與前五名

## 四、學習重點
- JOIN：把 students 和 scores 連起來查姓名
- Subquery：找出每科最高分
- UNION：合併不同考試的結果
- Python 參數化查詢：避免 SQL injection

有問題歡迎開 Issue，我會用老師改考卷的方式回覆。

---
版本：v0.1 基礎骨架
