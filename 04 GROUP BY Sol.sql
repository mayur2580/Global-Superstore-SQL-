
USE Batch1 


-- Q) Show Category wise total sales

SELECT Category, SUM(Sales) 'Total sales'
FROM Orders
GROUP BY Category



-- Q) Show Segment wise total sales

SELECT Segment, SUM(Sales) 'Total sales'
FROM Orders
GROUP BY Segment



-- Q) Show Category and Segment wise total sales

SELECT Category, Segment, SUM(Sales) 'Total sales'
FROM Orders
GROUP BY Category, Segment
ORDER BY Category, Segment
--
SELECT Category, Segment, SUM(Sales) 'Total sales'
FROM Orders
GROUP BY Category, Segment
ORDER BY [Total sales] DESC



-- Q) Show Year wise total sales

SELECT YEAR([Order Date]) 'Year', SUM(Sales) 'Total sales'
FROM Orders
GROUP BY YEAR([Order Date])
ORDER BY Year ASC



-- Q) Show quarter over quarter total sales

SELECT YEAR([Order Date]) 'Year', DATEPART(QUARTER,[Order Date]) 'Quarter', SUM(Sales) 'Total sales'
FROM Orders
GROUP BY YEAR([Order Date]), DATEPART(QUARTER,[Order Date]) 
ORDER BY Year, Quarter




-- Q) Show month over month total sales

SELECT YEAR([Order Date]) 'Year', MONTH([Order Date]) 'Month', SUM(Sales) 'Total sales'
FROM Orders
GROUP BY YEAR([Order Date]), MONTH([Order Date]) 
ORDER BY Year, Month
--
SELECT YEAR([Order Date]) 'Year', DATENAME(MONTH,[Order Date]) 'Month', SUM(Sales) 'Total sales'
FROM Orders
GROUP BY YEAR([Order Date]), DATENAME(MONTH,[Order Date]), MONTH([Order Date]) 
ORDER BY YEAR([Order Date]), MONTH([Order Date]) 




-- Q) Print the list of city names whose total sales is more than one lac 

SELECT City, SUM(Sales) 'Total sales'
FROM Orders
GROUP BY City 
HAVING SUM(Sales) > 100000
ORDER BY [Total sales] DESC



-- Q) Print the list of Indian city names whose total sales is more than ten thousands

SELECT City, SUM(Sales) 'Total sales'
FROM Orders
WHERE Country = 'India'
GROUP BY City 
HAVING SUM(Sales) > 10000
ORDER BY [Total sales] DESC




-- Q) Print the list of top 3 selling cities of Pakistan

SELECT TOP 3 City, SUM(Sales) 'Total sales'
FROM Orders
WHERE Country = 'Pakistan'
GROUP BY City 
ORDER BY [Total sales] DESC



-- Q) Show total quantity sold for each product

SELECT [Product ID], [Product Name], SUM(Quantity) 'Quantity sold'
FROM Orders
GROUP BY [Product ID], [Product Name]
ORDER BY [Quantity sold] DESC



-- Q) Find the list of products whose Average price per unit is more than 1000

SELECT [Product ID], [Product Name], 
		SUM(Sales) 'Total sales', SUM(Quantity) 'Quantity sold',
		SUM(Sales)/SUM(Quantity) 'Average price per unit'
FROM Orders
GROUP BY [Product ID], [Product Name]
HAVING SUM(Sales)/SUM(Quantity) > 1000
ORDER BY [Average price per unit] DESC



-- Q) List the customers giving overall loss

SELECT [Customer ID], [Customer Name], SUM(Profit) 'Total profit'
FROM Orders
GROUP BY [Customer ID], [Customer Name]
HAVING SUM(Profit) < 0 
ORDER BY [Total profit] 




-- Q) List the products giving overall loss

SELECT [Product ID], [Product Name], SUM(Profit) 'Total profit' 
FROM Orders 
GROUP BY [Product ID], [Product Name] 
HAVING SUM(Profit) < 0 
ORDER BY [Total profit] 




-- Q) List all the products in Tables sub-category whose overall profit is positive

SELECT [Product ID], [Product Name], SUM(Profit) 'Total profit'
FROM Orders
WHERE [Sub-Category] = 'Tables'
GROUP BY [Product ID], [Product Name] 
HAVING SUM(Profit) > 0
ORDER BY [Total profit] DESC 




-- Q) Calculate % profit earned for each sub-categories 

SELECT [Sub-Category], SUM(Profit) 'Total profit', SUM(Sales) 'Total sales',
		100.0*SUM(Profit)/SUM(Sales) '% Profit'
FROM Orders
GROUP BY [Sub-Category] 
ORDER BY [% Profit] DESC 




-- Q) Show the first and last order date for each customer

SELECT [Customer ID], [Customer Name], MIN([Order Date]) 'First OD', MAX([Order Date]) 'Last OD'
FROM Orders
GROUP BY [Customer ID], [Customer Name]




-- Q) Find average quqntity purchased per order for each product

SELECT [Product ID], [Product Name], AVG(Quantity) 'Avg quantity'
FROM Orders
GROUP BY [Product ID], [Product Name]
ORDER BY [Avg quantity] DESC 













