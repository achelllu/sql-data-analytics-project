/* 
==================================================================================
Part to Whole Analysis
==================================================================================
Purpose :
  Analyze how an individual part is performing compared to the overall,
  allowing us to understand which category has the greatest impact on the business.

Using CTE
SQL Functions Used:
    - SUM(), Window Function : SUM()
    - CONCAT(), ROUND(), CAST()
    - GROUP BY, ORDER BY
==================================================================================
*/

-- Which categories contribute the most overall sales ?
WITH category_sales AS (          -- CTE
	SELECT 
		category,
		SUM(sales_amount) AS total_sales
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
	GROUP BY category
)
SELECT
	category,
	total_sales,
	SUM(total_sales) OVER() overall_sales,
	CONCAT(ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER()) * 100, 2), '%') AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;
