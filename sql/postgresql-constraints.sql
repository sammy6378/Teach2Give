-- Section 13. PostgreSQL Constraints
-- Primary key – illustrate how to define a primary key when creating a table or adding a primary key to an existing table.
-- Foreign key – show you how to define foreign key constraints when creating a new table or adding foreign key constraints for existing tables.
-- DELETE CASCADE – show you how to automatically delete rows in child tables when the corresponding rows in the parent table are deleted.
-- CHECK constraint – add logic to check value based on a Boolean expression.
-- UNIQUE constraint – ensure that values in a column or a group of columns are unique across the table.
-- NOT NULL constraint – ensure values in a column are not NULL.
-- DEFAULT constraint – specify a default value for a column using the DEFAULT constraint.


-- -- Primary Key
-- -- syntax
CREATE TABLE table_name (
    column1 datatype PRIMARY KEY,
    column2 datatype,
    ...
);

-- -- example
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);


-- -- Foreign Key
-- -- syntax
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    FOREIGN KEY (column_name) REFERENCES parent_table (parent_column)
);

-- -- example
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);


-- -- DELETE CASCADE
-- -- syntax
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    FOREIGN KEY (column_name) REFERENCES parent_table (parent_column) ON DELETE CASCADE
);

-- -- example
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE
);



-- -- CHECK constraint
-- -- syntax
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    CHECK (condition)
);

-- -- example
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT CHECK (stock >= 0)
);



-- -- UNIQUE constraint
-- -- syntax
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    ...
    UNIQUE (column_name)
);

-- -- example
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);



-- -- NOT NULL constraint
-- -- syntax
CREATE TABLE table_name (
    column1 datatype NOT NULL,
    column2 datatype,
    ...
);

-- -- example
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(50),
    phone VARCHAR(20)
);




-- -- DEFAULT constraint
-- -- syntax
CREATE TABLE table_name (
    column1 datatype DEFAULT default_value,
    column2 datatype,
    ...
);


-- -- example
CREATE TABLE invoices (
    invoice_id SERIAL PRIMARY KEY,
    customer_id INT,
    invoice_date DATE DEFAULT CURRENT_DATE,
    total_amount DECIMAL(10, 2) DEFAULT 0.00
);
