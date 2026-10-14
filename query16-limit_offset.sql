-- # ===================== LIMIT Clause ============================
/*
- LIMIT clause is used to limit the data amount returned by the SELECT statement.
- Syntax:
SELECT column1, column2, columnN
FROM <table name>
LIMIT <no of rows>;

- Syntax:
SELECT column1, column2, columnN
FROM <table name>
LIMIT <no of rows>
OFFSET <row number>;
*/

SELECT * FROM COMPANY;

SELECT EMP_ID, FIRST_NAME, DESIGNATION, STATE, MOBILE_NUMBER
FROM COMPANY
LIMIT 20;

SELECT EMP_ID, FIRST_NAME, DESIGNATION, STATE, MOBILE_NUMBER
FROM COMPANY
LIMIT 10
OFFSET 10;



