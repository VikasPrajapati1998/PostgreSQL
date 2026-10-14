-- # USER OR ROLE
-- ===================================================================
-- # CREATE USER/ROLE
CREATE USER arjun;
CREATE USER vikas;
CREATE USER vishal;

-- # OR CREATE USER/ROLE
CREATE USER arjun LOGIN;
CREATE USER vikas LOGIN;
CREATE USER vishal LOGIN;

-- CREATE USER/ROLE WITH PASSWORD
CREATE USER arjun WITH PASSWORD 'arjun1234';
CREATE USER vikas WITH PASSWORD 'vikas1234';
CREATE USER vishal WITH PASSWORD 'vishal1234';
-- ===================================================================

-- ===================================================================
-- Allow user's/role's to Create Database 
ALTER USER arjun CREATEDB;
ALTER USER vikas CREATEDB;
ALTER USER vishal CREATEDB;

-- Create user/role with password and with createdb
CREATE USER arjun WITH PASSWORD 'arjun1234' CREATEDB;
CREATE USER vikas WITH PASSWORD 'vikas1234' CREATEDB;
CREATE USER vishal WITH PASSWORD 'vishal1234' CREATEDB;

-- Create user/role with password, createdb and with createrole
CREATE USER arjun WITH PASSWORD 'arjun1234' CREATEDB CREATEROLE;
CREATE USER vikas WITH PASSWORD 'vikas1234' CREATEDB CREATEROLE;
CREATE USER vishal WITH PASSWORD 'vishal1234' CREATEDB CREATEROLE;
-- ===================================================================

-- ===================================================================
-- # RENAME USER/ROLE
ALTER USER arjun RENAME TO arjun_prajapati;
ALTER USER vikas RENAME TO vikas_prajapati;
ALTER USER vishal RENAME TO vishal_yadav;
-- ===================================================================

-- ===================================================================
-- # CHANGE USER'S/ROLE'S PASSWORD
ALTER USER arjun WITH PASSWORD 'arjun_prajapati1234';
ALTER USER vikas WITH PASSWORD 'vikas_prajapati1234';
ALTER USER vishal WITH PASSWORD 'vishal_yadav1234';
-- ===================================================================

-- ===================================================================
-- # DELETE USER/ROLE
DROP USER arjun;
DROP USER vikas;
DROP USER vishal;

-- # DELETE USER/ROLE IF EXISTS
DROP USER IF EXISTS arjun;
DROP USER IF EXISTS vikas;
DROP USER IF EXISTS vishal;
-- ===================================================================

