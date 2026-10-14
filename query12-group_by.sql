-- # ===================== GROUP BY ============================
/*
- The PostgreSQL GROUP BY clause is used in collaboration with the SELECT statement to group
together those rows in a table that have identical data. This is done to eliminate redundancy
in the output and/or compute aggregate taht apply to these gourps.
- The GROUP BY clause follows the WHERE clause in a SELECT statement and precedes the ORDER BY clause.
- GROUP BY is used when you want to combine rows into groups based on one or more columns and then perform an operation on each group, 
usually using aggregate functions such as COUNT(), SUM(), AVG(), MIN(), and MAX().

- # Syntax:
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
WHERE condition
GROUP BY column_name
ORDER BY column_name;

- You can use more than one column in the GROUP BY clause. Make sure whatever column you are using to
group, that column should be available in column-list.
*/
SELECT * FROM COMPANY;

SELECT ADDRESS, COUNT(*) FROM COMPANY 
GROUP BY ADDRESS
ORDER BY ADDRESS;

SELECT AGE, COUNT(*) FROM COMPANY
WHERE AGE % 2 = 0
GROUP BY AGE
ORDER BY AGE;

SELECT AGE, SUM(SALARY) FROM COMPANY
WHERE AGE % 2 = 0 AND AGE > 18
GROUP BY AGE
ORDER BY AGE;

SELECT ADDRESS, SUM(SALARY) as "Place Income" FROM COMPANY
GROUP BY ADDRESS
ORDER BY ADDRESS;

SELECT AGE, ADDRESS, COUNT(*) AS Total_Count FROM COMPANY
GROUP BY AGE, ADDRESS
ORDER BY AGE, ADDRESS;

SELECT AGE, ADDRESS, COUNT(*) AS Total_Count FROM COMPANY
WHERE AGE % 2 = 0
GROUP BY AGE, ADDRESS
ORDER BY AGE, ADDRESS;

-- # Note: You will only select those columns on which you want to apply the GROUP BY. Rest of the other columns will be use with Aggregate function.
-- 	If you have selected the different columns and did no use that into GROUP BY then that will throw error. 
