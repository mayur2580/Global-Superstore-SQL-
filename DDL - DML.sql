
-- DATABASE

CREATE DATABASE Batch1;

USE Batch1 ;

DROP DATABASE Batch1;

----------------------------------------------------------

-- CREATE, INSERT

CREATE TABLE Employee (
Name VARCHAR(50),
BirthYear INT,
DOJ DATE, 
Salary_lac DECIMAL(5, 2)
);

SELECT * FROM Employee ;


INSERT INTO Employee VALUES 
('Aman Singh', 1995, '2022-12-26', 5.5);

SELECT * FROM Employee;

INSERT INTO Employee VALUES 
('Priya Gupta', 1998, '2023-02-21', 12.4),
('Siya', 1992, '2021-05-12', 7.3),
('Ankit', 2001, '2024-10-06', 8.25);

SELECT * FROM Employee;
------------------------------------------
-- TRUNCATE, DROP

TRUNCATE TABLE Employee;

SELECT * FROM Employee;

INSERT INTO Employee VALUES 
('Priya Gupta', 1998, '2023-02-21', 12.4),
('Siya', 1992, '2021-05-12', 7.3),
('Ankit', 2001, '2024-10-06', 8.25) ;

DROP TABLE Employee ;

SELECT * FROM Employee ;
----------------------------------------------
-- DELETE

CREATE TABLE Employee (
Name VARCHAR(50),
BirthYear INT,
DOJ DATE, 
Salary_lac DECIMAL(5, 2)
);

INSERT INTO Employee VALUES 
('Priya Gupta', 1998, '2023-02-21', 12.4),
('Siya', 1992, '2021-05-12', 7.3),
('Ankit', 2001, '2024-10-06', 8.25);

SELECT * FROM Employee;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM Employee 
WHERE Name = 'Priya Gupta' ;

SELECT * FROM Employee;

INSERT INTO Employee VALUES 
('Priya Gupta', 1999, '2023-04-01', 23.4),
('Sanjay', 1996, '2021-09-17', 4.3);

SELECT * FROM Employee;

DELETE FROM Employee 
WHERE Salary_lac < 8;

SELECT * FROM Employee;

INSERT INTO Employee VALUES 
('Sikha', 1992, '2021-11-11', 3.5),
('Sanjay', 1996, '2021-09-17', 6.3);

SELECT * FROM Employee;

DELETE FROM Employee ;

SELECT * FROM Employee;

DROP TABLE Employee ;

SELECT * FROM Employee;

----------------------------------------------

-- UPDATE 

CREATE TABLE Employee (
Name VARCHAR(50),
BirthYear INT,
DOJ DATE, 
Salary_lac DECIMAL(5, 2)
);

INSERT INTO Employee VALUES 
('Priya Gupta', 1998, '2023-02-21', 12.4),
('Siya', 1992, '2021-05-12', 7.3),
('Ankit', 2001, '2024-10-06', 8.25);

SELECT * FROM Employee ;


UPDATE Employee 
SET BirthYear = 2000
WHERE Name = 'Priya Gupta' ;

SELECT * FROM Employee ;

UPDATE Employee 
SET Name = 'Siya Ahuja'
WHERE Name = 'Siya';

SELECT * FROM Employee ; 

UPDATE Employee 
SET Salary_lac = 10
WHERE Salary_lac < 10 ;

SELECT * FROM Employee ;


UPDATE Employee 
SET Salary_lac = Salary_lac*1.1; 

select * from employee;

UPDATE Employee 
SET Salary_lac = 9;

SELECT * FROM Employee; 

DROP TABLE Employee ;
--------------------------------------------------

-- ALTER -- ADD COLUMN


CREATE TABLE Employee (
Name VARCHAR(50),
BirthYear INT,
DOJ DATE, 
Salary_lac DECIMAL(5, 2)
);

INSERT INTO Employee VALUES 
('Priya Gupta', 1998, '2023-02-21', 12.4),
('Siya', 1992, '2021-05-12', 7.3),
('Ankit', 2001, '2024-10-06', 8.25);


SELECT * FROM Employee; 

ALTER TABLE Employee
ADD Country VARCHAR(40);

SELECT * FROM Employee ;

UPDATE Employee
SET Country = 'India';

SELECT * FROM Employee 




-- ALTER -- DROP COLUMN 

alter TABLE Employee
DROP COLUMN Country ;

SELECT * FROM Employee ;

-- ALTER -- CHANGE DATATYPE

ALTER TABLE Employee
ALTER COLUMN Salary_lac DECIMAL(6,3);

SELECT * FROM Employee 


------------------------------------employee;






SELECT * FROM Employee ;


INSERT INTO Employee (Name, BirthYear, Salary_lac) VALUES ('A', 2000, 5.5)

