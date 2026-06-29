use Datawarehouse;
Go

--select * from gold.fact_sales;

select
order_date,
sales_by_month,
average_sales_per_month,
avg(average_sales_per_month) over(partition by year(order_date) order by order_date) as running_avg_transaction_value
from
(
select
datetrunc(month, order_date) as order_date,
sum(sales_amount) as sales_by_month,
avg(sales_amount) as average_sales_per_month
from gold.fact_sales
where order_date is not null
group by datetrunc(month, order_date)
)t
