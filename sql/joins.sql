
-- Section 3. Joining Multiple Tables
-- Joins – show you a brief overview of joins in PostgreSQL.
-- Table aliases – describes how to use table aliases in the query.
-- Inner Join– select rows from one table that have the corresponding rows in other tables.
-- Left Join – select rows from one table that may or may not have the corresponding rows in other tables.
-- Self-join – join a table to itself by comparing a table to itself.
-- Full Outer Join – use the full join to find a row in a table that does not have a matching row in another table.
-- Cross Join – produce a Cartesian product of the rows in two or more tables.
-- Natural Join – join two or more tables using implicit join conditions based on the common column names in the joined tables.

-- Joining tables


-- INNER JOIN
-- syntax
SELECT column1, column2, ...
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
-- example
SELECT customers.first_name, customers.last_name, orders.order_date
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- LEFT JOIN
-- syntax
SELECT column1, column2, ...
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
-- example
SELECT customers.first_name, customers.last_name, orders.order_date
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- RIGHT JOIN
-- syntax
SELECT column1, column2, ...
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
-- example
SELECT customers.first_name, customers.last_name, orders.order_date
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;

-- FULL OUTER JOIN
-- syntax
SELECT column1, column2, ...
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name;
-- example
SELECT customers.first_name, customers.last_name, orders.order_date
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;

-- CROSS JOIN
-- syntax
SELECT column1, column2, ...
FROM table1
CROSS JOIN table2;
-- example
SELECT customers.first_name, orders.order_date
FROM customers
CROSS JOIN orders;

-- self join
-- syntax
SELECT a.column1, b.column2, ...
FROM table_name a, table_name b
WHERE a.column_name = b.column_name;
-- example
SELECT a.first_name, b.first_name
FROM customers a, customers b
WHERE a.customer_id = b.customer_id;

-- NATURAL JOIN
-- syntax
SELECT column1, column2, ...
FROM table1
NATURAL JOIN table2;
-- example
SELECT customers.first_name, orders.order_date
FROM customers
NATURAL JOIN orders;

-- Table aliases
-- syntax
SELECT column1, column2, ...
FROM table_name AS alias_name;
-- example
SELECT c.first_name, c.last_name, o.order_date
FROM customers AS c
INNER JOIN orders AS o
ON c.customer_id = o.customer_id;
