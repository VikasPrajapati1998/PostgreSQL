-- # ===================== TRUNCATE TABLE ============================
/*
- TRUNCATE TABLE command is used to delete complete data from an existing table. 
- You can also use DROP TABLE command to delete complete table but it would remove complete table structure from the database and you would need to re-create
this table once again if you wish to store some data.
- It has the same effect as DELETE on each table, but since it does not actually scan the tables, it is faster.

# Difference Between DELETE, TRUNCATE, and DROP:

## DELETE:
- Deletes specific rows or all rows from a table.
- Supports the WHERE clause to delete specific records.
- The table structure remains unchanged.
- Can be rolled back if executed within a transaction that is rolled back.
- DELETE triggers are fired.
- Syntax: DELETE FROM table_name WHERE condition;

## TRUNCATE:
- Removes all rows from a table.
- Does not support the WHERE clause.
- The table structure remains unchanged.
- Generally faster than DELETE for removing all rows.
- Can be rolled back in PostgreSQL if executed within a transaction that is rolled back.
- Resets identity or sequence values only when RESTART IDENTITY is specified in PostgreSQL.
- Syntax: TRUNCATE TABLE table_name;

## DROP:
- Removes the entire table from the database.
- Deletes both the table data and its structure.
- Does not support the WHERE clause.
- The table no longer exists after the operation.
- Can be rolled back in PostgreSQL if executed within a transaction that is rolled back.
- May fail if other database objects depend on the table, unless dependencies are handled.
- Syntax: DROP TABLE table_name;

# Summary:
- DELETE = Removes rows from a table.
- TRUNCATE = Removes all rows but keeps the table structure.
- DROP = Removes the entire table, including its structure.
*/

-- Query 1: Create Table
CREATE TABLE IF NOT EXISTS PERSON (
	ID INT PRIMARY KEY,
	NAME VARCHAR(50),
	AGE INT,
	CITY VARCHAR(50),
	SALARY NUMERIC(10, 2)
);

INSERT INTO PERSON (ID, NAME, AGE, CITY, SALARY)
VALUES
(1, 'Amit', 25, 'Delhi', 35000),
(2, 'Priya', 28, 'Mumbai', 42000),
(3, 'Rahul', 30, 'Pune', 50000),
(4, 'Neha', 24, 'Jaipur', 32000),
(5, 'Vikas', 35, 'Lucknow', 60000),
(6, 'Sneha', 27, 'Bhopal', 45000),
(7, 'Rohit', 29, 'Chennai', 48000),
(8, 'Pooja', 26, 'Kolkata', 38000),
(9, 'Karan', 32, 'Hyderabad', 55000),
(10, 'Anjali', 23, 'Noida', 30000);

SELECT * FROM PERSON ORDER BY ID;

-- =================================================================

-- Query 2: DELETE
DELETE FROM PERSON
WHERE ID IN (1, 2, 3, 4, 5);

SELECT * FROM PERSON ORDER BY ID;


-- Query 3: TRUNCATE TABLE
TRUNCATE TABLE PERSON;

SELECT * FROM PERSON;

INSERT INTO PERSON (ID, NAME, AGE, CITY, SALARY)
VALUES
(11, 'Manish', 28, 'Agra', 41000),
(12, 'Kavita', 30, 'Surat', 47000),
(13, 'Deepak', 27, 'Indore', 39000),
(14, 'Meena', 33, 'Patna', 52000),
(15, 'Suresh', 24, 'Kanpur', 34000);

SELECT * FROM PERSON ORDER BY ID;

-- Query 4: DROP TABLE

DROP TABLE PERSON;

SELECT * FROM PERSON;  -- ERROR




