-- # ===================== WHERE ============================
/*
- The PostgreSQL WHERE clause is used to specify a condition while fetching the data from single table or joining with multiple tables.

- If the given condition is satisfied, only then it returns specific value from the table. You can filter out rows that you do not want
include in the result-set by using the WHERE clause.

- The WHERE clause not only is used in SELECT statement, but it is also used in UPDATE, DELETE statement, etc.

- # Syntax:
SELECT column1, column2, columnN
FROM table_name
WHERE [search_condition];

- You can specify a search_condition using comparison or logical operators. Like >, < =, LIKE, NOT, IN, BETWEEN, EXISTS etc.
*/


SELECT * FROM COMPANY;

SELECT * FROM COMPANY
WHERE "salary" < 70000 AND "salary" > 60000;

SELECT * FROM COMPANY 
WHERE "age" = '28';

SELECT * FROM COMPANY
WHERE NAME LIKE 'A%';

SELECT * FROM COMPANY
WHERE AGE IN (25, 27);

SELECT * FROM COMPANY
WHERE AGE NOT IN (24, 25, 26, 27);

SELECT * FROM COMPANY
WHERE AGE IN (24, 25, 26, 27) AND (SALARY >= 60000 AND SALARY <= 70000) AND GENDER='M';

SELECT * FROM COMPANY
WHERE AGE BETWEEN 24 AND 27 AND GENDER='M';

SELECT NAME, AGE FROM COMPANY
WHERE EXISTS (SELECT * FROM COMPANY WHERE SALARY >= 65000);

SELECT NAME, AGE FROM COMPANY
WHERE AGE % 2 = 0;

SELECT NAME, AGE FROM COMPANY
WHERE AGE % 5 = 0

