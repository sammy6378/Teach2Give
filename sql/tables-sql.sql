-- databases

-- check available databases
SELECT datname FROM pg_database WHERE datistemplate = false;

-- check current tables in the current database
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';




-- tables

-- creating tables
-- syntax
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
);

-- example
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- creating a table with constraints
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- renaming a table
-- syntax
ALTER TABLE table_name RENAME TO new_table_name;
-- example
ALTER TABLE customers RENAME TO clients;

-- dropping a table
-- syntax
DROP TABLE table_name;
-- example
DROP TABLE orders;

-- inserting data into tables
-- syntax
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);
-- example
INSERT INTO customers (customer_id, first_name, last_name, email, phone)
VALUES (1, 'John', 'Doe', 'johndoe@gmail.com', '123-456-7890');

-- inserting multiple rows
-- syntax
INSERT INTO table_name (column1, column2, ...)
VALUES (value1a, value2a, ...),
       (value1b, value2b, ...),
       ...; 
-- example
INSERT INTO customers (customer_id, first_name, last_name, email, phone)
VALUES (2, 'Jane', 'Smith', 'janesmith@gmail.com', '987-654-3210'),
       (3, 'Alice', 'Johnson', 'alicejohnson@gmail.com', '555-555-5555');

-- updating data in tables
-- syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
-- example
UPDATE customers
SET email = 'janesmith254@gmail.com'
WHERE customer_id = 2;

-- adding a new column
-- syntax
ALTER TABLE table_name
ADD column_name datatype;

-- example
ALTER TABLE customers
ADD address VARCHAR(255);

-- renaming a column
-- syntax
ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;
-- example
ALTER TABLE customers
RENAME COLUMN phone TO phone_number;

-- deleting a column
-- syntax
ALTER TABLE table_name
DROP COLUMN column_name;

-- example
ALTER TABLE customers
DROP COLUMN address;

-- selecting data from tables
-- syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- example
SELECT first_name, last_name, email
FROM customers
WHERE customer_id = 1;

-- selecting all columns
-- syntax
SELECT *
FROM table_name;
-- example
SELECT *
FROM customers;

-- selecting distinct values
-- syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;
-- example
SELECT DISTINCT email
FROM customers;

-- ordering results
-- syntax
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
-- example
SELECT first_name, last_name
FROM customers
ORDER BY last_name ASC, first_name DESC;

-- limiting results
-- syntax
SELECT column1, column2, ...
FROM table_name
LIMIT number_of_rows;
-- example  
SELECT first_name, last_name
FROM customers
LIMIT 5;

-- filtering results
-- syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND|OR condition2 ...;

-- example
SELECT first_name, last_name
FROM customers
WHERE email LIKE '%gmail.com'
AND phone_number IS NOT NULL;

-- dropping a table
-- syntax
DROP TABLE table_name;
-- example
DROP TABLE customers;

-- creating a temporary table
-- syntax
CREATE TEMPORARY TABLE temp_table_name (
    column1 datatype,
    column2 datatype,
    ...
);

-- example
CREATE TEMPORARY TABLE temp_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- inserting data into a temporary table
-- syntax
INSERT INTO temp_table_name (column1, column2, ...)
VALUES (value1, value2, ...);
-- example
INSERT INTO temp_orders (order_id, customer_id, order_date, total_amount)
VALUES (1, 1, '2023-10-01', 100.00),
       (2, 2, '2023-10-02', 200.00);

    --    copying data from one table to another
-- syntax
INSERT INTO target_table (column1, column2, ...)
SELECT column1, column2, ...
FROM source_table
WHERE condition;
-- example
INSERT INTO temp_orders (order_id, customer_id, order_date, total_amount)
SELECT order_id, customer_id, order_date, total_amount
FROM orders
WHERE order_date >= '2023-01-01';

-- dropping a temporary table
-- syntax
DROP TEMPORARY TABLE temp_table_name;
-- example
DROP TEMPORARY TABLE temp_orders;

-- creating a view
-- syntax
CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;
-- example
CREATE VIEW customer_emails AS
SELECT first_name, last_name, email
FROM customers
WHERE email IS NOT NULL;

-- selecting data from a view
-- syntax
SELECT column1, column2, ...
FROM view_name;
-- example
SELECT first_name, last_name
FROM customer_emails;

-- dropping a view
-- syntax
DROP VIEW view_name;
-- example
DROP VIEW customer_emails;

-- creating an index
-- syntax
CREATE INDEX index_name
ON table_name (column1, column2, ...);
-- example
CREATE INDEX idx_last_name
ON customers (last_name);

-- dropping an index
-- syntax
DROP INDEX index_name;
-- example
DROP INDEX idx_last_name;

-- creating a unique index
-- syntax
CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);
-- example
CREATE UNIQUE INDEX idx_email
ON customers (email);
