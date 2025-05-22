-- Section 6. Grouping sets, Cubes, and Rollups
-- Grouping Sets  – generate multiple grouping sets in reporting.
-- Cube – define multiple grouping sets that include all possible combinations of dimensions.
-- Rollup – generate reports that contain totals and subtotals.




-- -- -- GROUPING SETS
-- -- syntax
SELECT column1, column2, ...
FROM table_name
GROUP BY GROUPING SETS ( (column1, column2), (column1), (column2) );
-- -- example
SELECT country, city, SUM(sales)
FROM customers
GROUP BY GROUPING SETS ( (country, city), (country), (city) );


-- -- -- CUBE
-- -- syntax
SELECT column1, column2, ...
FROM table_name
GROUP BY CUBE (column1, column2);
-- -- example
SELECT country, city, SUM(sales)
FROM customers
GROUP BY CUBE (country, city);


-- -- -- ROLLUP
-- -- syntax
SELECT column1, column2, ...
FROM table_name
GROUP BY ROLLUP (column1, column2);
-- -- example
SELECT country, city, SUM(sales)
FROM customers
GROUP BY ROLLUP (country, city);