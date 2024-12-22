USE new_schema;

-- Q) Use SUM, MAX, MIN, AVG, COUNT on sales column
SELECT 
    ROUND((sales), 2)
FROM
    orders;
    
SELECT 
    MAX(sales)
FROM
    orders;
    
SELECT 
    MIN(sales)
FROM
    orders;
    
SELECT 
    AVG(sales)
FROM
    orders;
    
SELECT 
    COUNT(sales)
FROM
    orders;

-- Q) Show total sales, total profit
SELECT 
    SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM
    orders;

-- Q) Show Category wise total sales
select category, round(sum(sales),2) as Total_sales from orders 
group by category ;

-- Q) Show Segment wise total sales
select segment, round(sum(sales),2) as 'segment wise total sales' from orders
group by Segment ; 

-- Q) Show Category and Segment wise total sales
select category, Segment, sum(sales) from orders
group by Category, Segment;

--
SELECT Category, Segment, SUM(Sales) 'Total sales'
FROM Orders
GROUP BY Category, Segment
ORDER BY "Total sales" DESC ;

-- Q) Show Year wise total sales
select year(order_date) as 'year', round(sum(sales),2) as total_sales from orders
group by year(order_date)
order by total_sales desc;

-- Q) Show quarter over quarter total sales
select year(order_date) as years , quarter(order_date) as Quarters, round(sum(sales),2) as total_sales
from orders
group by quarter(order_date), year(order_date)
order by years desc ;

-- Q) Show month over month total sales
select month(order_date) as Months, monthname(order_date), round(sum(sales),2) as Total_sales from orders
group by month(order_date), monthname(order_date)
order by months asc;
--

-- Q) Print the list of city names whose total sales is more than one lac 
select city, round(sum(sales),2) as total_sales from orders
group by city
having sum(sales) > 100000
order by  city ;

-- Q) Print the list of Indian city names whose total sales is more than ten thousands
select city, round(sum(sales),2) as total_sales from orders
group by city
having total_sales > 10000 
order by city, total_sales ;

-- Q) Print the list of top 3 selling cities of Pakistan
select city, round(sum(sales),2) total_sales from orders
group by city
order by total_sales desc
limit 3 ;

-- Q) Show total quantity sold for each product
select product_name, sum(quantity) total_quantity from orders
group by Product_Name
order by total_quantity desc ;

-- Q) Find the list of products whose Average price per unit is more than 1000
select Product_Name, sum(sales), sum(quantity), sum(sales)/ sum(quantity)  as avg_price_unit from orders
group by Product_Name
having sum(sales)/ sum(quantity) > 1000
order by avg_price_unit asc ;

-- Q) List the customers giving overall loss
select customer_name, round(sum(profit),2) as overall_loss from orders 
group by Customer_Name 
having overall_loss < 0 
order by Customer_Name asc;  

-- Q) List the products giving overall loss
select Product_ID, Product_Name, sum(profit) as overall_loss
from orders
group by Product_ID, Product_Name
having overall_loss < 0
order by overall_loss desc;

-- Q) List all the products in Tables sub-category whose overall profit is positive
select Product_ID, Product_Name, sum(profit) as total_profit
from orders
where Sub_Category = "tables"
group by  Product_ID, Product_Name, Sub_Category
having total_profit > 0
order by total_profit asc  ;

-- Q) Calculate % profit earned for each sub-categories 
select Sub_Category, sum(sales) as  total_sales,sum(profit) as total_profit , 
		round((sum(profit)/sum(sales) * 100),2) as percentage
from orders 
group by Sub_Category
order by percentage desc ;

-- Q) Show the first and last order date for each customer
select customer_name, min(Order_Date) as First_OD, max(Order_Date) as Last_OD 
from orders
group by Customer_Name
order by Customer_Name ;

-- Q) Find average quantity purchased per order for each product
select Customer_Name,product_name, round(avg(quantity),2) as avg_quantity
from orders
group by Customer_Name, product_name
order by avg_quantity desc ;
