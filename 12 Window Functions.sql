
-----------------------------------------------  Window Functions

USE Batch1;

SELECT * FROM Orders;

-- ROW_NUMBER

-- Q) Show the cities with rank 11 to 20 on the basis of sales. 

SELECT City, SUM(Sales) 'Sales'
FROM Orders
GROUP BY City
ORDER BY Sales DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY ;

-- OR

SELECT * 
FROM (SELECT TOP 10  *
	  FROM (SELECT TOP 20 City, SUM(Sales) 'Sales'
			FROM Orders
			GROUP BY City
			ORDER BY Sales DESC) T
	  ORDER BY Sales ASC) T
ORDER BY Sales DESC

-- OR 

SELECT City, Sales
FROM (SELECT City, SUM(Sales) 'Sales', ROW_NUMBER() OVER(ORDER BY SUM(Sales) DESC) 'RN'
	  FROM Orders 
	  GROUP BY City) T 
WHERE RN BETWEEN 11 AND 20





-- Q) Find the top 3 selling cities of each country

SELECT Country, City, Sales
FROM (SELECT Country, City, SUM(Sales) 'Sales', 
			 ROW_NUMBER() OVER(PARTITION BY Country ORDER BY SUM(Sales) DESC) 'RN'
	  FROM Orders
	  GROUP BY Country, City) T
WHERE RN <= 3
ORDER BY Country, Sales DESC







-- RANK

-- Q) Find the top 30 products based on quantity sold. 

SELECT TOP 30 [Product ID], [Product Name], SUM(Quantity) 'Quantity'
FROM Orders
GROUP BY [Product ID], [Product Name]
ORDER BY Quantity DESC

-- Better using RANK

SELECT * 
FROM (SELECT [Product ID], [Product Name], SUM(Quantity) 'Quantity',
			 RANK() OVER(ORDER BY SUM(Quantity) DESC) 'Rank'
			 FROM Orders
			 GROUP BY [Product ID], [Product Name]) T
WHERE Rank <= 30
ORDER BY Quantity DESC





-- Q) Find top 10 products in each sub-category based on quantity sold

SELECT * 
FROM (SELECT [Sub-Category] ,[Product ID], [Product Name], SUM(Quantity) 'Quantity',
			 RANK() OVER(PARTITION BY [Sub-Category] ORDER BY SUM(Quantity) DESC) 'Rank'
			 FROM Orders
			 GROUP BY [Sub-Category] ,[Product ID], [Product Name]) T
WHERE Rank <= 10
ORDER BY [Sub-Category], Quantity DESC






-- DENSERANK

-- Q) Find the second highest selling product

SELECT * 
FROM (SELECT [Sub-Category] ,[Product ID], [Product Name], SUM(Quantity) 'Quantity',
	  DENSE_RANK() OVER(PARTITION BY [Sub-Category] ORDER BY SUM(Quantity) DESC) 'Rn'
	  FROM Orders
	  GROUP BY [Sub-Category] ,[Product ID], [Product Name]) T
WHERE Rn = 2 
ORDER BY [Sub-Category] 










-- Window function with Aggregation

-- Q) Show quarter over quarter sales as well as cumulative sales

SELECT *, SUM([Total sales]) OVER(ORDER BY Year, Quarter) 'Cumulative sales'
FROM (SELECT YEAR([Order Date]) 'Year', DATEPART(QUARTER, [Order Date]) 'Quarter', 
	  SUM(Sales) 'Total sales'
	  FROM Orders 
	  GROUP BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date])) T





-- Q) Show quarter over quarter percent sales as well as moving avg sales

SELECT *, SUM([Total sales]) OVER(ORDER BY Year, Quarter) 'Running total sales',
		AVG([Total sales]) OVER(ORDER BY Year, Quarter) 'Moving avg sales'
FROM (SELECT YEAR([Order Date]) 'Year', DATEPART(QUARTER, [Order Date]) 'Quarter', 
	  SUM(Sales) 'Total sales'
	  FROM Orders 
	  GROUP BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date])) T







-- LAG

-- Q) Show quarter over quarter percent growth in sales

SELECT YEAR([Order Date]) 'Year', DATEPART(QUARTER, [Order Date]) 'Quarter',
	   SUM(Sales) 'Sales',
	   LAG(SUM(Sales), 1) OVER(ORDER BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date])) 'PQ Sales',
	   SUM(Sales)/LAG(SUM(Sales), 1) OVER(ORDER BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date]))*100 - 100 '% Growth'
FROM Orders
GROUP BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date])



-- LEAD

-- Q) Show quarter over quarter percent growth in sales

SELECT YEAR([Order Date]) 'Year', DATEPART(QUARTER, [Order Date]) 'Quarter',
	   SUM(Sales) 'Sales',
	   LEAD(SUM(Sales), 1) OVER(ORDER BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date]))-SUM(Sales) 'Growth'
FROM Orders
GROUP BY YEAR([Order Date]), DATEPART(QUARTER, [Order Date])
