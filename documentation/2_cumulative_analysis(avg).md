## Cumulative Analysis

### Objective

Cumulative Analysis is used to measure business growth over time by continuously accumulating or averaging metrics as new time periods are reached. Unlike period-by-period analysis, it provides a progressive view of business performance.

### Analysis Performed

This script calculates the average transaction value for each month and then computes a running average within each calendar year using SQL window functions.

### Key SQL Concepts

* `DATETRUNC()` to aggregate transactions at the monthly level.
* `AVG()` to calculate the average transaction value per month.
* `AVG() OVER (PARTITION BY YEAR(order_date) ORDER BY order_date)` to compute the cumulative average month by month while restarting the calculation at the beginning of each year.

### Business Value

This analysis helps track how the average transaction value evolves throughout the year. It enables businesses to identify improving or declining customer spending patterns, monitor yearly performance, and compare trends across different years.
