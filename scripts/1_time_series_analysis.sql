USE Datawarehouse;
Go

-- select the sales amount by grouped year and month
SELECT 
	YEAR(order_date) as order_date_year,
	MONTH(order_date) as order_date_month,
	SUM(sales_amount) as total_sales,
	COUNT(DISTINCT customer_key) as total_customers
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date) 
ORDER BY YEAR(order_date), MONTH(order_date);

-- truncate the whole dataset into distinct years and group them

SELECT 
	DATETRUNC(YEAR, order_date) as order_date,
	SUM(sales_amount) as total_sales,
	COUNT(DISTINCT customer_key) as total_customers
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(YEAR, order_date) 
ORDER BY DATETRUNC(YEAR, order_date);

-- same, group by month and truncate the data

SELECT 
	DATETRUNC(MONTH, order_date) as order_date,
	SUM(sales_amount) as total_sales,
	COUNT(DISTINCT customer_key) as total_customers
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH, order_date) 
ORDER BY DATETRUNC(MONTH, order_date);

-- varchar date format

SELECT 
	FORMAT(order_date, 'yyyy-MMM') as order_date,
	SUM(sales_amount) as total_sales,
	COUNT(DISTINCT customer_key) as total_customers
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');
