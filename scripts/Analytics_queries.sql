--Analytcs_queries.sql
// Top five products by total sale
Select
    product_name,
    Sum(total_sales) AS total_sales
from sales_data
Group by product_name
Order by total_sales DESC
Limit 5;

//Monthly trend of sales

Select
    To_char(order_date,'YYYY-MM') AS month,
    sum(total_sales) AS monthly_total
From sales_data
Group by month
Order by month;

Create or replace view regional_sales_summary AS
Select
    region,
    count(distinct order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    SUM(total_sales) AS total_revenue,
    Round(AVG(total_sales),2) AS avg_revenue_per_order
From sales_data
Group by region
order by total_revenue DESC;

select * from regional_sales_summary;
