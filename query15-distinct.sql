
-- # ===================== DISTINCT Keyword ============================
/*
- The PostgreSQL DISTINCT keyword is used in conjunction with SELECT statement to eliminate all the duplicate records and fetching only unique records.
# Syntax:
SELECT DISTINCT column1, column2, ...., columnN
FROM table_name
WHERE <condition>;
*/

-- QUERY TYPE 1
SELECT * FROM COMPANY;


-- QUERY TYPE 2
SELECT DISTINCT COUNTRY, STATE FROM COMPANY;

SELECT DISTINCT DESIGNATION FROM COMPANY;

SELECT DISTINCT LAST_NAME FROM COMPANY;

-- QUERY TYPE 3
SELECT DISTINCT LAST_NAME, COUNT(EMP_ID) 
FROM COMPANY
GROUP BY LAST_NAME;

SELECT DISTINCT DESIGNATION, COUNT(*) 
FROM COMPANY
GROUP BY DESIGNATION
ORDER BY COUNT(*);

SELECT DISTINCT LAST_NAME, COUNT(EMP_ID) 
FROM COMPANY
GROUP BY LAST_NAME
HAVING COUNT(EMP_ID) < 5
ORDER BY COUNT(EMP_ID);

