-- # ===================== HAVING Clause ============================
/*
The HAVING clause allows us to pick out particular rows where the function's result meets some condition.
The WHERE clause places conditions on the selected columns, where as the HAVING clause places conditions on groups created by the GROUP BY clause.

- # Position of HAVING 
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

- The HAVING clause must follow the GROUP BY clause in a query and must also precede the ORDER BY clause if used.
- # Syntax
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
ORDER BY column_name;
*/

SELECT * FROM COMPANY;

SELECT AGE, ADDRESS, COUNT(*) FROM COMPANY
WHERE AGE % 2 = 0
GROUP BY AGE, ADDRESS
HAVING COUNT(*) >= 2
ORDER BY AGE, ADDRESS;



