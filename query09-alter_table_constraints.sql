-- # ===================== ALTER TABLE ============================

/*
PostgreSQL ALTER TABLE
----------------------

The PostgreSQL ALTER TABLE command is used to:
- Add columns
- Drop columns
- Modify column data types
- Rename columns
- Add constraints
- Drop constraints
- Add/remove default values
- Add/remove NOT NULL constraints

# ================================================================
# 1. ADD COLUMN
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD COLUMN column_name data_type;

-- Example:
ALTER TABLE COMPANY
ADD COLUMN GENDER CHAR(1);

-- Check:
SELECT * FROM COMPANY;


# ================================================================
# 2. ADD COLUMN WITH DEFAULT VALUE
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD COLUMN column_name data_type DEFAULT value;

-- Example:
ALTER TABLE COMPANY
ADD COLUMN DEPARTMENT VARCHAR(50) DEFAULT 'IT';

-- Check:
SELECT * FROM COMPANY;


# ================================================================
# 3. DROP COLUMN
# ================================================================

-- Syntax:
ALTER TABLE table_name
DROP COLUMN column_name;

-- Example:
ALTER TABLE COMPANY
DROP COLUMN DEPARTMENT;

-- Check:
SELECT * FROM COMPANY;


# ================================================================
# 4. MODIFY / CHANGE DATA TYPE
# ================================================================

-- PostgreSQL Syntax:
ALTER TABLE table_name
ALTER COLUMN column_name TYPE new_data_type;

-- Example:
ALTER TABLE COMPANY
ALTER COLUMN GENDER TYPE VARCHAR(10);

-- Check:
SELECT * FROM COMPANY;


# ================================================================
# 5. RENAME COLUMN
# ================================================================

-- Syntax:
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;

-- Example:
ALTER TABLE COMPANY
RENAME COLUMN GENDER TO SEX;

-- Check:
SELECT * FROM COMPANY;


# ================================================================
# 6. RENAME COLUMN BACK
# ================================================================

-- Syntax:
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;

-- Example:
ALTER TABLE COMPANY
RENAME COLUMN SEX TO GENDER;

-- Check:
SELECT * FROM COMPANY;


# ================================================================
# 7. ADD NOT NULL CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
ALTER COLUMN column_name SET NOT NULL;

-- Example:
ALTER TABLE COMPANY
ALTER COLUMN GENDER SET NOT NULL;


# ================================================================
# 8. DROP NOT NULL CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
ALTER COLUMN column_name DROP NOT NULL;

-- Example:
ALTER TABLE COMPANY
ALTER COLUMN GENDER DROP NOT NULL;


# ================================================================
# 9. ADD UNIQUE CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
UNIQUE (column_name);

-- Example:
ALTER TABLE COMPANY
ADD CONSTRAINT company_name_unique
UNIQUE (name);


# ================================================================
# 10. ADD UNIQUE CONSTRAINT ON MULTIPLE COLUMNS
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
UNIQUE (column1, column2);

-- Example:
ALTER TABLE COMPANY
ADD CONSTRAINT company_address_unique
UNIQUE (name, address);


# ================================================================
# 11. ADD CHECK CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
CHECK (condition);

-- Example:
ALTER TABLE COMPANY
ADD CONSTRAINT company_age_check
CHECK (age >= 18);


# ================================================================
# 12. ADD CHECK CONSTRAINT FOR SALARY
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
CHECK (condition);

-- Example:
ALTER TABLE COMPANY
ADD CONSTRAINT company_salary_check
CHECK (salary > 0);


# ================================================================
# 13. ADD PRIMARY KEY CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
PRIMARY KEY (column_name);

-- Example:
ALTER TABLE COMPANY
ADD CONSTRAINT company_pk
PRIMARY KEY (id);


# ================================================================
# 14. ADD COMPOSITE PRIMARY KEY
# ================================================================

-- Syntax:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name
PRIMARY KEY (column1, column2);

-- Example:
-- Do NOT execute this if COMPANY.id is already the primary key.
ALTER TABLE COMPANY
ADD CONSTRAINT company_composite_pk
PRIMARY KEY (id, name);


# ================================================================
# 15. DROP CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

-- Example:
ALTER TABLE COMPANY
DROP CONSTRAINT company_age_check;


# ================================================================
# 16. DROP UNIQUE CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

-- Example:
ALTER TABLE COMPANY
DROP CONSTRAINT company_name_unique;


# ================================================================
# 17. DROP PRIMARY KEY CONSTRAINT
# ================================================================

-- Syntax:
ALTER TABLE table_name
DROP CONSTRAINT constraint_name;

-- Example:
ALTER TABLE COMPANY
DROP CONSTRAINT company_pk;


# ================================================================
# 18. SET DEFAULT VALUE
# ================================================================

-- Syntax:
ALTER TABLE table_name
ALTER COLUMN column_name
SET DEFAULT value;

-- Example:
ALTER TABLE COMPANY
ALTER COLUMN GENDER
SET DEFAULT 'M';


# ================================================================
# 19. DROP DEFAULT VALUE
# ================================================================

-- Syntax:
ALTER TABLE table_name
ALTER COLUMN column_name
DROP DEFAULT;

-- Example:
ALTER TABLE COMPANY
ALTER COLUMN GENDER
DROP DEFAULT;


# ================================================================
# 20. RENAME TABLE
# ================================================================

-- Syntax:
ALTER TABLE old_table_name
RENAME TO new_table_name;

-- Example:
ALTER TABLE COMPANY
RENAME TO COMPANY_DETAILS;


# ================================================================
# 21. RENAME TABLE BACK
# ================================================================

-- Syntax:
ALTER TABLE old_table_name
RENAME TO new_table_name;

-- Example:
ALTER TABLE COMPANY_DETAILS
RENAME TO COMPANY;


# ================================================================
# 22. CHECK FINAL TABLE
# ================================================================

-- Syntax:
SELECT * FROM table_name;

-- Example:
SELECT * FROM COMPANY;

*/


-- ================================================================
-- ACTUAL QUERY
-- ================================================================

SELECT * FROM COMPANY;

-- Add GENDER column
-- Syntax:
-- ALTER TABLE table_name ADD COLUMN column_name data_type;

ALTER TABLE COMPANY
ADD COLUMN GENDER CHAR(1);

UPDATE COMPANY SET GENDER='M'; 
SELECT * FROM COMPANY;

ALTER TABLE COMPANY 
ADD COLUMN "ROLE" VARCHAR(100) NOT NULL DEFAULT 'User';
SELECT * FROM COMPANY;

UPDATE COMPANY SET "ROLE"='Manager' WHERE ID=1;
SELECT * FROM COMPANY;

ALTER TABLE COMPANY RENAME COLUMN "ROLE" TO "role";

ALTER TABLE COMPANY
ALTER COLUMN "role" TYPE VARCHAR(50);

SELECT * FROM COMPANY;

ALTER TABLE COMPANY
DROP COLUMN "role";

SELECT * FROM COMPANY;

