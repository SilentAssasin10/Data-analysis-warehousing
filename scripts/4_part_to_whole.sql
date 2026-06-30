Use Datawarehouse;
Go

-- which categories contribute the most in the sales
with product_sales as
(
select
product_category,
sum(sales_amount) as total_sales,
sum(quantity) as total_orders
from gold.fact_sales f
left join gold.dim_products p
on f.product_key = p.product_key
group by product_category
)

select 
product_category,
total_sales,
sum(total_sales) over() as overall_sales,
concat(round((cast(total_sales as float) / sum(total_sales) over()) * 100,2), '%') as percentage_overall
from product_sales
order by total_sales desc
