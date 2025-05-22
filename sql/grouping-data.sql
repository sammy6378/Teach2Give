

-- GROUPING DATA
-- Group By – divide rows of a result set into groups and optionally apply an aggregate function to each group.
-- Having – apply conditions to groups, which allow you to filter groups.

-- Group By
-- -- syntax
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1;

-- example
SELECT country, COUNT(customer_id)
FROM customers
GROUP BY country;


-- HAVING
-- -- syntax
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
HAVING condition;

-- -- example
SELECT country, COUNT(customer_id)
FROM customers
GROUP BY country
HAVING COUNT(customer_id) > 5;