-- # ===================== LIKE Clause ============================
/*
- LIKE Operator is used to match text values against a pattern using wildcards. 
If the search expression can be matched to the pattern expression, the LIKE Operator will return true, which is 1.
- There are two wildcards used in conjuction with the LIKE operator
	- Percent sign (%): The percentage sign represents zero, one, or multiple numbers or characters.
	- Underscore (_): The underscore represents a single number or character.
	- These symbols can be used in combinations.
- If either of these two signs is not used in conjunction with the LIKE clause, then the LIKE acts like the equals operator.
- Syntax:
SELECT FROM table_name
WHERE column LIKE <pattern>;

Pattern:
'XXXX%'
'%XXXX%'
'XXXX_'
'_XXXX'
'_XXXX_'
*/

SELECT * FROM COMPANY;

SELECT * FROM COMPANY
WHERE FIRST_NAME LIKE 'A___n%';

SELECT * FROM COMPANY
WHERE FIRST_NAME LIKE 'P%';


SELECT * FROM COMPANY
WHERE FIRST_NAME LIKE 'P%' AND LAST_NAME LIKE '____a';

SELECT * FROM COMPANY
WHERE FIRST_NAME::TEXT LIKE '%k%';

SELECT * FROM COMPANY 
WHERE MOBILE_NUMBER::TEXT LIKE '+91_%_7';