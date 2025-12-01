/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - Identify the earliest and latest dates (boundaries)
    - Uderstand the scope of data and the timespan
    - MIN/MX [Date Dimension] : MIN order_date, MAX order_date, MIN birthdate

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Find the date of the first and last order
SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS order_range_months
FROM gold.fact_sales

-- Find the youngest and the oldest customer
SELECT
MIN(birthdate) AS oldest_birthdate,
DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age,
MAX(birthdate) AS younges_birthdate
FROM gold.dim_customers
