-- transformation.sql
// Example of a view to calculate monthly sales by region
create or replace view monthly_sales_summary as
Select
    To_char(order_date, 'YYYY-MM') AS order_month,
    region,--
    SUM(total_sales) AS total_sales,
    Sum(quantity) AS total_quantity
    from sales_Data
    Group by order_month, region;


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
    To_char(order_date,'YYYY-MM' AS month,
    sum(total_sales)     AS monthly_total
From sales_data
Group by month
Order by month;
