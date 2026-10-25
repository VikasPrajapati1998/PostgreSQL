-- # ===================== SCHEMA ============================
/*
- A schema is a named collection of tables. A schema can also contain views, indexes, sequences, data types, operators, and functions. 
- Schemas are like folders in an operating system, but they can't contain other schemas inside them. 
- # Syntax:
CREATE SCHEMA name;

-- Drop Schema if it is empty
DROP SCHEMA name;

-- Drop Schema including all contained objects
DROP SCHEMA name CASCADE;

-- See All Existing Schemas
SELECT schema_name FROM information_schema.schemata;
*/

-- Create schema
CREATE SCHEMA IF NOT EXISTS School;

-- Create table
CREATE TABLE School.Class_1st (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    roll_number INT UNIQUE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    father_name TEXT NOT NULL,
    mother_name TEXT NOT NULL,
    dob DATE NOT NULL,
    email TEXT NOT NULL CHECK (email LIKE '%@gmail.com'),
    mobile VARCHAR(15) NOT NULL,
    address TEXT
);

-- Insert 20 records
INSERT INTO School.Class_1st
    (roll_number, first_name, last_name,
     father_name, mother_name, dob, email, mobile, address)
VALUES
(101, 'Aarav', 'Sharma', 'Rajesh Sharma', 'Sunita Sharma', '2012-01-15', 'aarav.sharma@gmail.com', '9876500001', 'Delhi'),
(102, 'Ananya', 'Verma', 'Amit Verma', 'Pooja Verma', '2012-03-22', 'ananya.verma@gmail.com', '9876500002', 'Noida'),
(103, 'Rohan', 'Gupta', 'Sanjay Gupta', 'Neha Gupta', '2012-05-10', 'rohan.gupta@gmail.com', '9876500003', 'Gurugram'),
(104, 'Priya', 'Singh', 'Vikram Singh', 'Kavita Singh', '2012-07-08', 'priya.singh@gmail.com', '9876500004', 'Delhi'),
(105, 'Arjun', 'Kumar', 'Manoj Kumar', 'Rekha Kumar', '2012-02-18', 'arjun.kumar@gmail.com', '9876500005', 'Faridabad'),
(106, 'Ishita', 'Mehta', 'Deepak Mehta', 'Anita Mehta', '2012-04-12', 'ishita.mehta@gmail.com', '9876500006', 'Ghaziabad'),
(107, 'Vivaan', 'Malhotra', 'Rakesh Malhotra', 'Shalini Malhotra', '2012-06-25', 'vivaan.malhotra@gmail.com', '9876500007', 'Delhi'),
(108, 'Saanvi', 'Yadav', 'Pankaj Yadav', 'Sunita Yadav', '2012-08-14', 'saanvi.yadav@gmail.com', '9876500008', 'Noida'),
(109, 'Aditya', 'Joshi', 'Nitin Joshi', 'Meena Joshi', '2012-09-03', 'aditya.joshi@gmail.com', '9876500009', 'Delhi'),
(110, 'Diya', 'Kapoor', 'Akhil Kapoor', 'Ritu Kapoor', '2012-11-19', 'diya.kapoor@gmail.com', '9876500010', 'Gurugram'),
(111, 'Kabir', 'Mishra', 'Ashok Mishra', 'Seema Mishra', '2012-01-28', 'kabir.mishra@gmail.com', '9876500011', 'Delhi'),
(112, 'Meera', 'Chopra', 'Rohit Chopra', 'Nisha Chopra', '2012-03-16', 'meera.chopra@gmail.com', '9876500012', 'Noida'),
(113, 'Reyansh', 'Saxena', 'Alok Saxena', 'Swati Saxena', '2012-05-29', 'reyansh.saxena@gmail.com', '9876500013', 'Ghaziabad'),
(114, 'Aadhya', 'Bansal', 'Kunal Bansal', 'Preeti Bansal', '2012-07-21', 'aadhya.bansal@gmail.com', '9876500014', 'Delhi'),
(115, 'Krishna', 'Agarwal', 'Suresh Agarwal', 'Mamta Agarwal', '2012-10-07', 'krishna.agarwal@gmail.com', '9876500015', 'Faridabad'),
(116, 'Myra', 'Sethi', 'Varun Sethi', 'Radhika Sethi', '2012-12-11', 'myra.sethi@gmail.com', '9876500016', 'Noida'),
(117, 'Dhruv', 'Arora', 'Gaurav Arora', 'Payal Arora', '2012-02-09', 'dhruv.arora@gmail.com', '9876500017', 'Delhi'),
(118, 'Pari', 'Jain', 'Mohit Jain', 'Richa Jain', '2012-04-30', 'pari.jain@gmail.com', '9876500018', 'Gurugram'),
(119, 'Atharv', 'Reddy', 'Praveen Reddy', 'Lakshmi Reddy', '2012-08-06', 'atharv.reddy@gmail.com', '9876500019', 'Delhi'),
(120, 'Kiara', 'Das', 'Suman Das', 'Madhuri Das', '2012-11-24', 'kiara.das@gmail.com', '9876500020', 'Noida');

-- Display all records
SELECT *
FROM School.Class_1st
ORDER BY id;

-- Drop Schema
DROP SCHEMA School CASCADE;

-- See All Existing Schemas
SELECT schema_name
FROM information_schema.schemata;
