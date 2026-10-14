-- # ===================== WITH Clause ============================
/*
-  WITH query provides a way to write auxilary statements for use in a larger query. 
- It helps in breaking down complicated and large queries into simpler forms, which are easily readable. These statements often referred 
to as Common Table Expressions or CTEs, can be thought of as defining temporary tables that exist just for one query.
- The WITH query being CTE query, is particularly useful when subquery is executed multiple times.
- It computes the aggregation once and allows us to reference it by its name (may be multiple times) in the queries.
- The WITH clause must be defined before it is used in the query.
- CTE: Common Table Expressions
- Syntax:
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
*/

SELECT * FROM COMPANY;

-- Query Type 1
WITH SALARY_CTE AS (
	SELECT * FROM COMPANY
	WHERE SALARY >= 100000
)
SELECT * FROM SALARY_CTE
WHERE LAST_NAME LIKE '%a' AND GENDER = 'Male';

-- Query Type 2
DROP TABLE IF EXISTS ORGANIZATION;

CREATE TABLE IF NOT EXISTS ORGANIZATION(
	EMP_ID 	INT PRIMARY KEY 		NOT NULL,
	NAME 	TEXT					NOT NULL,
	AGE 	INT						NOT NULL,
	ADDRESS	CHAR(100)				NOT NULL,
	SALARY 	REAL					NOT NULL
);

WITH CLONE_CTE AS (
	SELECT EMP_ID, FIRST_NAME, AGE, ADDRESS, SALARY
	FROM COMPANY
	WHERE SALARY <= 50000
)
INSERT INTO ORGANIZATION (EMP_ID, NAME, AGE, ADDRESS, SALARY)
SELECT * FROM CLONE_CTE;

SELECT * FROM ORGANIZATION;

-- ================================================================================

-- # ===== RETURNING =====
/*
RETURNING is not required for a SELECT query because SELECT already returns the data you request.

1. SELECT — Fetch existing data
```sql
SELECT *
FROM COMPANY
WHERE SALARY <= 50000;
Retrieves existing rows from COMPANY.
```
- Does not insert, update, or delete rows.
- Returns the selected data automatically.
- You don't need RETURNING here.

2. INSERT — Insert data and return it
```sql
INSERT INTO ORGANIZATION
    (EMP_ID, NAME, AGE, ADDRESS, SALARY)
VALUES
    (101, 'Rahul', 25, 'Delhi', 40000)
RETURNING *;
```
- Inserts a new row into ORGANIZATION.
- RETURNING * displays the inserted row.
- Without RETURNING, the row is still inserted, but the inserted row's values are not returned as a query result.

3. UPDATE — Update data and return it
```sql
UPDATE ORGANIZATION
SET SALARY = 45000
WHERE EMP_ID = 101
RETURNING *;
Updates the employee's salary.
```
- RETURNING * displays the updated row.

4. DELETE — Delete data and return it
```sql
DELETE FROM ORGANIZATION
WHERE EMP_ID = 101
RETURNING *;
```
*/

-- RETURNING Keyword: INSERT
WITH INSERTED_EMPLOYEES AS (
    INSERT INTO ORGANIZATION (EMP_ID, NAME, AGE, ADDRESS, SALARY)
    VALUES (101, 'Rahul', 25, 'Delhi', 40000)
    RETURNING *
)
SELECT * FROM INSERTED_EMPLOYEES;

SELECT * FROM ORGANIZATION;


-- RETURNING Keyword: UPDATE
WITH UPDATE_EMPLOYEES AS (
	UPDATE ORGANIZATION
	SET SALARY = 48000
	WHERE EMP_ID = 101
	RETURNING *
)
SELECT * FROM UPDATE_EMPLOYEES;

SELECT * FROM ORGANIZATION;


-- RETURNING Keyword: DELETE
WITH DELETED_EMPLOYEES AS (
	DELETE FROM ORGANIZATION
	WHERE EMP_ID = 101
	RETURNING *
)
SELECT * FROM DELETED_EMPLOYEES;

SELECT * FROM ORGANIZATION;

-- ================================================================================


-- # ===== WITH RECURSIVE =====
/*
WITH RECURSIVE numbers(n) AS (
	1. Anchor query: starting point SELECT 1
	UNION ALL
	2. Recursive query: generate the next number SELECT n + 1 FROM numbers WHERE n < 5
)
3. Display the final result SELECT * FROM numbers;
*/

WITH RECURSIVE numbers(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT * FROM numbers;

-- ================================================================================
