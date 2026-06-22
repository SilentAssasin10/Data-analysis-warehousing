# Time series Analysis

## Objective

The purpose of this analysis is to understand how key business metrics change over time. Rather than looking at individual transactions, the data is aggregated across different time periods to identify trends, growth patterns, seasonality, and customer behavior.

---

## Business Questions Answered

* Is revenue increasing or decreasing over time?
* How does customer activity change across months and years?
* Are there seasonal sales patterns?
* Which periods show strong or weak business performance?
* Is customer growth aligned with revenue growth?

---

## Analysis Approaches

### 1. Year and Month Breakdown

The data is grouped by both year and month to provide a detailed view of business performance.

Metrics analyzed:

* Total Sales
* Distinct Customers

This level of granularity helps identify monthly fluctuations, seasonal trends, and periods of growth or decline.

---

### 2. Yearly Trend Analysis

Using `DATETRUNC(YEAR, order_date)`, all transactions within the same year are aggregated into a single record.

Purpose:

* Measure annual business growth.
* Compare performance between years.
* Identify long-term trends.

Example insights:

* Revenue growth year-over-year.
* Customer acquisition trends.
* Business expansion or contraction.

---

### 3. Monthly Trend Analysis

Using `DATETRUNC(MONTH, order_date)`, transactions are grouped into monthly periods.

Purpose:

* Analyze short-term performance.
* Detect recurring monthly patterns.
* Monitor customer engagement and sales activity.

Example insights:

* Seasonal demand.
* Promotional campaign impact.
* Monthly growth rates.

---

### 4. Formatted Time-Series Reporting

The `FORMAT(order_date, 'yyyy-MMM')` function converts dates into a business-friendly format such as:

* 2023-Jan
* 2023-Feb
* 2023-Mar

Purpose:

* Improve report readability.
* Create dashboard-ready outputs.
* Present chronological business trends clearly.

---

## Key SQL Concepts Used

### Aggregation Functions

Used to summarize business metrics:

* `SUM()` for total sales.
* `COUNT(DISTINCT ...)` for unique customers.

### Date Functions

Used to analyze data at different time granularities:

* `YEAR()`
* `MONTH()`
* `DATETRUNC()`
* `FORMAT()`

### Grouping

`GROUP BY` is used to aggregate transactions into meaningful time periods.

---

## Business Value

Changes Over Time Analysis transforms raw transactional data into meaningful trends. It allows decision-makers to monitor business performance, understand customer behavior, identify growth opportunities, and make data-driven strategic decisions.
