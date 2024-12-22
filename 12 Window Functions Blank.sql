-----------------------------------------------  Window Functions

SELECT * FROM Orders;

-- ROW_NUMBER

-- Q) Show the cities with rank 11 to 20 on the basis of sales. 

-- Using OFFSET FETCH
select distinct city , sum(sales) as total_sales
from orders
group by city
order by total_sales desc
limit 10
offset 10 ;

-- Using Nested subquery



-- Using ROW_NUMBER()

-- Q) Find the top 3 selling cities of each country
select country , city, sales
from (
		select country, city, sum(sales) "sales",
        row_number() over(partition by country order by sum(sales) desc) "Rn"
        from orders 
        group by Country, city) T
where Rn <= 3
order by sales ;

-- RANK

-- Q) Find the top 30 products based on quantity sold. 
select Product_Name, quantity 
from orders
order by Quantity desc
limit 30 ;
--
select *
from (
		select product_id, product_name, sum(quantity) as "Quantity",
        rank() over(order by sum(quantity) desc) "Rank"
        from orders
        group by Product_ID, Product_Name) as  T
where "Rank" <= 30
order by "rank" asc
;

-- Q) Find top 10 products in each sub-category based on quantity sold
select * 
from (
		select product_id, Product_Name, Sub_Category, sum(Quantity) as total_quantity,
		rank() over(order by sum(quantity) desc) "Rank" 
		from orders
        group by  product_id, Product_Name, Sub_Category 
      ) as T
where "Rank" <= 10
limit 10
;

-- DENSERANK

-- Q) Find the second highest selling product
select * 
from (
		select Product_ID,Product_Name, sub_category, sum(Quantity) as total_sales,
        dense_rank() over(partition by Sub_Category order by sum(quantity) desc) as "Rn"
        from orders
        group by Product_ID,Product_Name, sub_category
       ) as T
where Rn = 2
order by Sub_Category
;
        
-- Window function with Aggregation

-- Q) Show quarter over quarter sales as well as cumulative sales
select *, sum(total_sales) over(order by year, quarter) "cumulative sales"
from (
		select year(order_date) as "Year", quarter(order_date) as "Quarter" , sum(sales) as total_sales
        from orders
        group by year(order_date), quarter(order_date) 
        ) as T;
        
-- Q) Show quarter over quarter percent sales as well as moving avg sales
select  *, sum(total_sales) over(order by year, quarter) "sum_sales", 
			avg(total_sales) over(order by year, quarter) "cumulative_avg_sales"
from (
		select year(order_date) as "year", quarter(order_date) as "quarter", sum(sales) as total_sales
        from orders
        group by year(order_date), quarter(order_date)
        ) as T ;







-- LAG

-- Q) Show quarter over quarter percent growth in sales




-- LEAD

-- Q) Show quarter over quarter percent growth in sales





