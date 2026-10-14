# PostgreSQL Keynotes — Quick Revision Sheet

Condensed notes from the 22 practice files in this folder (`query01` … `query22`).
Use it as a fast brush-up: skim the **Cheat Sheet**, then jump to a topic.

## Contents

| # | Topic | Source file |
|---|---|---|
| 1 | [Cheat sheet](#1-cheat-sheet) | all |
| 2 | [Database operations](#2-database-operations) | query01, query07 |
| 3 | [Users & roles](#3-users--roles) | query05, query06 |
| 4 | [Data types](#4-data-types) | query02 |
| 5 | [Operators & expressions](#5-operators--expressions) | query03, query04 |
| 6 | [Tables & CRUD](#6-tables--crud) | query08, query14 |
| 7 | [ALTER TABLE & constraints](#7-alter-table--constraints) | query09 |
| 8 | [Querying: WHERE → LIMIT](#8-querying-where--limit) | query10–13, 15–17, 19 |
| 9 | [CTEs, RETURNING, recursion](#9-ctes-returning-recursion-with) | query18, query20 |
| 10 | [UPSERT](#10-upsert-on-conflict) | query21 |
| 11 | [DELETE vs TRUNCATE vs DROP](#11-delete-vs-truncate-vs-drop) | query08, 20, 22 |
| 12 | [Gotchas & errors found in the practice files](#12-gotchas--errors-found-in-the-practice-files) | all |

---

## 1. Cheat Sheet

**Clause order you write:**

```sql
SELECT [DISTINCT] cols / aggregates
FROM   table
WHERE  row_filter
GROUP  BY cols
HAVING group_filter
ORDER  BY cols [ASC|DESC]
LIMIT  n OFFSET m;
```

**Logical execution order (why aliases/aggregates behave as they do):**
`FROM → WHERE → GROUP BY → HAVING → SELECT → DISTINCT → ORDER BY → LIMIT/OFFSET`

| Need | Use |
|---|---|
| Filter rows | `WHERE` |
| Filter groups (on aggregates) | `HAVING` |
| Unique rows | `DISTINCT` |
| Pattern match | `LIKE` (`%` = 0+ chars, `_` = exactly 1) |
| Page results | `LIMIT n OFFSET m` |
| Reusable sub-result | `WITH name AS (...)` |
| Get changed rows back | `INSERT/UPDATE/DELETE ... RETURNING *` |
| Insert-or-update | `INSERT ... ON CONFLICT (key) DO UPDATE / DO NOTHING` |
| Empty a table fast | `TRUNCATE TABLE t` |
| Remove table entirely | `DROP TABLE IF EXISTS t` |

**psql shortcuts:** `\l` list DBs · `\c db` connect · `SELECT datname FROM pg_database;`

---

## 2. Database Operations

```sql
CREATE DATABASE sampleDB;
CREATE DATABASE testdb OWNER arjun ENCODING 'UTF8' TEMPLATE template0;
CREATE DATABASE testdb_copy TEMPLATE testdb;      -- clone an existing DB

ALTER DATABASE testdb RENAME TO demodb;
ALTER DATABASE testdb OWNER TO vikas;
ALTER DATABASE testdb SET timezone TO 'Asia/Kolkata';
ALTER DATABASE testdb RESET timezone;
ALTER DATABASE testdb ALLOW_CONNECTIONS false;    -- or true
ALTER DATABASE testdb CONNECTION LIMIT 20;        -- -1 = unlimited

GRANT  CONNECT ON DATABASE testdb TO arjun, vikas, vishal;
REVOKE CONNECT ON DATABASE testdb FROM arjun;
COMMENT ON DATABASE testdb IS 'Production Database';

DROP DATABASE testdb;
DROP DATABASE IF EXISTS testdb;
DROP DATABASE testdb WITH (FORCE);                -- kicks out active connections
-- shell: dropdb -h localhost -p 5432 -U postgres testdb
```

### Loading / restoring data

| Method | Command |
|---|---|
| Custom-format backup (`.dump`/`.backup`) | `pg_restore -U postgres -d target_db backup.dump` |
| Plain SQL file | `psql -U postgres -d target_db -f backup.sql` |
| CSV import | `COPY tbl FROM '/path/file.csv' DELIMITER ',' CSV HEADER;` |
| GUI | pgAdmin → select DB → Tools → Restore |

---

## 3. Users & Roles

`USER` and `ROLE` are the same thing; **`CREATE USER` = `CREATE ROLE ... LOGIN`**.
`CREATE ROLE` alone cannot log in unless `LOGIN` is given.

```sql
CREATE USER arjun;
CREATE ROLE arjun LOGIN;
CREATE USER arjun WITH PASSWORD '<password>' CREATEDB CREATEROLE;

ALTER USER arjun CREATEDB;                        -- grant privilege
ALTER USER arjun RENAME TO arjun_prajapati;
ALTER USER arjun WITH PASSWORD '<new-password>';

DROP USER arjun;
DROP USER IF EXISTS arjun;
```

Same statements work with `ROLE` in place of `USER`.
Attributes: `LOGIN`, `PASSWORD`, `CREATEDB`, `CREATEROLE`.

---

## 4. Data Types

| Group | Types |
|---|---|
| **Integer** | `smallint` (2 B) · `integer` (4 B) · `bigint` (8 B) |
| **Exact decimal** | `decimal` / `numeric(p,s)` — user precision, exact (use for money) |
| **Float (inexact)** | `real` (4 B) · `double precision` (8 B) |
| **Auto-increment** | `smallserial` (2 B) · `serial` (4 B) · `bigserial` (8 B) |
| **Character** | `varchar(n)` variable w/ limit · `char(n)` fixed, blank-padded · `text` unlimited |
| **Binary** | `bytea` |
| **Date/Time** | `timestamp` (8 B, no tz) · `timestamptz` (8 B, with tz) · `date` (4 B) · `time` (8 B) · `time with time zone` (12 B) · `interval` (12 B) |
| **Boolean** | `boolean` (1 B) |
| **Enum** | `CREATE TYPE week AS ENUM ('Mon','Tue', ...);` |
| **Geometric** | `point`, `line`, `lseg`, `box`, `path`, `polygon`, `circle` |
| **Network** | `cidr` (networks), `inet` (hosts + networks), `macaddr` |
| **Full-text search** | `tsvector` (sorted normalized lexemes) · `tsquery` (search terms with `&` `|` `!`) |
| **UUID** | 128-bit, 32 hex digits, e.g. `550e8400-e29b-41d4-a716-446655440000` |
| **Array** | any base/enum/composite type, multi-dimensional |
| **Composite** | row-like structure via `CREATE TYPE ... AS (...)` |
| **Range** | discrete (ints 1–10) or continuous (10:00–11:00) |
| **Pseudo** | only for function arg/return types, **not** column types |

### Arrays

```sql
CREATE TABLE monthly_savings (
    name text,
    saving_per_quarter integer[],        -- or: integer ARRAY[4]
    scheme text[][]
);

INSERT INTO monthly_savings VALUES (
    'Manisha',
    '{20000, 14600, 23500, 13250}',
    '{{"FD","MF"},{"FD","Property"}}'
);

SELECT name FROM monthly_savings
WHERE saving_per_quarter[2] > saving_per_quarter[4];   -- 1-based index

UPDATE monthly_savings
SET saving_per_quarter = ARRAY[25000, 24000, 27000, 28000]   -- or '{...}'
WHERE name = 'Manisha';

SELECT * FROM monthly_savings WHERE 10000 = ANY (saving_per_quarter);  -- search any element
```

### Composite types

```sql
CREATE TYPE inventory_item AS (name text, supplier_id integer, price numeric);
CREATE TABLE on_hand (item inventory_item, count integer);

INSERT INTO on_hand VALUES (ROW('fuzzy dice', 42, 1.99), 1000);

SELECT (item).name FROM on_hand WHERE (item).price > 9.99;   -- parentheses are mandatory
```

---

## 5. Operators & Expressions

| Category | Operators |
|---|---|
| Arithmetic | `+ - * / %` · `^` power · `\|/` sqrt · `\|\|/` cube root · `!` / `!!` factorial (postfix/prefix) |
| Comparison | `=` · `!=` / `<>` · `>` `>=` `<` `<=` |
| Logical | `AND` `OR` `NOT` |
| Bitwise | `&` · `\|` · `~` · `<<` · `>>` · `#` (XOR) |

> Factorial operators `!` / `!!` were removed in PostgreSQL 14+; use `factorial(n)`.

**Expression** = values + operators + functions that evaluate to a value.

- **Boolean:** `WHERE <single-value match>`
- **Numeric:** `SELECT 2 + 3 AS result;`
- **Date:** return current system date/time (e.g. `CURRENT_DATE`, `NOW()`)

---

## 6. Tables & CRUD

### CREATE TABLE

```sql
CREATE TABLE COMPANY (
    ID        INT PRIMARY KEY NOT NULL,
    NAME      TEXT NOT NULL,
    AGE       INT NOT NULL,
    ADDRESS   CHAR(50),
    SALARY    REAL,
    JOIN_DATE DATE
);
```

**Main practice table (query14):** `COMPANY` with `EMP_ID SERIAL PRIMARY KEY`, `FIRST_NAME`, `LAST_NAME`, `GENDER`, `AGE`, `DOB`, `DESIGNATION`, `ADDRESS`, `STATE`, `COUNTRY`, `PIN`, `MOBILE_NUMBER`, `EMAIL_ADDRESS`, `AADHAAR_NUMBER`, `SALARY`, `JOIN_DATE` — loaded with ~100 Indian employee rows. All later queries (10–20) use it.
It starts with `DROP TABLE IF EXISTS COMPANY CASCADE;` (`CASCADE` also drops dependent objects).

### INSERT

```sql
INSERT INTO t (c1, c2) VALUES (v1, v2);                 -- single
INSERT INTO t (c1, c2) VALUES (v1, v2), (v3, v4);       -- multiple rows
```

### SELECT

```sql
SELECT c1, c2 FROM t;
SELECT * FROM t;
```

### UPDATE

```sql
UPDATE t SET c1 = v1, c2 = v2 WHERE condition;          -- combine with AND / OR
```

> **No `WHERE` = every row is updated.**
> Single quotes `'...'` = string values; double quotes `"..."` = identifiers.

### DELETE

```sql
DELETE FROM t WHERE condition;
DELETE FROM t;          -- all rows, table structure stays
```

---

## 7. ALTER TABLE & Constraints

| Task | Syntax |
|---|---|
| Add column | `ALTER TABLE t ADD COLUMN c CHAR(1);` |
| Add with default | `ADD COLUMN c VARCHAR(50) DEFAULT 'IT';` |
| Drop column | `ALTER TABLE t DROP COLUMN c;` |
| Change type | `ALTER TABLE t ALTER COLUMN c TYPE VARCHAR(10);` |
| Rename column | `ALTER TABLE t RENAME COLUMN old TO new;` |
| Rename table | `ALTER TABLE old RENAME TO new;` |
| Set / drop NOT NULL | `ALTER COLUMN c SET NOT NULL;` / `DROP NOT NULL;` |
| Set / drop default | `ALTER COLUMN c SET DEFAULT 'M';` / `DROP DEFAULT;` |
| Unique | `ADD CONSTRAINT name UNIQUE (c);` · multi-col: `UNIQUE (c1, c2)` |
| Check | `ADD CONSTRAINT name CHECK (age >= 18);` |
| Primary key | `ADD CONSTRAINT name PRIMARY KEY (c);` · composite: `(c1, c2)` |
| Drop any constraint | `ALTER TABLE t DROP CONSTRAINT name;` |

Notes:
- A table can have **only one** primary key — drop the old one before adding a composite PK.
- `ADD COLUMN ... NOT NULL DEFAULT 'x'` fills existing rows with the default.
- Quoted identifiers (`"ROLE"`) are **case-sensitive**; unquoted names fold to lowercase. Renaming `"ROLE"` → `"role"` makes it a normal lowercase column.

---

## 8. Querying: WHERE → LIMIT

### WHERE — filter rows (also used in UPDATE/DELETE)

```sql
WHERE salary < 70000 AND salary > 60000
WHERE name LIKE 'A%'
WHERE age IN (25, 27)            WHERE age NOT IN (24, 25, 26, 27)
WHERE age BETWEEN 24 AND 27      -- inclusive on both ends
WHERE EXISTS (SELECT * FROM company WHERE salary >= 65000)
WHERE age % 2 = 0                -- even ages
```

Tools: comparison, `AND/OR/NOT`, `IN`, `BETWEEN`, `LIKE`, `EXISTS`.

### AND / OR

```sql
WHERE age >= 25 OR  salary >= 65000     -- either condition
WHERE age >= 25 AND salary <= 65000     -- both conditions
```

`AND` binds tighter than `OR` — use parentheses when mixing.

### ORDER BY

```sql
ORDER BY age, address ASC;     -- multi-column; ASC is default
ORDER BY name DESC;
```

> Careful: `ASC`/`DESC` applies only to the column right before it. `ORDER BY name, address, salary ASC` sorts name and address ascending by default and salary explicitly ascending.

### GROUP BY — collapse rows into groups

```sql
SELECT address, COUNT(*) FROM company GROUP BY address ORDER BY address;
SELECT address, SUM(salary) AS "Place Income" FROM company GROUP BY address;
SELECT age, address, COUNT(*) AS total_count FROM company GROUP BY age, address;
```

- Aggregates: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`.
- Position: after `WHERE`, before `ORDER BY`.
- **Rule:** every non-aggregated column in `SELECT` must appear in `GROUP BY`, otherwise → error.

### HAVING — filter groups

```sql
SELECT age, address, COUNT(*) FROM company
WHERE age % 2 = 0
GROUP BY age, address
HAVING COUNT(*) >= 2
ORDER BY age, address;
```

| `WHERE` | `HAVING` |
|---|---|
| Filters **rows** before grouping | Filters **groups** after grouping |
| Cannot use aggregates | Uses aggregates |

### DISTINCT — remove duplicate rows

```sql
SELECT DISTINCT country, state FROM company;       -- unique *combination*
SELECT DISTINCT designation FROM company;
SELECT designation, COUNT(*) FROM company GROUP BY designation ORDER BY COUNT(*);
```

`DISTINCT` applies to the whole selected column list, not just the first column. With `GROUP BY`, the `DISTINCT` is redundant (groups are already unique).

### LIMIT / OFFSET — pagination

```sql
SELECT ... FROM company LIMIT 20;                  -- first 20
SELECT ... FROM company LIMIT 10 OFFSET 10;        -- rows 11–20 (page 2)
```

`OFFSET` = rows to skip. Page *n* of size *s* → `LIMIT s OFFSET (n-1)*s`. Use with `ORDER BY` for stable pages.

### LIKE — pattern matching

| Pattern | Meaning |
|---|---|
| `'X%'` | starts with X |
| `'%X%'` | contains X |
| `'%X'` | ends with X |
| `'X_'` | X + exactly one char |
| `'_X_'` | X surrounded by one char each side |

Without `%` or `_`, `LIKE` behaves like `=`.

```sql
WHERE first_name LIKE 'A___n%'                      -- A + 3 chars + n + anything
WHERE first_name LIKE 'P%' AND last_name LIKE '____a'   -- 5-letter last name ending in a
WHERE first_name::TEXT LIKE '%k%'                   -- ::TEXT casts the column
```

`LIKE` is case-sensitive; use `ILIKE` for case-insensitive.

---

## 9. CTEs, RETURNING, Recursion (WITH)

A **CTE** (Common Table Expression) is a named temporary result that exists for **one query**. It splits complex queries into readable parts and avoids repeating a subquery.

```sql
WITH salary_cte AS (
    SELECT * FROM company WHERE salary >= 100000
)
SELECT * FROM salary_cte WHERE last_name LIKE '%a' AND gender = 'Male';
```

### CTE + INSERT (copy data between tables)

```sql
WITH clone_cte AS (
    SELECT emp_id, first_name, age, address, salary
    FROM company WHERE salary <= 50000
)
INSERT INTO organization (emp_id, name, age, address, salary)
SELECT * FROM clone_cte;
```

Column count and order must match the target column list.

### String concatenation inside a CTE (query20)

```sql
INSERT INTO employees (emp_id, name, designation)
SELECT emp_id, first_name || ' ' || last_name AS name, designation
FROM employees_cte;                                  -- || joins strings
```

### RETURNING — get the affected rows back

```sql
INSERT ... VALUES (...) RETURNING *;
UPDATE ... SET ... WHERE ... RETURNING *;
DELETE FROM ... WHERE ... RETURNING *;
```

- Not needed for `SELECT` (it already returns data).
- Inside a CTE, the modified rows can be selected afterwards:

```sql
WITH deleted AS (
    DELETE FROM organization WHERE emp_id = 101 RETURNING *
)
SELECT * FROM deleted;
```

### WITH RECURSIVE

```sql
WITH RECURSIVE numbers(n) AS (
    SELECT 1                    -- 1. anchor (starting row)
    UNION ALL
    SELECT n + 1                -- 2. recursive step
    FROM numbers
    WHERE n < 10                -- stop condition (avoid infinite loop!)
)
SELECT * FROM numbers;          -- 3. final result: 1..10
```

---

## 10. UPSERT (ON CONFLICT)

**UPSERT = UPDATE + INSERT.** Inserts a row; if the unique/primary key already exists, handles the conflict instead of erroring.

```sql
-- Update existing, insert new
INSERT INTO person (id, name, age, city, salary)
VALUES (1, 'Amit Sharma', 26, 'Bangalore', 40000), (11, 'Manish', 28, 'Agra', 41000)
ON CONFLICT (id)
DO UPDATE SET
    name   = EXCLUDED.name,
    age    = EXCLUDED.age,
    city   = EXCLUDED.city,
    salary = EXCLUDED.salary;

-- Skip existing, insert only new
INSERT INTO person (...) VALUES (...)
ON CONFLICT (id)
DO NOTHING;
```

- `EXCLUDED` = the row that *would have been* inserted.
- `ON CONFLICT (col)` needs a unique index / primary key on that column.
- Rows not mentioned stay untouched.

---

## 11. DELETE vs TRUNCATE vs DROP

| | `DELETE` | `TRUNCATE` | `DROP` |
|---|---|---|---|
| Removes | chosen rows or all rows | all rows | whole table (data + structure) |
| `WHERE` | yes | no | no |
| Table remains | yes | yes | **no** |
| Speed on all rows | slower (row by row) | faster (no row scan) | n/a |
| Rollback in a transaction | yes | yes (PostgreSQL) | yes (PostgreSQL) |
| Row triggers fire | yes | no | n/a |
| Resets serial/identity | no | only with `RESTART IDENTITY` | n/a |
| Can fail on dependencies | no | FK references need `CASCADE` | yes unless `CASCADE` |

```sql
DELETE   FROM person WHERE id IN (1,2,3,4,5);
TRUNCATE TABLE person;
DROP TABLE person;
DROP TABLE IF EXISTS person;      -- no error if missing
```

**Memory hook:** DELETE = remove rows · TRUNCATE = empty the table · DROP = destroy the table.

---

## 12. Gotchas & Errors Found in the Practice Files

Corrections to things in the source `.sql` files, so they aren't repeated:

| File | Issue | Correct form |
|---|---|---|
| query02 | `TIMESTAMPZ` | the type is `timestamptz` (`timestamp with time zone`) |
| query02 | Enum value `'Sum'` | `'Sun'` |
| query02 | `INSERT` array values unquoted (`Manisha`, `{20000,...}`) | strings/array literals must be quoted: `'Manisha'`, `'{20000,14600}'` |
| query02 | `UPDATE monthly_saving` | table is `monthly_savings` |
| query02 | `CREATE TABLE on_hand(...)` missing `;` | terminate each statement |
| query03 | Factorial `!`, `!!` | removed in PG 14+, use `factorial()` |
| query07 | `ALTER DATABASE ... ALLOW_CONNECTIONS false` | real syntax: `ALTER DATABASE testdb WITH ALLOW_CONNECTIONS false;` |
| query08 | Inserts include `GENDER` before the column exists | `GENDER` is added in query09 — run query09's `ALTER TABLE` first |
| query09 | `UPDATE COMPANY SET GENDER='M'` with no `WHERE` | updates **every** row |
| query10 | `WHERE "age" = '28'` | works via implicit cast, but compare numbers as numbers: `age = 28` |
| query10 | Last statement lacks `;` | always terminate |
| query11 | Syntax comment `ORDER BY column1 column2` | needs a comma: `column1, column2` |
| query13 | Syntax comment `HAVING condition;` then `ORDER BY` | no `;` before `ORDER BY` |
| query14 | `GENDER CHAR(10)` stores `'Male'` blank-padded; query10 filters `GENDER='M'` (from the older table) | use `VARCHAR`; match `'Male'` / `'Female'` in this table |
| query15 | `SELECT DISTINCT ... GROUP BY` | `DISTINCT` is redundant with `GROUP BY` |
| query17 | `'+91_%_7'` | `_` = exactly 1 char, `%` = any length; ends with `7` |
| query20 | Header comment says "AND and OR Operators" | file actually covers `DROP TABLE` |
| query05/06 | Plaintext passwords in examples | fine for practice; never commit real credentials |

---

### Suggested revision path

1. Cheat sheet (§1) → CRUD (§6) → `WHERE`/`ORDER BY` (§8)
2. `GROUP BY` + `HAVING` + execution order
3. CTEs / `RETURNING` / `UPSERT` (§9–10)
4. `ALTER`, constraints, `DELETE` vs `TRUNCATE` vs `DROP` (§7, §11)
5. Data types & roles when needed (§3–4)
