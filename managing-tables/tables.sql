
-- creating table example
CREATE TABLE IF NOT EXISTS example (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT CHECK (age >= 0),
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- adding a new column to the existing table
ALTER TABLE example
ADD COLUMN address VARCHAR(255);

-- renaming a column in the existing table
ALTER TABLE example
RENAME COLUMN address TO location;

-- dropping a column from the existing table
ALTER TABLE example
DROP COLUMN location;

-- changing the data type of a column
ALTER TABLE example
ALTER COLUMN age TYPE SMALLINT;

-- renaming the table
ALTER TABLE example
RENAME TO user_info;

-- add data to the table
INSERT INTO user_info (name, age, email)
VALUES
('John Doe', 30, 'johndoe@gmail.com'),
('Jane Smith', 25, 'janesmith@gmail.com'),
('Alice Johnson', 28, 'alicejohnson@gmail.com')


-- truncating the table - removes all rows
-- but keeps the structure intact
TRUNCATE TABLE user_info;


-- dropping the table
DROP TABLE IF EXISTS user_info;


-- creating a temporary table - only exists during the session
-- and is automatically dropped at the end of the session
CREATE TEMP TABLE temp_user_info (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT CHECK (age >= 0),
    email VARCHAR(255) UNIQUE NOT NULL
);

-- copying table structure without data
CREATE TABLE new_user_info (LIKE user_info INCLUDING ALL);

-- copying table structure with data
-- purposes
-- helps in creating a backup of the table
-- or creating a new table with the same structure
CREATE TABLE new_user_info AS
SELECT * FROM user_info;