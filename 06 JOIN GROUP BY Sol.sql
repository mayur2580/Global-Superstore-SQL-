---- 06 JOIN GROUP BY SOLUTIONS-------------------------

USE new_schema_2;

SELECT * FROM Fact;

SELECT * FROM Customer ;

SELECT * FROM Product;

SELECT * FROM Location ;

SELECT * FROM Regional_head ;

SELECT * FROM Returns;
------------------------------------------------

-- Q) Category wise sales

SELECT P.Category, SUM(F.Sales) 'Total sales'
FROM Fact F LEFT JOIN Product P ON F.Product_ID = P.Product_ID
GROUP BY P.Category ;

-- Q) Sub-category wise profit

SELECT P.Sub_Category, SUM(F.Profit) 'Total profit'
FROM Fact F LEFT JOIN Product P ON F.Product_ID = P.Product_ID
GROUP BY P.Sub_Category
ORDER BY 'Total profit' DESC;

-- Q) Category and Segment wise sales

SELECT P.Category, C.Segment, SUM(F.Sales) 'Total sales'
FROM Fact F LEFT JOIN Product P ON F.Product_ID = P.Product_ID
			LEFT JOIN Customer C ON F.Customer_ID = C.Customer_ID 
GROUP BY P.Category, C.Segment;


-- Q) Show Phones sub-category sales in Indian cities

SELECT L.City, SUM(F.Sales) 'Total sales'
FROM Fact F LEFT JOIN Product P ON F.Product_ID = P.Product_ID
		LEFT JOIN Location L ON F.Location_ID = L.Location_ID
WHERE L.Country = 'India' AND P.Sub_Category = 'Phones'
GROUP BY L.City
ORDER BY 'Total sales' DESC ;

-- Q) Find the list of cities facing overall loss in Technology category

SELECT L.City, SUM(Profit) 'Overall profit'
FROM Fact F LEFT JOIN Product P ON F.Product_ID = P.Product_ID
			LEFT JOIN Location L ON F.Location_ID = L.Location_Id
WHERE P.Category = 'Technology'
GROUP BY L.City
HAVING SUM(Profit) < 0
ORDER BY 'Overall profit';

-- Q) Find profit generated under each Regional head

SELECT RH.Regionalhead, SUM(Profit) 'Total Profit'
FROM Fact F LEFT JOIN Location L ON F.Location_ID = L.Location_ID
			LEFT JOIN Regional_head RH ON L.Region = RH.Region
GROUP BY RH.Regionalhead
ORDER BY 'Total Profit' DESC; 

-- Q) Find the names of those Regional heads who have generated at least 15% profit

SELECT RH.Regionalhead, ROUND(100.0*SUM(Profit)/SUM(Sales), 2) '% Profit'
FROM Fact F LEFT JOIN Location L ON F.Location_ID = L.Location_ID
			LEFT JOIN Regional_head RH ON L.Region = RH.Region
GROUP BY RH.RegionalHead
HAVING ROUND(100.0*SUM(Profit)/SUM(Sales), 2) >= 15
ORDER BY '% Profi' DESC;

-- Q) Find sales amount for Returned orders

SELECT SUM(F.Sales) 
FROM Fact F LEFT JOIN Returns R ON F.Order_ID = R.Order_ID
WHERE R.Order_ID IS NOT NULL;
--
SELECT SUM(F.Sales) 
FROM Fact F LEFT JOIN Returns R ON F.Order_ID = R.Order_ID
WHERE R.Returned = 'Yes';

-- Q) Find sub-category wise returned sales amount

SELECT P.Sub_Category, ROUND(SUM(F.Sales), 2) 'Returned sales' 
FROM Fact F LEFT JOIN Returns R ON F.Order_ID = R.Order_ID
			LEFT JOIN Product P ON F.Product_ID = P.Product_ID
WHERE R.Returned = 'Yes'
GROUP BY P.Sub_Category
ORDER BY 'Returned sales' DESC ;

-- Find returned sales amount for every regional head

SELECT RH.RegionalHead, SUM(F.Sales) 'Returned sales'
FROM Fact F LEFT JOIN Location L ON F.Location_ID = L.Location_ID
			LEFT JOIN Regional_head RH ON L.Region = RH.Region 
			LEFT JOIN Returns R ON F.Order_ID = R.Order_ID 
WHERE R.Returned = 'Yes'
GROUP BY RH.RegionalHead
ORDER BY 'Returned sales' DESC;

-- Better output  

SELECT RH.RegionalHead, SUM(CASE WHEN R.Returned = 'Yes' THEN F.Sales ELSE 0 END) 'Returned sales'
FROM Fact F LEFT JOIN Location L ON F.Location_ID = L.Location_ID
			LEFT JOIN Regional_head RH ON L.Region = RH.Region 
			LEFT JOIN Returns R ON F.Order_ID = R.Order_ID 
GROUP BY RH.RegionalHead
ORDER BY 'Returned sales' DESC ;

-- Q) Find the customer who have placed the order of maximum value

SELECT  C.Customer_ID, C.Customer_Name, F.Order_ID, SUM(F.Sales) 'Sales amount'
FROM Fact F LEFT JOIN Customer C ON F.Customer_ID = C.Customer_ID 
GROUP BY C.Customer_ID, C.Customer_Name, F.Order_ID
ORDER BY 'Sales amount' DESC 
limit  5 ;

-- Q) Find year wise sales for each category

SELECT P.Category, YEAR(F.Order_Date) 'Year', SUM(Sales) 'Total sales'
FROM Fact F LEFT JOIN Product P ON F.Product_ID = P.Product_ID
GROUP BY P.Category, YEAR(F.Order_Date)
ORDER BY P.Category, YEAR(F.Order_Date); 


-- Q) Find category and segment wise profit of 2024 in India

SELECT P.Category, C.Segment, SUM(F.Profit) 'Total profit' 
FROM Fact F LEFT JOIN Product P ON F.Product_ID = P.Product_ID
			LEFT JOIN Customer C ON F.Customer_ID = C.Customer_ID
			LEFT JOIN Location L ON F.Location_ID = L.Location_ID
WHERE L.Country = 'India' AND YEAR(Order_Date) = 2024 
GROUP BY P.Category, C.Segment 
ORDER BY P.Category, C.Segment ;


