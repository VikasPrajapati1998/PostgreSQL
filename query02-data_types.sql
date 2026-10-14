/* 
# DATA TYPES
## NUMERIC TYPES
Numeric types consist of two-byte, four-byte, and eight-byte integers, 
four-byte and eight-byte floating-point numbers, and selectable-precision 
decimals. 
1. smallint(2 bytes): small range
2. integer(4 bytes)
3. bigint(8 bytes): large-range integer

4. decimal(variable): user-specified precision, exact
5. numeric(variable): user-specified precision, exact

6. real(4 byte): variable-precision, inexact
7. double precision(8 bytes): variable-precision, inexact

8. smallserial(2 bytes): small autoincrement integer
9. serial(4 bytes): autoincrement integer
10. bigserial(8 bytes): large autoincrement integer

## CHARACTER TYPES
1. character varying(n), varchar(n): variable-length with limit
2. character(n), char(n): fixed-length, blank padded
3. text: variable unlimited length

## BINARY DATA TYPES
1. bytea: 1 or 4 bytes, actual binary string, variable-length string

## DATE/TIME TYPES
1. timestamp[(p)](8 byte): both data and time without time zone
2. TIMESTAMPZ(8 bytes): both date and time with time zone
3. date(4 byte): date (no time)
4. time(8 bytes): time, without time zone
5. time(12 bytes): time, with time zone
6. interval(12 bytes): time interval

## BOOLEAN TYPE
1. boolean(1 byte)

## ENUMERATED TYPE
CREATE TYPE week AS ENUM ('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sum');

## GEOMETRIC TYPE
1. point: Point on a plane
2. line: Infinite line
3. lseg: Finite line segment
4. box: Rectangualr box
5. path: Close path(polygon, hexagon, etc)
6. polygon: Polygon
7. circle: Circle

## NETWORK ADDRESS TYPE
1. cidr: IPv4 and IPv6 network
2. inet: IPv4 and IPv6 hosts and networks
3. macaddr: MAC Address

## TEXT SEARCH TYPE
This type supports full text search, which is the activity of searching through a 
collection of natural-language documents to locate those that best match a query.
1. tsvector: This is a sorted list of distinct words that have been normalized to 
merge different variants of the same word, called as "lexemes".
2. tsquery: This stores lexemes that are to be searched for, and combines them 
honoring the Boolean operations & (AND), | (OR), and ! (NOT).
Parentheses can be used to enforce grouping of the operations. 

## UUID: Universally Unique Identifiers is written as a sequence of lower-case
hexadecimal digits, in several groups separated by hyphens, specifically a group
of eight digits, followed by three groups of four digits, followed by a group of 
12 digits, for a total of 32 digits representing the 128 bits.
e.g. 550e8400-e29b-41d4-a716-446655440000

## ARRAY TYPES
The opportunity to define a column of a table as a variable length multidimensional array.
Arrays of any built-in or user-defined based type, enum type, or composite type can be created.
*/

-- ARRAY
CREATE TABLE monthly_savings (
	name text,
	saving_per_quarter integer[],
	scheme text[][]
);

-- OR : Using ARRAY
CREATE TABLE monthly_savings (
	name text,
	saving_per_quarter integer ARRAY[4],
	scheme text[][]
);

-- INSERTING VALUES
INSERT INTO monthly_savings
VALUES (
	Manisha,
	{20000, 14600, 23500, 13250},
	{
		{FD, MF}, 
		{FD, Property}
	}
);

-- ACCESSING ARRAYS
SELECT name FROM monthly_savings WHERE 
saving_per_quarter[2] > saving_per_quarter[4];


-- MODIFY ARRAY
UPDATE monthly_saving SET 
saving_per_quarter = '{25000, 24000, 27000, 28000}'
WHERE name='Manisha';

-- OR : Using ARRAY
UPDATE monthly_saving SET
saving_per_quarter = ARRAY[25000, 24000, 27000, 28000]
WHERE name='Manisha';


-- SEARCHING ARRAYS
SELECT * FROM monthly_savings WHERE 
saving_per_quarter[1] = 10000 OR
saving_per_quarter[2] = 10000 OR
saving_per_quarter[3] = 10000 OR
saving_per_quarter[4] = 10000;


-- OR
SELECT * FROM monthly_savings WHERE 10000 = ANY (saving_per_quarter);



/* 
## COMPOSITE TYPES
Represents a list of field names and their data types, i.e., structure of a
row or record of a table.
Composite values can be inserted as a literal constant, enclosing the field
values withing parentheses and separating them by commas.
*/
CREATE TYPE inventory_item AS (
	name text,
	supplier_id integer,
	price numeric
);
-- This data can be used in create tables
CREATE TABLE on_hand(
	item inventory_item,
	count integer
)

-- COMPOSITE VALUE INPUT
INSERT INTO on_hand VALUES (
	ROW ('fuzzy dice', 42, 1.99), 
	1000
);

-- ACCESSING COMPOSITE VALUE 
SELECT (item).name FROM on_hand WHERE (item).price > 9.99;

SELECT (on_hand.item).name FROM on_hand WHERE (on_hand.item).price > 9.99;

/*
## RANGE TYPES
Range types represent data types that uses a range of data. Range
type can be discrete ranges (e.g., all integer values 1 to 10) or
continuous ranges (e.g., any point in time between 10:00am and 11:00am).


## PSEUDO TYPES
The PSQL type system contains a number of special-purpose entries that are
collectively called pseudo-types. A pseudo-type cannot be used as a column
data type, but it can be used to declare a function's argument or result type.
*/

