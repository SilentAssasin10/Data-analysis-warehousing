# Data analysis & warehousing

## Overview

This project provides analytical reporting and business intelligence dashboards built on top of a SQL Server Data Warehouse.

The dashboards are designed to analyze:

* Sales performance over time
* Customer behavior and demographics
* Product performance
* Revenue trends
* Geographic insights

The project uses the Gold Layer of the Data Warehouse as its data source.

---

## Prerequisites

This project depends on the SQL Data Warehouse project.

Before using this analytics solution, you must first set up and populate the warehouse database.

### Required Project

SQL Data Warehouse Repository:

https://github.com/SilentAssasin10/sql-data-warehouse

---

## Setup Instructions

### Step 1: Clone the Data Warehouse Repository

```bash
git clone https://github.com/SilentAssasin10/sql-data-warehouse.git
```

### Step 2: Create the Database

Open SQL Server Management Studio (SSMS) and execute the database setup scripts from the warehouse repository.

### Step 3: Load the Bronze Layer

Execute:

```sql
EXEC bronze.load_bronze;
```

This loads CRM and ERP source data into the Bronze Layer.

### Step 4: Load the Silver Layer

Execute:

```sql
EXEC silver.load_silver;
```

This performs data cleansing, standardization, validation, and business rule transformations.

### Step 5: Build the Gold Layer

Execute the Gold Layer scripts provided in the warehouse project.

This creates:

* Customer Dimension
* Product Dimension
* Sales Fact Table

The analytics project consumes these Gold Layer objects.

---

## Data Architecture

CRM + ERP Source Files
↓
Bronze Layer
↓
Silver Layer
↓
Gold Layer
↓
Power BI Analytics

---

## Gold Layer Objects Used

### Dimension Tables

* gold.dim_customers
* gold.dim_products

### Fact Table

* gold.fact_sales

These objects serve as the primary source for all analytical reports and dashboard visualizations.

---

## Key Business Metrics

The dashboard provides insights into:

### Sales Analytics

* Total Revenue
* Sales Trends
* Monthly Performance
* Year-over-Year Growth

### Customer Analytics

* Total Customers
* Customer Distribution
* Demographic Analysis

### Product Analytics

* Product Performance
* Category Performance
* Revenue by Product Line

---

## Technologies Used

* SQL Server
* SQL Server Management Studio (SSMS)
* T-SQL
* Data Warehousing
* Star Schema Modeling
* Power BI

---

## Project Relationship

This repository contains only the reporting and analytical layer.

The underlying data warehouse is maintained separately in the SQL Data Warehouse project.

Data Flow:

Source Systems
→ Data Warehouse
→ Gold Layer
→ Power BI Reports

---

## Author

Arkapravo Roy

Data Engineering & Analytics Portfolio Project
