-- # ===================== UPSERT ============================
/*
- UPSERT involves two operators - UPDATE and INSERT. This allows you to insert a new row into a table while handling conflicts. 
The conflict occur when you try to insert a new row into a table, but a row with the same unique or primary key already exists.
- Syntax:
```sql
INSERT INTO table_name (col1, col2, ...)
VALUES (value1, value2, ...)
ON CONFLICT (conflict_column)
DO UPDATE SET col1 = EXCLUDED.col1, col2 = EXCLUDED.col2;
```
- Syntax:
```sql
INSERT INTO table_name (col1, col2, ...)
VALUES (value1, value2, ...)
ON CONFLICT (conflict_column)
DO NOTHING;
```
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




-- Query 2: Upsert
/*
In this:
- IDs 1–5 already exist, so their records will be updated.
- IDs 11–15 are new, so they will be inserted.
- IDs 6–10 remain unchanged.
*/

INSERT INTO PERSON (ID, NAME, AGE, CITY, SALARY)
VALUES
(1, 'Amit Sharma', 26, 'Bangalore', 40000),
(2, 'Priya Singh', 29, 'Chennai', 48000),
(3, 'Rahul Verma', 31, 'Hawra', 55000),
(4, 'Neha Gupta', 25, 'Ringus', 36000),
(5, 'Vikas Kumar', 36, 'Nainital', 65000),
(11, 'Manish', 28, 'Agra', 41000),
(12, 'Kavita', 30, 'Surat', 47000),
(13, 'Deepak', 27, 'Indore', 39000),
(14, 'Meena', 33, 'Patna', 52000),
(15, 'Suresh', 24, 'Kanpur', 34000)
ON CONFLICT (ID)
DO UPDATE SET
	NAME = EXCLUDED.NAME,
	AGE = EXCLUDED.AGE,
	CITY = EXCLUDED.CITY,
	SALARY = EXCLUDED.SALARY;

SELECT * FROM PERSON ORDER BY ID;



-- Query 3: INSERT with DO NOTHING on conflict
-- Since your PERSON table already has IDs 1 through 15, we'll use IDs 1–5 to demonstrate conflicts and IDs 16–18 for new records.
INSERT INTO PERSON (ID, NAME, AGE, CITY, SALARY)
VALUES
(1, 'Mukesh Sharma', 26, 'Delhi', 40000),
(2, 'Priyanka Singh', 29, 'Mumbai', 48000),
(3, 'Suresh Verma', 31, 'Pune', 55000),
(16, 'Rakesh', 28, 'Agra', 42000),
(17, 'Sunita', 32, 'Patna', 51000),
(18, 'Poonam', 35, 'Saharanpur', 38000)
ON CONFLICT (ID)
DO NOTHING;

SELECT * FROM PERSON ORDER BY ID;

-- Query Drop Table
DROP TABLE IF EXISTS PERSON;
