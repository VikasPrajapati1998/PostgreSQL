


-- # DATABASE OPERATIONS

/*
# ALTER
## Alter Database
# Syntax:
ALTER DATABASE name ACTION;

# ACTION
## Action: In PSQL, the common action defines the database operations
based on database objects such as databases, tables, roles, and schemas.
These actions help users to modify, manage, and control the behavior
of the database.
*/

-- # CREATE DATABASE
-- ===================================================================
CREATE DATABASE testdb;

-- Create database with specific owner
CREATE DATABASE testdb OWNER arjun;

-- Create database with  specific owner and encoding
CREATE DATABASE testdb OWNER arjun ENCODING 'UTF8' TEMPLATE template0;
-- ===================================================================

-- ===================================================================
/*
## List of Databases: 
$`\l`
$`\list`

## Connect to Database: 
$`\c testdb`
$`\connect testdb`

## 'datname' have the list of databases in 'pg_database' database
SELECT datname FROM pg_database;
*/
-- ===================================================================

-- ===================================================================
-- # RENAME DATABASE
ALTER DATABASE testdb RENAME TO demodb;
-- ===================================================================

-- ===================================================================
-- # CHANGE OWNER: Change the Owner of Database
ALTER DATABASE testdb OWNER TO vikas;
-- ===================================================================

-- ===================================================================
-- # DATABASE SETTINGS
-- Set the timezone
ALTER DATABASE testdb SET timezone TO 'Asia/Kolkata';

-- Remove the setting
ALTER DATABASE testdb RESET timezone;
-- ===================================================================

-- ===================================================================
-- # ALLOW OR PREVENT NEW CONNECTIONS
-- Prevent new connections
ALTER DATABASE testdb ALLOW_CONNECTIONS false;

-- Allow connections
ALTER DATABASE testdb ALLOW_CONNECTIONS true;

-- Set connection limit
ALTER DATABASE testdb CONNECTION LIMIT 20;

-- Set unlimited connection limit
ALTER DATABASE testdb CONNECTION LIMIT -1;
-- ===================================================================

-- ===================================================================
-- # DROP/DELETE DATABASE
DROP DATABASE testdb;

-- Delete only if exists
DROP DATABASE IF EXISTS testdb;

-- Force drop database
DROP DATABASE testdb WITH (FORCE);

-- Command to drop the database
-- $dropdb -h localhost -p 5432 -U postgres testdb;
-- ===================================================================

-- ===================================================================
-- # CREATE DATABASE from ANOTHER DATABASE (Template)
CREATE DATABASE testdb_copy TEMPLATE testdb;
-- ===================================================================

-- ===================================================================
-- # GRANT ACCESS to a DATABASE
GRANT CONNECT ON DATABASE testdb TO arjun;

-- # GRANT ACCESS to multiple USERS/ROLES
GRANT CONNECT ON DATABASE testdb TO arjun, vikas, vishal;

-- # REVOKE ACCESS
REVOKE CONNECT ON DATABASE testdb FROM arjun;
-- ===================================================================

-- ===================================================================
-- # COMMENT on a DATABASE
COMMENT ON DATABASE testdb IS 'Production Database';
-- ===================================================================


-- # LOAD DATABASE
-- ===================================================================
/*
## Different ways to load database in PostgreSQL
1. Using restore
2. Using psql
3. Importing Data from CSV files
4. Using pgAdmin

## 1. Using Restore
Suppose you have a backup in custom format like .dump or .backup, then use the pg_restore command.

### Syntax: 
`pg_restore -U postgres -d target_database backup_file.dump`

* -U postgres specifies the PostgreSQL user.
* -d target_database is the database where data will be restored
* backup_file.dump is the backup file.


## 2. Using psql
To back up the database in plain SQL format, use the psql command to restore it.

### Syntax:
`psql -U postgres -d target_database -f backup_file.sql`

* -f backup_file.sql specifies the SQL file to execute.


## 3. Importing Data from CSV files
If you want to load the database with external sources, use the COPY command.
`COPY table_name FROM '/path/to/file.csv' DELIMITER ',' CSV HEADER;`

* /path/to/file.csv - This is file location.
* DELIMITER ',' specifies that values are comma-separated.
* CSV HEADER indicates that the first row contains column names.


## 4. Using pgAdmin
pgAdmin is a free opens-source tool that helps users to manage PostgreSQL and other relational databases.
Given below steps help to load the database.
Step 1: Open the pgAdmin and connect with PostgreSQL server
Step 2: Then select the target database
Step 3: Go to Tools -> restore
Step 4: Finally, click the restore to load the database

*/
-- ===================================================================
