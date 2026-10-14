-- # ===================== ORDER BY ============================
/*
- The PostgreSQL ORDER BY clause is used to sort the data in ascending or descending order, 
based on one or more columns.

- # Syntax:
SELECT colum_list FROM table_name
WHERE [condition]
ORDER BY column1 column2, ... columnN [ASC | DESC];

- You can use more than one column in the ORDER BY clause. Make sure whatever column you are
using to sort, that column should be available in column-list.
*/

SELECT * FROM COMPANY WHERE GENDER='M' ORDER BY AGE, ADDRESS ASC;

SELECT * FROM COMPANY ORDER BY NAME, ADDRESS, SALARY ASC;

SELECT * FROM COMPANY ORDER BY NAME DESC;
