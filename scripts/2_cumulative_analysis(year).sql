use Datawarehouse;
Go

--select * from gold.fact_sales

select 
order_date,
total_sales,
sum(total_sales) over(partition by year(order_date) order by order_date) as cumulative_sales
from(

select
datetrunc(month, order_date) as order_date,
sum(sales_amount) as total_sales
from gold.fact_sales
where order_date is not null
group by datetrunc(month, order_date)
)t
