-- # ROLE OR USER
-- ===================================================================
-- # CREATE ROLE/USER
CREATE ROLE arjun;
CREATE ROLE vikas;
CREATE ROLE vishal;

-- # OR CREATE ROLE/USER
CREATE ROLE arjun LOGIN;
CREATE ROLE vikas LOGIN;
CREATE ROLE vishal LOGIN;

-- CREATE ROLE/USER WITH PASSWORD
CREATE ROLE arjun WITH PASSWORD 'arjun1234';
CREATE ROLE vikas WITH PASSWORD 'vikas1234';
CREATE ROLE vishal WITH PASSWORD 'vishal1234';
-- ===================================================================

-- ===================================================================
-- Allow role's/user's to Create Database 
ALTER ROLE arjun CREATEDB;
ALTER ROLE vikas CREATEDB;
ALTER ROLE vishal CREATEDB;

-- Create role/user with password and with createdb
CREATE ROLE arjun WITH PASSWORD 'arjun1234' CREATEDB;
CREATE ROLE vikas WITH PASSWORD 'vikas1234' CREATEDB;
CREATE ROLE vishal WITH PASSWORD 'vishal1234' CREATEDB;

-- Create role/user with password, createdb and with createrole
CREATE ROLE arjun WITH PASSWORD 'arjun1234' CREATEDB CREATEROLE;
CREATE ROLE vikas WITH PASSWORD 'vikas1234' CREATEDB CREATEROLE;
CREATE ROLE vishal WITH PASSWORD 'vishal1234' CREATEDB CREATEROLE;
-- ===================================================================

-- ===================================================================
-- # RENAME ROLE/USER
ALTER ROLE arjun RENAME TO arjun_prajapati;
ALTER ROLE vikas RENAME TO vikas_prajapati;
ALTER ROLE vishal RENAME TO vishal_yadav;
-- ===================================================================

-- ===================================================================
-- # CHANGE ROLE'S/USER'S PASSWORD
ALTER ROLE arjun WITH PASSWORD 'arjun_prajapati1234';
ALTER ROLE vikas WITH PASSWORD 'vikas_prajapati1234';
ALTER ROLE vishal WITH PASSWORD 'vishal_yadav1234';
-- ===================================================================

-- ===================================================================
-- # DELETE ROLE/USER
DROP ROLE arjun;
DROP ROLE vikas;
DROP ROLE vishal;

-- # DELETE ROLE/USER IF EXISTS
DROP ROLE IF EXISTS arjun;
DROP ROLE IF EXISTS vikas;
DROP ROLE IF EXISTS vishal;
-- ===================================================================

