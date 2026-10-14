-- # ===================== CREATE ============================

/*
# PostgreSQL - CREATE TABLE
---------------------------

In PostgreSQL, the CREATE TABLE statement is used to create
a new table in the selected database.

# Syntax:

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
    ...
    columnN datatype,
    PRIMARY KEY (one or more columns)
);


# ============================================================
# 1. CREATE COMPANY TABLE
# ============================================================

-- Syntax:

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    PRIMARY KEY (column_name)
);


# ============================================================
# 2. CREATE DEPARTMENT TABLE
# ============================================================

-- Syntax:

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    PRIMARY KEY (column_name)
);

*/


-- ============================================================
-- ACTUAL QUERY
-- ============================================================

CREATE TABLE COMPANY (
    ID INT PRIMARY KEY NOT NULL,
    NAME TEXT NOT NULL,
    AGE INT NOT NULL,
    ADDRESS CHAR(50),
    SALARY REAL,
    JOIN_DATE DATE
);

CREATE TABLE DEPARTMENT (
    ID INT PRIMARY KEY NOT NULL,
    DEPT CHAR(50) NOT NULL,
    EMP_ID INT NOT NULL
);


-- # ===================== INSERT ============================

/*
# PostgreSQL - INSERT INTO
--------------------------

INSERT INTO is used to insert one or more records
into an existing table.

# Syntax:

INSERT INTO table_name
    (column1, column2, column3, ..., columnN)
VALUES
    (value1, value2, value3, ..., valueN);


# ============================================================
# 1. INSERT SINGLE RECORD
# ============================================================

-- Syntax:

INSERT INTO table_name
    (column1, column2, column3)
VALUES
    (value1, value2, value3);


# ============================================================
# 2. INSERT MULTIPLE RECORDS
# ============================================================

-- Syntax:

INSERT INTO table_name
    (column1, column2, column3)
VALUES
    (value1, value2, value3),
    (value1, value2, value3),
    (value1, value2, value3);

*/


-- ============================================================
-- ACTUAL QUERY
-- ============================================================

INSERT INTO COMPANY
    (ID, NAME, AGE, ADDRESS, SALARY, JOIN_DATE)
VALUES
    (1, 'Arjun', 28, 'California', 90000.00, '2026-02-02');

INSERT INTO COMPANY
    (ID, NAME, AGE, ADDRESS, SALARY, JOIN_DATE)
VALUES
    (2, 'Simran', 24, 'Noida', 80000.40, '2025-01-12'),
    (3, 'Raj', 27, 'Gujrat', 70000.00, '2026-08-15'),
    (4, 'Hariom', 25, 'Maharashtra', 60000.00, '2026-04-10'),
    (5, 'Adarsh', 28, 'Lucknow', 68000.47, '2026-07-12');

INSERT INTO COMPANY 
	(ID, NAME, AGE, ADDRESS, SALARY, JOIN_DATE, GENDER)
VALUES
	(6, 'Amit Sharma', 28, 'Delhi', 55000.00, '2023-01-15', 'M'),
	(7, 'Priya Verma', 26, 'Mumbai', 62000.00, '2022-07-20', 'F'),
	(8, 'Rahul Singh', 31, 'Bangalore', 48000.00, '2024-02-10', 'M'),
	(9, 'Sneha Gupta', 29, 'Pune', 71000.00, '2021-11-05', 'F'),
	(10, 'Vikas Kumar', 34, 'Gurugram', 68000.00, '2023-06-18', 'M'),
	(11, 'Anjali Mehta', 27, 'Hyderabad', 59000.00, '2022-03-12', 'F'),
	(12, 'Rohit Joshi', 30, 'Chennai', 52000.00, '2024-01-25', 'M'),
	(13, 'Neha Kapoor', 32, 'Noida', 75000.00, '2021-09-30', 'F'),
	(14, 'Arjun Malhotra', 29, 'Jaipur', 63000.00, '2023-08-14', 'M'),
	(15, 'Pooja Yadav', 25, 'Lucknow', 47000.00, '2024-04-08', 'F'),
	(16, 'Karan Patel', 36, 'Ahmedabad', 81000.00, '2020-12-21', 'M'),
	(17, 'Riya Shah', 28, 'Surat', 56000.00, '2023-10-02', 'F'),
	(18, 'Sandeep Reddy', 33, 'Hyderabad', 72000.00, '2022-05-17', 'M'),
	(19, 'Kavita Rao', 31, 'Bangalore', 65000.00, '2021-08-11', 'F'),
	(20, 'Manish Tiwari', 27, 'Kanpur', 49000.00, '2024-03-19', 'M'),
	(21, 'Simran Kaur', 30, 'Chandigarh', 78000.00, '2022-10-25', 'F'),
	(22, 'Deepak Mishra', 35, 'Bhopal', 58000.00, '2023-04-07', 'M'),
	(23, 'Nisha Agarwal', 29, 'Kolkata', 69000.00, '2021-06-28', 'F'),
	(24, 'Abhishek Jain', 32, 'Indore', 61000.00, '2023-12-01', 'M'),
	(25, 'Meera Nair', 26, 'Kochi', 73000.00, '2022-01-14', 'F');

INSERT INTO COMPANY 
    (ID, NAME, AGE, ADDRESS, SALARY, JOIN_DATE, GENDER)
VALUES
    (26, 'Aarav Mehta', 28, 'Delhi', 55000.00, '2023-02-11', 'M'),
    (27, 'Kavya Sharma', 26, 'Mumbai', 62000.00, '2022-08-15', 'F'),
    (28, 'Rohan Singh', 31, 'Bangalore', 48000.00, '2024-03-05', 'M'),
    (29, 'Isha Gupta', 29, 'Pune', 71000.00, '2021-12-10', 'F'),
    (30, 'Aditya Kumar', 34, 'Gurugram', 68000.00, '2023-07-21', 'M'),
    (31, 'Aditi Mehta', 27, 'Hyderabad', 59000.00, '2022-04-18', 'F'),
    (32, 'Rakesh Joshi', 30, 'Chennai', 52000.00, '2024-02-14', 'M'),
    (33, 'Pallavi Kapoor', 32, 'Noida', 75000.00, '2021-10-22', 'F'),
    (34, 'Varun Malhotra', 29, 'Jaipur', 63000.00, '2023-09-16', 'M'),
    (35, 'Sakshi Yadav', 25, 'Lucknow', 47000.00, '2024-05-12', 'F'),
    (36, 'Nitin Patel', 36, 'Ahmedabad', 81000.00, '2021-01-18', 'M'),
    (37, 'Shreya Shah', 28, 'Surat', 56000.00, '2023-11-08', 'F'),
    (38, 'Mahesh Reddy', 33, 'Hyderabad', 72000.00, '2022-06-20', 'M'),
    (39, 'Poonam Rao', 31, 'Bangalore', 65000.00, '2021-09-14', 'F'),
    (40, 'Ravi Tiwari', 27, 'Kanpur', 49000.00, '2024-04-23', 'M'),
    (41, 'Harpreet Kaur', 30, 'Chandigarh', 78000.00, '2022-11-17', 'F'),
    (42, 'Suresh Mishra', 35, 'Bhopal', 58000.00, '2023-05-19', 'M'),
    (43, 'Ritika Agarwal', 29, 'Kolkata', 69000.00, '2021-07-25', 'F'),
    (44, 'Aman Jain', 32, 'Indore', 61000.00, '2023-12-15', 'M'),
    (45, 'Ananya Nair', 26, 'Kochi', 73000.00, '2022-02-19', 'F');

-- # ===================== SELECT ============================

/*
# PostgreSQL - SELECT
---------------------

SELECT is used to retrieve/fetch data from a table.

# Syntax:

SELECT column1, column2, column3, ..., columnN
FROM table_name;


# ============================================================
# 1. SELECT SPECIFIC COLUMNS
# ============================================================

-- Syntax:

SELECT column1, column2
FROM table_name;


# ============================================================
# 2. SELECT ALL COLUMNS
# ============================================================

-- Syntax:

SELECT *
FROM table_name;

*/


-- ============================================================
-- ACTUAL QUERY
-- ============================================================

SELECT ID, NAME, ADDRESS
FROM COMPANY;

SELECT *
FROM COMPANY;


-- # ===================== UPDATE ============================

/*
# PostgreSQL - UPDATE
---------------------

UPDATE is used to modify existing records in a table.

# Syntax:

UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition;


# Important:
- Always use a WHERE condition when you want to update
  specific records.
- Without WHERE, all records in the table will be updated.
- Multiple conditions can be combined using AND / OR.
- Use single quotes (' ') for string values.
- Double quotes (" ") are used for identifiers such as
  column names when required.


# ============================================================
# 1. UPDATE SINGLE COLUMN
# ============================================================

-- Syntax:

UPDATE table_name
SET column_name = value
WHERE condition;


# ============================================================
# 2. UPDATE MULTIPLE COLUMNS
# ============================================================

-- Syntax:

UPDATE table_name
SET column1 = value1,
    column2 = value2
WHERE condition;


# ============================================================
# 3. UPDATE USING AND
# ============================================================

-- Syntax:

UPDATE table_name
SET column_name = value
WHERE condition1
  AND condition2;


# ============================================================
# 4. UPDATE USING OR
# ============================================================

-- Syntax:

UPDATE table_name
SET column_name = value
WHERE condition1
   OR condition2;

*/


-- ============================================================
-- ACTUAL QUERY
-- ============================================================

UPDATE COMPANY
SET SALARY = 85000
WHERE ID = 2;

SELECT * FROM COMPANY;

UPDATE COMPANY
SET ADDRESS = 'Delhi'
WHERE ID = 1;

SELECT * FROM COMPANY;


-- # ===================== DELETE ============================

/*
# PostgreSQL - DELETE
---------------------

DELETE is used to delete records from a table.

The DELETE statement removes the selected records,
but the table structure/schema remains.

# Syntax:

DELETE FROM table_name
WHERE condition;


# ============================================================
# 1. DELETE SPECIFIC RECORD
# ============================================================

-- Syntax:

DELETE FROM table_name
WHERE condition;


# ============================================================
# 2. DELETE MULTIPLE RECORDS
# ============================================================

-- Syntax:

DELETE FROM table_name
WHERE condition;


# ============================================================
# 3. DELETE ALL RECORDS
# ============================================================

-- Syntax:

DELETE FROM table_name;

-- Example:

DELETE FROM COMPANY;

-- IMPORTANT:
-- This deletes all records from COMPANY,
-- but the COMPANY table/schema still exists.

*/


-- ============================================================
-- ACTUAL QUERY
-- ============================================================

CREATE TABLE DEMO_TABLE (
    NAME TEXT,
    DESIGNATION TEXT,
    ADDRESS TEXT,
    EMAIL TEXT,
    PHONE TEXT
);

INSERT INTO DEMO_TABLE
    (NAME, DESIGNATION, ADDRESS, EMAIL, PHONE)
VALUES
    ('Arjun', 'AI Engineer', 'Ayodhya', 'arjun123@email.com', '9161589883'),
    ('Vishal', 'Data Engineer', 'Lucknow', 'viksha123@gmail.com', '7345768923');

SELECT * FROM DEMO_TABLE;


-- DELETE all records.
-- Schema/table still exists.

DELETE FROM DEMO_TABLE;

SELECT * FROM DEMO_TABLE;


-- # ===================== DROP ============================

/*
# PostgreSQL - DROP TABLE
-------------------------

DROP TABLE is used to completely remove a table.

Unlike DELETE:
- All records are deleted.
- Table/schema structure is also deleted.
- The table no longer exists in the database.

# Syntax:

DROP TABLE table_name;


# ============================================================
# 1. DROP TABLE
# ============================================================

-- Syntax:

DROP TABLE table_name;

-- Example:

DROP TABLE DEMO_TABLE;

-- After executing the above query:
-- DEMO_TABLE no longer exists.


# ============================================================
# 2. DROP TABLE IF EXISTS
# ============================================================

-- Syntax:

DROP TABLE IF EXISTS table_name;

-- Example:

DROP TABLE IF EXISTS DEMO_TABLE;

-- IF EXISTS prevents an error if the table
-- does not exist.


# ============================================================
# DELETE vs DROP
# ============================================================

DELETE:
- Deletes records.
- Table remains.
- Schema remains.
- Can use WHERE.

DROP:
- Deletes records.
- Deletes table structure.
- Table no longer exists.
- Cannot use WHERE.


# Example:

DELETE FROM DEMO_TABLE;

-- Table still exists.


DROP TABLE DEMO_TABLE;

-- Table no longer exists.

*/


-- ============================================================
-- ACTUAL QUERY
-- ============================================================

DROP TABLE DEMO_TABLE;

-- The following query will generate an error because
-- DEMO_TABLE no longer exists.

-- SELECT * FROM DEMO_TABLE;


-- Safe way to drop a table:

DROP TABLE IF EXISTS DEMO_TABLE;

-- This will not generate an error even if
-- DEMO_TABLE does not exist.

