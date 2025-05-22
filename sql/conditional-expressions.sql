-- Section 15. Conditional Expressions & Operators
-- CASE – show you how to form conditional queries with CASE expression.
-- COALESCE – return the first non-null argument. You can use it to substitute NULL by a default value.
-- NULLIF – return NULL if the first argument equals the second one.
-- CAST – convert from one data type into another e.g., from a string into an integer, from a string into a date.


-- -- -- CASE

-- -- syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE result
END;

-- -- example
SELECT first_name, last_name,
    CASE
        WHEN country = 'USA' THEN 'United States'
        WHEN country = 'CAN' THEN 'Canada'
        ELSE 'Other'
    END AS country_name
FROM customers;

-- -- -- COALESCE
-- -- syntax
COALESCE(expression1, expression2, ...);
-- -- example
SELECT first_name, last_name, COALESCE(email, 'No Email') AS email
FROM customers;


-- -- -- NULLIF
-- -- syntax
NULLIF(expression1, expression2);
-- -- example
SELECT first_name, last_name, NULLIF(email, 'No Email') AS email
FROM customers;

-- -- -- CAST
-- -- syntax
CAST(expression AS data_type);
-- -- example
SELECT first_name, last_name, CAST(order_date AS DATE) AS order_date
FROM orders;