use new_schema_2;

SELECT * FROM Fact;

SELECT * FROM Customer;

SELECT * FROM Product;

SELECT * FROM Location;

SELECT * FROM Regional_head ;

SELECT * FROM returns;

-- Q) Category wise sales
select product.category, sum(fact.sales) as total_sales
from product
join fact on product.product_id = fact.product_id
group by product.category
order by total_sales ;

-- Q) Sub-category wise profit
select product.sub_category, round(sum(fact.profit),2)
from product
join fact on product.product_id = fact.product_id
group by product.sub_category;

-- Q) Category and Segment wise sales
select customer.segment, round(sum(fact.sales),2) as total_sales
from customer
join fact on customer.customer_id = fact.customer_id
group by customer.segment;

-- Q) Show Phones sub-category sales in Indian cities
select product.sub_category, location.city, round(sum(fact.sales),2) as total_sales
from fact
join location on location.location_id = fact.location_id
join product on product.product_id = fact.product_id
where location.country = "india" and  product.sub_category = "phones"
group by  product.sub_category, location.city
;

-- Q) Find the list of cities facing overall loss in Technology category
select location.city, product.category, sum(fact.profit) as total_loss
from location
join fact on location.location_id = fact.location_id
join product on fact.product_id = product.product_id
where product.category = "technology" 
group by location.city, product.category
having sum(fact.profit) < 0 
order by total_loss;

-- Q) Find profit generated under each Regional head
select location.location_Id, regional_head.regionalhead, round(sum(fact.profit),2) as profit
from location
join fact on fact.location_id = location.location_id
join regional_head on regional_head.region = location.region
group by location.location_Id, regional_head.regionalhead
order by profit desc ;

-- Q) Find the names of those Regional heads who have generated at least 15% profit
SELECT 
    location.location_id,
    regional_head.regionalhead,
    ROUND((SUM(fact.profit) / SUM(fact.sales) * 100),
            2) AS percentage_profit
FROM
    location
        JOIN
    fact ON fact.location_id = location.location_id
        JOIN
    regional_head ON regional_head.region = location.region
GROUP BY location.location_id , regional_head.regionalhead
HAVING percentage_profit > 15
ORDER BY percentage_profit
;

-- Q) Find sales amount for Returned orders
select returns.order_id, returns.returned, sum(fact.sales) as sales
from returns
join fact on fact.order_id = returns.order_id
group by returns.order_id, returns.returned
having returns.returned = "yes"
order by sales asc ; 

-- Q) Find sub-category wise returned sales amount
select p.sub_category, sum(f.sales) as sales
from product as p
join fact as f 
on 
f.product_id = p.product_id 
join returns as r 
on 
f.order_id = r.order_id
where r.returned = "yes"
group by p.sub_category
;

-- Find returned sales amount for every regional head
select  rh.regionalhead, r.returned, round(sum(f.sales),2) as sales
from  regional_head as rh 
left join location as l 
on l.region = rh.region
left join fact as f
on f.location_id = l.location_id
left join returns as r 
on r.order_id = f.order_id
where r.returned = "yes"
group by r.returned, rh.regionalhead;

-- Q) Find the customer who have placed the order of maximum value
SELECT 
    c.customer_id,
    c.customer_name,
    ROUND(SUM(f.sales * f.quantity), 2) AS total_order_value
FROM
    customer AS c
        LEFT JOIN
    fact AS f ON c.customer_id = f.customer_id
GROUP BY c.customer_id , c.customer_name
ORDER BY total_order_value DESC
LIMIT 1; 

-- Q) Find year wise sales for each category
select product.Category, year(order_date) as 'year', round(sum(sales),2) as total_sales   
from fact 
join product 
on product.Product_ID = fact.Product_ID
group by year(order_date) , product.Category
 order by year desc;

-- Q) Find category and segment wise profit of 2024 in India
SELECT 
    YEAR(fact.order_date) AS year,
    product.Category,
    customer.Segment,
    location.Country,
    SUM(fact.Profit) AS profit
FROM
    product
        LEFT JOIN
    fact ON product.Product_ID = fact.Product_ID
        LEFT JOIN
    customer ON customer.Customer_ID = fact.Customer_ID
        LEFT JOIN
    location ON location.Location_ID = fact.Location_ID
WHERE
    country = 'india'
GROUP BY product.Category , customer.Segment , YEAR(fact.order_date) , location.country
ORDER BY year DESC;
