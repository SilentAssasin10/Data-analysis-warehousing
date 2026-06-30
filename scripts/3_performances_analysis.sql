use Datawarehouse;
Go
/* Analyze the yearly performance of products by comparing
their sales to both the avergae sales performance of the product and the previous year's sales
*/
--select * from gold.fact_sales;
with my_cte as(
select
year(order_date) as order_date,
product_name,
sum(sales_amount) as yearly_sales,
sum(quantity) as total_quantity
from gold.fact_sales f
left join
gold.dim_products p
on f.product_key = p.product_key
where order_date is not null
group by year(order_date), product_name
)

select 
order_date,
product_name,
yearly_sales,
avg(yearly_sales) over(partition by product_name) as avg_sales,
yearly_sales - avg(yearly_sales) over(partition by product_name) as sales_diff,
case when yearly_sales - avg(yearly_sales) over(partition by product_name) < 0 then 'Below Avg'
	 when yearly_sales - avg(yearly_sales) over(partition by product_name) > 0 then 'Above Avg'
		  else 'Avg'
	end as avg_change,
isnull(yearly_sales - lag(yearly_sales) over(partition by product_name order by order_date),0) as yearly_change,
case when isnull(yearly_sales - lag(yearly_sales) over(partition by product_name order by order_date),0) < 0 then 'Below exp'
	 when isnull(yearly_sales - lag(yearly_sales) over(partition by product_name order by order_date),0) > 0 then 'Above exp'
		  else 'Product Launch'
	end as yearly_change_type
from my_cte
order by product_name, order_date
