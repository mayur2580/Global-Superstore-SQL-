
------------------------------------------------------- Subquery in WHERE

USE Batch1_GS


SELECT * FROM Fact

SELECT * FROM Customer

SELECT * FROM Product

SELECT * FROM [Location]

SELECT * FROM [Regional head]

SELECT * FROM [Returns]






-- Q) Show all data of Fact table for the returned orders

SELECT *
FROM Fact
WHERE [Order ID] IN (SELECT [Order ID] FROM [Returns])




-- Q) Show all data of Fact table for the orders from 'India'

SELECT *
FROM Fact
WHERE [Location ID] IN (SELECT [Location ID] FROM [Location] WHERE Country = 'India')




-- Q) Show all data of Fact table for the products of 'Phones' sub-categories

SELECT *
FROM Fact
WHERE [Product ID] IN (SELECT [Product ID] FROM Product WHERE [Sub-Category] = 'Phones')




-- Q) Show all data of Fact table for the orders placed by customer with first name 'John'

SELECT *
FROM Fact
WHERE [Customer ID] IN (SELECT [Customer ID] FROM Customer WHERE [Customer Name] LIKE 'John%')




-- Q) Find total sales and total profit generated in city 'Pune'

SELECT SUM(Sales) 'Total sales', SUM(Profit) 'Total profit'
FROM Fact 
WHERE [Location ID] = (SELECT [Location ID] FROM [Location] WHERE City = 'Pune')




-- Q) Find total sales and total profit generated by the non-returned orders

SELECT SUM(Sales) 'Total sales', SUM(Profit) 'Total profit'
FROM Fact

SELECT SUM(Sales) 'Total sales', SUM(Profit) 'Total profit'
FROM Fact
WHERE [Order ID] IN (SELECT [Order ID] FROM [Returns])

SELECT SUM(Sales) 'Total sales', SUM(Profit) 'Total profit'
FROM Fact
WHERE [Order ID] NOT IN (SELECT [Order ID] FROM [Returns])




-- Q) Show all data of Fact table for the Returned orders from 'India'

SELECT *
FROM Fact
WHERE [Location ID] IN (SELECT [Location ID] FROM [Location] WHERE Country = 'India')
	AND [Order ID] IN (SELECT [Order ID] FROM [Returns])




-- Q) Show all data of Fact table under the Regional Head 'Larry Hughes'

SELECT *
FROM Fact
WHERE [Location ID] IN (SELECT [Location ID] 
						FROM [Location] 
						WHERE Region = (SELECT Region 
										FROM [Regional head] 
										WHERE [Regional Head] = 'Larry Hughes'))




-- Q) Find the amount of returned sales under the Regional Head 'Nora Preis'

SELECT SUM(Sales) 'Returned sales under Nora Preis'
FROM Fact
WHERE [Location ID] IN (SELECT [Location ID] 
						FROM [Location] 
						WHERE Region = (SELECT Region 
										FROM [Regional head] 
										WHERE [Regional Head] = 'Nora Preis'))
	AND [Order ID] IN (SELECT [Order ID] FROM [Returns])










-------------------------------------------------------------- Subquery in FROM

USE Batch1



-- Q) For How many quarters sales exceeds 1000000

SELECT COUNT(*) 
FROM (SELECT YEAR([Order Date]) 'Year', DATEPART(QUARTER, [Order Date]) 'Quarter', SUM(Sales) 'Total sales' 
	  FROM Orders
	  GROUP BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date])) T
WHERE [Total sales] >= 1000000

--
SELECT COUNT(*) 
FROM (SELECT YEAR([Order Date]) 'Year', DATEPART(QUARTER, [Order Date]) 'Quarter', SUM(Sales) 'Sales' 
	  FROM Orders
	  GROUP BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date])
	  HAVING SUM(Sales) >= 1000000) T




-- Q) Find number of cities with total sales more than 50000

SELECT COUNT(*)
FROM (SELECT City, SUM(Sales) 'Total sales'
	  FROM Orders
	  GROUP BY City) T
WHERE [Total sales] >= 50000

--
SELECT COUNT(*)
FROM (SELECT City, SUM(Sales) 'Total sales'
	  FROM Orders
	  GROUP BY City
	  HAVING SUM(Sales) >= 50000) T




-- Q) Find country wise number of cities with sales more than 10000

SELECT Country, COUNT(*) 'City count'
FROM (SELECT Country, City, SUM(Sales) 'Total sales'
	  FROM Orders
	  GROUP BY Country, City) T
WHERE [Total sales] >= 10000
GROUP BY Country
ORDER BY [City count] DESC




-- Q) Find average sales per city

SELECT AVG([Total sales]) 'Avg sales per city'
FROM (SELECT City, SUM(Sales) 'Total sales'
	  FROM Orders
	  GROUP BY City) T

-- Q) Find average sales per city for each country

SELECT Country, AVG([Total sales]) 'Avg sales per city'
FROM (SELECT Country, City, SUM(Sales) 'Total sales'
	  FROM Orders
	  GROUP BY Country, City) T
GROUP BY Country
ORDER BY [Avg sales per city] DESC




-- Q) Find average monthly sales

SELECT AVG([Total sales]) 'Average monthly sales'
FROM (SELECT YEAR([Order Date]) 'Year', MONTH([Order Date]) 'Month', SUM(Sales) 'Total sales'
	  FROM Orders
	  GROUP BY YEAR([Order Date]), MONTH([Order Date])) T

-- Q) Find average monthly sales for each year

SELECT [Year], AVG([Total sales]) 'Average monthly sales'
FROM (SELECT YEAR([Order Date]) 'Year', MONTH([Order Date]) 'Month', SUM(Sales) 'Total sales'
	  FROM Orders
	  GROUP BY YEAR([Order Date]), MONTH([Order Date])) T
GROUP BY [Year]


--------------------------------------------------------  Subquery in SELECT

-- Q) Find percentage contribution in sales by different sub-categories

SELECT [Sub-Category], SUM(Sales) 'Total sales', 
		CONCAT(ROUND(100.0*SUM(Sales)/(SELECT SUM(Sales) FROM Orders), 2), '%') '% Contribution' 
FROM Orders 
GROUP BY [Sub-Category]
ORDER BY [Total sales] DESC





-- Q) Show each country sales is how much percent of that of USA sales

SELECT Country, ROUND(SUM(Sales), 0) 'Total sales', 
	   ROUND((SELECT SUM(Sales) FROM Orders WHERE Country = 'United States'), 0) 'USA sales',
	   CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Orders WHERE Country = 'United States')*100, 2), '%') 'Percent of USA sales'
FROM Orders
GROUP BY Country
ORDER BY [Total sales] DESC




-- Q) Print USA sales, Overseas sales, Total sales in a row. 

SELECT (SELECT SUM(Sales) FROM Orders WHERE Country = 'United States') 'USA sales',
	   (SELECT SUM(Sales) FROM Orders WHERE Country <> 'United States') 'Overseas sales', 
	   (SELECT SUM(Sales) FROM Orders) 'Total sales'


























































