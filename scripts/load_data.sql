--load_data.sql
//Create a FILE FORMAT that is type CSV that can be used to load the CSV files.

create or replace file format CSV_File_Format
type = 'CSV'--csv is used for any flat file (tsv, pipe-separated, etc)
--field_delimiter = if there was '|' --pipes as column separators
skip_header = 1 --one header row to skip
;

//Loading the data from CSV stored at My_Stage in to the sales_data table.

copy into sales_data
from @"SALES_PERFORMANCE"."PUBLIC"."MY_STAGE"
files = ('sales_data.csv')
file_format = (format_name=CSV_File_Format);

//testing table to make sure data is transfered successfully.
select count(*) 
from sales_data;

select *
from sales_data
order by order_id
desc limit 10;

select *
from sales_data
order by order_id
asc limit 10;
