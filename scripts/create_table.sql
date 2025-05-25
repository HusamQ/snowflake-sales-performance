--create_table.sql
// Switch role to sysadmin
use role sysadmin;

//create and setup my stage where data files are uploaded to.
CREATE OR REPLACE STAGE my_stage;

//Create database for Sales Performance Analysis
create database Sales_performance;

//Create Sales_Date table 
Create or replace table Sales_Data(
order_id string,
customer_id string,
order_date date,
product_name string,
category string,
Region string,
quantity integer,
unit_price float,
total_sales float
);
