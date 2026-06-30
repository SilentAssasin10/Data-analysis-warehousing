## Performance Analysis

### Objective

This analysis evaluates the yearly performance of each product by comparing its annual sales with its historical average and the previous year's performance.

### Analysis Performed

The script aggregates yearly sales for every product and applies window functions to calculate the product's average yearly sales and Year-over-Year (YoY) sales difference. Based on these comparisons, each product is classified as performing **Above Average**, **Below Average**, or **Average**, while YoY changes identify whether sales have improved, declined, or represent the product's first recorded year.

### Key SQL Concepts

* `CTE` for yearly product-level aggregation.
* `AVG() OVER(PARTITION BY product_name)` to calculate historical average sales.
* `LAG()` to compare current year sales with the previous year.
* `CASE` expressions to classify product performance.
* `LEFT JOIN` to combine sales data with product information.

### Business Value

This analysis helps identify high-performing and underperforming products, measure long-term sales trends, and evaluate yearly growth. These insights support pricing strategies, inventory planning, marketing campaigns, and product portfolio decisions.
