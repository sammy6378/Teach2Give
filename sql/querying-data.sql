-- Section 1. Querying Data
-- Select – show you how to query data from a single table.
-- Column aliases – learn how to assign temporary names to columns or expressions within a query.
-- Order By – guide you on how to sort the result set returned by a query.
-- Select Distinct  – show you how to remove duplicate rows from the result set.


--  SELECT
--  -- syntax
SELECT column1, column2, ...
FROM table_name;
--  -- example
SELECT first_name, last_name
FROM customers;

--  -- selecting all columns
--  -- syntax
SELECT *
FROM table_name;

--  -- example
SELECT *
FROM customers;

--  -- selecting distinct values
--  -- syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;

--  -- example
SELECT DISTINCT email
FROM customers;

--  -- selecting with column aliases
--  -- syntax
SELECT column1 AS alias1, column2 AS alias2, ...
FROM table_name;

--  -- example
SELECT first_name AS "First Name", last_name AS "Last Name"
FROM customers;

--  -- selecting with expressions
--  -- syntax
SELECT expression AS alias
FROM table_name;

--  -- example
SELECT first_name || ' ' || last_name AS "Full Name"
FROM customers;

--  -- selecting with functions
--  -- syntax
SELECT function(column_name) AS alias
FROM table_name;

--  -- example
SELECT COUNT(*) AS "Total Customers"
FROM customers;

--  -- selecting with multiple columns
--  -- syntax
SELECT column1, column2, ...
FROM table_name;

--  -- example
SELECT first_name, last_name, email
FROM customers;

--  -- selecting with multiple expressions
--  -- syntax
SELECT expression1, expression2, ...
FROM table_name;

--  -- example
SELECT first_name || ' ' || last_name AS "Full Name", email
FROM customers;

--  -- selecting with multiple functions
--  -- syntax
SELECT function1(column_name1) AS alias1, function2(column_name2) AS alias2, ...
FROM table_name;

--  -- example
SELECT COUNT(*) AS "Total Customers", AVG(age) AS "Average Age"
FROM customers;

--  -- selecting with multiple columns and expressions
--  -- syntax
SELECT column1, expression1, column2, expression2, ...
FROM table_name;

--  -- example
SELECT first_name, last_name, email, first_name || ' ' || last_name AS "Full Name"
FROM customers;


--  -- selecting with multiple columns and functions
--  -- syntax
SELECT column1, function(column_name1) AS alias1, column2, function(column_name2) AS alias2, ...
FROM table_name;

--  -- example
SELECT first_name, last_name, email, COUNT(*) AS "Total Customers"
FROM customers
GROUP BY first_name, last_name, email;

--  -- selecting with multiple expressions and functions
--  -- syntax
SELECT expression1, function(column_name1) AS alias1, expression2, function(column_name2) AS alias2, ...
FROM table_name;

--  -- example
SELECT first_name || ' ' || last_name AS "Full Name", COUNT(*) AS "Total Customers"
FROM customers
GROUP BY first_name, last_name;

--  -- selecting with multiple columns, expressions, and functions
--  -- syntax
SELECT column1, expression1, function(column_name1) AS alias1, column2, expression2, function(column_name2) AS alias2, ...
FROM table_name;

--  -- example
SELECT first_name, last_name, email, COUNT(*) AS "Total Customers", first_name || ' ' || last_name AS "Full Name"
FROM customers
GROUP BY first_name, last_name, email;