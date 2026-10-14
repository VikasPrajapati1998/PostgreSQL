-- # ===================== AND and OR Operators ============================
/*
- AND and OR operators are used to combine multiple conditions to narrow down selected data.
- AND is stand for logical conjunction/conjunctive operator, OR is stand for logical disjunction.
*/

SELECT * FROM COMPANY
WHERE AGE >= 25 OR SALARY >=65000;

SELECT * FROM COMPANY
WHERE AGE >= 25 AND SALARY <=65000;
