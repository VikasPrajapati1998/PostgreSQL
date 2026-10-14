-- # ===================== AND and OR Operators ============================
/*
- DROP TABLE statement is used to remove a table definition and all associated data, indexes, rules, triggers, and constraints for that table.
*/

CREATE TABLE IF NOT EXISTS EMPLOYEES (
    EMP_ID 		INT PRIMARY KEY	 	NOT NULL,
    NAME 		TEXT 				NOT NULL,
    DESIGNATION CHAR(100) 			NOT NULL
);

WITH EMPLOYEES_CTE AS (
    SELECT EMP_ID, FIRST_NAME, LAST_NAME, DESIGNATION
    FROM COMPANY
    WHERE FIRST_NAME LIKE 'A%'
)
INSERT INTO EMPLOYEES (EMP_ID, NAME, DESIGNATION)
SELECT
    EMP_ID,
    FIRST_NAME || ' ' || LAST_NAME AS NAME,
    DESIGNATION
FROM EMPLOYEES_CTE;

SELECT * FROM EMPLOYEES;

DROP TABLE IF EXISTS EMPLOYEES;

