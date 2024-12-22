SELECT * FROM global_superstore;

select count(*)
from	
    (select count(city), city, sum(sales) as total_sales
	from global_superstore
	where country = "india"
	group by city
	having sum(sales) > 5000) as sales
;

-- CTE (Common Table Expression) 
 
with CTE1 as 
(select * from global_superstore
where country = "india"),

cte2 as 
(select city, sum(sales)  as 'total_sales'
 from cte1
 group by city),
 
 cte3 as
 (select *
 from cte2
 where total_sales > 5000)

select count(*)  from cte3
;

select sum(sales)
from global_superstore
where country = 'india'
;
 
 
with cte1 as (
select Country, city, sum(sales) as city_sales
from global_superstore
group by country, city
),

cte2 as (
select country, avg(city_sales) as avg_city_sales
from cte1
group by country 
)

select cte1.*, cte2.avg_city_sales 
from cte1 
left join cte2 on 
cte1.country = cte2.country
where cte1.city_sales > cte2.avg_city_sales
;











