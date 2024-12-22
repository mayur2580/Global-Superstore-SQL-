use new_schema;

-- Load Orders table into some SQL database from Global Superstore excel workbook
select * from orders;



-- Q) Show all records of Orders table
select * from orders;

-- Q) Show Order ID, Product ID, Product Name, Sales, and Profit 
SELECT 
    Order_ID, Product_ID, Product_Name, Sales, profit
FROM
    orders;

-- Q) Show all the records from country India
select * from orders 
where country = "india"; 

-- Q) Show all records with negative profit 
select * from orders 
where profit <= 0;

-- Q) Show all records of Chairs sub-category
select * from orders
where sub_category = "chairs";

-- Q) Show all records of Technology category from country India
SELECT 
    *
FROM
    orders
WHERE
    category = 'technology'
        AND country = 'india';

-- Q) Show all records from India having Critical order priority
select * from orders 
where order_priority = "critical";

-- Q) Show all the records from country India having loss
select * from orders 
where country = "india" and profit < 0 ;

-- Q) Show all records with decreasing order of Sales
select * from orders 
order by sales desc;

-- Q) Show all records with minimum Sales of 5000
select * from orders 
where sales >= 5000
order by sales asc;

-- Q) Show top 10 records by profit 
select * from orders 
order by profit desc
limit 10 ;

-- Q)Show 10 records with least sales value
select sales from orders 
order by sales asc
limit 10 ;

-- Q) Show the record with maximum sales but giving loss
select * from orders 
where profit < 0
order by sales desc; 

-- Q) Show all the records from country India and Pakistan
select * from orders
where country = "india" or "pakistan" ;

-- 2nd approach
select * from orders
where country = "india" or country = "pakistan" ;

-- Q) Show all the records from city Pune, Surat and Patna
select * from orders
where city = "pune" or "surat" or  "patna";

-- Q) Show all the records having sales in the range from 100 to 200
select * from orders
where  sales > 100 and sales < 200 ; 

-- 2nd approach




-- Q) Show all the records ordered in Jan 2024
select * from orders 
where order_date like "2024-01%" ;

-- 2nd approach
select * from orders ;
-- where order_date "2024-01-01"   "2024-01-31"   ;

-- Q) Show all records from city whose name starts with 'Z'
select * from orders
where city like "z%";

-- Q) Show all records from city whose name ends with 'pur'
select * from orders
where city like "%pur";

-- Q) Show all records from customers whose name starts with 'Jack'
select * from orders
where customer_name like "jack%";

-- Q) Show all records from customers whose name ends with 'son'
select * from orders
where customer_name  like "%son";

-- Q) Show all records from customers whose name contains 'x'
select * from orders
where customer_name  like "%x%";

-- Q) Show all records from customers whose name's second letter is 'h'
select * from orders
where customer_name  like "_h%";

-- Q) Show all records from customers whose name's second last letter is 'h'
select * from orders
where customer_name  like "%h_";

-- Q) Print name of all the cities
select distinct city from orders;

-- Q) Print name of all the Indian cities 
select distinct city, country from orders
where country = "india";

-- Q) Show all the records which are not yet shipped 
select * from orders
where ship_date = "" ;

-- Q) Show all the records which are shipped 
select * from orders
where ship_date like "%-%" ;

-- Q) Show all the records from all countries except India and Pakistan 
select * from orders 
where country != "india" and country != "pakistan" ;

-- Q) Show all the records having either loss or at least $1000 profit
select * from orders 
where profit <= 1000
order by profit desc ;

-- SQL in-built Functions


-- ### String Functions

-- LOWER
-- UPPER
-- LEFT
-- RIGHT
-- REVERSE
-- REPLICATE
-- LEN
-- CHARINDEX
-- CONCAT
-- CONCAT_WS
-- Concat (+) operator
-- SUBSTRING
-- REPLACE
-- STUFF


-- ### Numeric functions

-- CEILING
-- FLOOR
-- ROUND
-- POWER
-- RAND
-- SQRT
-- SQUARE


-- ### Date Functions

-- GETDATE
-- YEAR
-- MONTH
-- DAY
-- DATEPART
-- DATENAME
-- DATEDIFF
-- DATEADD
-- ISDATE


-- ### Other Functions

-- CAST
-- CONVERT
-- ISNULL
-- IIF 


-- ### Aggregate functions

-- SUM
-- AVG
-- MAX
-- MIN
-- COUNT
