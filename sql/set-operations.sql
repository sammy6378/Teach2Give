
-- Section 5. Set Operations
-- Union – combine result sets of multiple queries into a single result set.
-- Union All – combine result sets of multiple queries into a single result set, including duplicates.
-- Intersect – combine the result sets of two or more queries and return a single result set containing rows that appear in both result sets.
-- Except – return the rows from the first query that do not appear in the output of the second query.


-- UNION
-- syntax
SELECT column1, column2, ...
FROM table1
UNION
SELECT column1, column2, ...
FROM table2;
-- example
SELECT first_name, last_name
FROM customers
UNION
SELECT first_name, last_name
FROM employees;

-- UNION ALL
-- syntax
SELECT column1, column2, ...
FROM table1
UNION ALL
SELECT column1, column2, ...
FROM table2;
-- example
SELECT first_name, last_name
FROM customers
UNION ALL
SELECT first_name, last_name
FROM employees;

-- INTERSECT
-- syntax
SELECT column1, column2, ...
FROM table1
INTERSECT
SELECT column1, column2, ...
FROM table2;
-- example
SELECT first_name, last_name
FROM customers
INTERSECT
SELECT first_name, last_name
FROM employees;

-- EXCEPT
-- syntax
SELECT column1, column2, ...
FROM table1
EXCEPT
SELECT column1, column2, ...
FROM table2;
-- example
SELECT first_name, last_name
FROM customers
EXCEPT
SELECT first_name, last_name
FROM employees;
