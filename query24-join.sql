-- # ===================== JOINS ============================
/*
- The PostgreSQL JOINS clause is used to combine records from two or more tables in a database. A JOIN is a means for combining fields from two tables by using values common to each.
- Type of JOINS in PostgreSQL
	1. INNER JOIN
	2. LEFT JOIN
	3. RIGHT JOIN
	4. FULL OUTER JOIN
	5. CROSS JOIN
	6. SELF JOIN
	7. NATURAL JOIN
- The keyword OUTER is optional as for example LEFT JOIN is written called as LEFT OUTER JOIN.
*/

-- Create Schema
CREATE SCHEMA IF NOT EXISTS JOINS;

-- ==========================================
-- TABLE: COMPANY
-- ==========================================

CREATE TABLE IF NOT EXISTS JOINS.COMPANY (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL,
    salary NUMERIC(10, 2) NOT NULL,
    join_date DATE NOT NULL
);

-- Insert First 10 Records
INSERT INTO JOINS.COMPANY
    (name, age, address, salary, join_date)
VALUES
    ('Amit Sharma', 28, 'Delhi', 45000.00, '2022-01-15'),
    ('Priya Verma', 32, 'Mumbai', 55000.00, '2021-03-20'),
    ('Rahul Singh', 25, 'Jaipur', 35000.00, '2023-06-10'),
    ('Neha Gupta', 30, 'Bangalore', 60000.00, '2020-11-05'),
    ('Vikas Kumar', 35, 'Chennai', 75000.00, '2019-07-12'),
    ('Sneha Patel', 27, 'Ahmedabad', 40000.00, '2022-09-18'),
    ('Rohit Mehta', 29, 'Pune', 50000.00, '2021-12-01'),
    ('Anjali Das', 26, 'Kolkata', 38000.00, '2023-02-14'),
    ('Karan Malhotra', 40, 'Hyderabad', 90000.00, '2018-05-22'),
    ('Pooja Reddy', 31, 'Lucknow', 65000.00, '2020-08-30'),
    ('Arjun Nair', 33, 'Kochi', 58000.00, '2021-04-12'),
    ('Meera Joshi', 29, 'Indore', 47000.00, '2022-07-25'),
    ('Sanjay Yadav', 36, 'Patna', 72000.00, '2019-09-16'),
    ('Kavita Rao', 27, 'Mysore', 42000.00, '2023-01-09'),
    ('Deepak Sinha', 38, 'Bhopal', 82000.00, '2018-12-03'),
    ('Riya Kapoor', 24, 'Chandigarh', 32000.00, '2024-02-19'),
    ('Manish Thakur', 34, 'Dehradun', 68000.00, '2020-06-22'),
    ('Divya Iyer', 30, 'Coimbatore', 54000.00, '2021-10-11'),
    ('Nitin Jain', 41, 'Nagpur', 95000.00, '2017-08-14'),
    ('Simran Kaur', 26, 'Amritsar', 39000.00, '2023-11-06');

-- Display All Company Records
SELECT * FROM JOINS.COMPANY;


-- ==========================================
-- TABLE: DEPARTMENT
-- ==========================================

CREATE TABLE IF NOT EXISTS JOINS.DEPARTMENT (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    dept VARCHAR(50) NOT NULL,
    emp_id INT NOT NULL
);

-- Insert 5 Records
INSERT INTO JOINS.DEPARTMENT
    (dept, emp_id)
VALUES
    ('HR', 1),
    ('IT', 2),
    ('Finance', 5),
    ('Marketing', 7),
    ('Sales', 11),
	('HR', 13),
	('IT', 14),
	('Finance', 17),
	('Marketing', 19),
	('Sales', 20);

-- Display All Department Records
SELECT * FROM JOINS.DEPARTMENT;

-- DROP TABLE IF EXISTS JOINS.DEPARTMENT;

-- ===================================
-- # ========== INNER JOIN ===========
-- ===================================
/*
- A INNER JOIN creates a new result table by combining column values of two table (table1 and table1) based upon the join predicate.
- Query compares each row of table1 with each row of table2 to find all pairs of rows, which satisfy the join-predicate.
- When the join-predicate is satisfied, column values for each matched pair of rows of table1 and table2 are combined into a result row.
- Table_1 |INTERSECTION| Table_2
- # Syntax:
SELECT table1.column1, table2.column2 ...
FROM table1
INNER JOIN table2
ON table1.common_field = table2.common_field;
*/

SELECT  C.id, C.name, C.age, C.address, C.salary, C.join_date, D.id, D.dept, D.emp_id
FROM JOINS.COMPANY as C
INNER JOIN JOINS.DEPARTMENT as D
ON C.ID = D.EMP_ID
ORDER BY C.ID;


-- ===================================
-- # ========== LEFT JOIN ===========
-- ===================================
/*
- The LEFT JOIN is also known as LEFT OUTER JOIN. It is an extension of the INNER JOIN. In case of LEFT OUTER JOIN, an inner join is performed first. Then, for each row
in table T1 that does not satisfy the join condition with any row in table T2, a joined row is added with null values in columns of T2. Thus, the joined table always has
at least one row for each row in T1.
- Table_1 |LEFT JOIN| Table_2
- # Syntax:
SELECT column1, column2 ... columnN
FROM table 1
LEFT OUTER JOIN table 2
ON condition_expression.
*/

