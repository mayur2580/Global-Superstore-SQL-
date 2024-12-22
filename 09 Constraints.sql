
---------------------------------- SQL CONSTRAINTS

CREATE TABLE Test (
EmpID VARCHAR(10),
EmpName VARCHAR(50),
EmpCountry VARCHAR(50),
Salary_lac DECIMAL(5,2)
);

-- DROP TABLE Test 

-- TRUNCATE TABLE Test 


INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 12.6);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', NULL, 'USA', 8.25);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E001', 'Priya Verma', 'India', 20.5);

SELECT * FROM Test;

INSERT INTO Test (EmpID, EmpName, Salary_lac) VALUES 
('E003', 'Kajal Singh',  25.2);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E004', 'Ankit Gupta', 'India', -4.5);

SELECT * FROM Test;
drop table test;
-- UNIQUE

CREATE TABLE Test (
EmpID VARCHAR(10) UNIQUE,
EmpName VARCHAR(50),
EmpCountry VARCHAR(50),
Salary_lac DECIMAL(5,2)
);

-- DROP TABLE Test

-- TRUNCATE TABLE Test


SELECT * FROM Test;

INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 12.6);

SELECT * FROM Test

INSERT INTO Test VALUES 
('E002', NULL, 'USA', 8.25);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E001', 'Priya Verma', 'India', 20.5);

SELECT * FROM Test;

INSERT INTO Test VALUES 
(NULL, 'Priya Verma', 'India', 20.5);

SELECT * FROM Test;

INSERT INTO Test VALUES 
(NULL, 'Gagan Thakur', 'India', 17.4);

SELECT * FROM Test;
drop table test;
-- NOT NULL

CREATE TABLE Test (
EmpID VARCHAR(10),
EmpName VARCHAR(50) NOT NULL,
EmpCountry VARCHAR(50),
Salary_lac DECIMAL(5,2)
);

-- DROP TABLE Test

-- TRUNCATE TABLE Test


SELECT * FROM Test;

INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 12.6);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', NULL, 'USA', 8.25);

SELECT * FROM Test;
drop table test;
-- DEFAULT

CREATE TABLE Test (
EmpID VARCHAR(10),
EmpName VARCHAR(50),
EmpCountry VARCHAR(50) DEFAULT 'India',
Salary_lac DECIMAL(5,2));


-- DROP TABLE Test

-- TRUNCATE TABLE Test


INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 12.6);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', 'Jack Dason', 'UK', 15);

SELECT * FROM Test;

INSERT INTO Test (EmpID, EmpName, Salary_lac) VALUES 
('E003', 'Kajal Singh',  25.2);

SELECT * FROM Test;
drop table test;

-- CHECK

CREATE TABLE Test (
EmpID VARCHAR(10),
EmpName VARCHAR(50),
EmpCountry VARCHAR(50),
Salary_lac DECIMAL(5,2) CHECK (Salary_lac > 0)
);

-- DROP TABLE Test

-- TRUNCATE TABLE Test


INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 12.6);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', 'Ankit Gupta', 'India', -4.5);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E00', 'Ankit Gupta', 'India', 4.5) ;

drop table test;

SELECT * FROM Test;

-- CHECK on multiple column

CREATE TABLE Test (
EmpID VARCHAR(10),
EmpName VARCHAR(50),
EmpCountry VARCHAR(50),
Salary_lac DECIMAL(5,2),
CONSTRAINT Test_check CHECK (Salary_lac > 0 AND EmpCountry IN ('India', 'USA', 'UK'))
);

-- DROP TABLE Test

-- TRUNCATE TABLE Test

INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 12.6);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', 'Ankit Gupta', 'India', -4.5)

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', 'Ankit Gupta', 'Australia', 14.5);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', 'Ankit Gupta', 'USA', 14.5) ;

SELECT * FROM Test ;
drop table test;

-- IDENTITY (auto increment)

CREATE TABLE Test (
EmpID INT auto_increment primary key ,
EmpName VARCHAR(50),
EmpCountry VARCHAR(50),
Salary_lac DECIMAL(5,2)
);

-- DROP TABLE Test

-- TRUNCATE TABLE Test


INSERT INTO Test (EmpName, EmpCountry, Salary_lac) VALUES 
('Ravi Singh', 'India', 12.6);

SELECT * FROM Test;

INSERT INTO Test (EmpName, EmpCountry, Salary_lac) VALUES 
('Kavita', 'UK', 15.8);

SELECT * FROM Test;

INSERT INTO Test (EmpName, EmpCountry, Salary_lac) VALUES 
('Ankita Sinha', 'USA', 9.5);

SELECT * FROM Test;
drop table test;

-- PRIMARY KEY

CREATE TABLE Test (
EmpID VARCHAR(10) PRIMARY KEY,
EmpName VARCHAR(50),
EmpCountry VARCHAR(50),
Salary_lac DECIMAL(5,2)
);

-- DROP TABLE Test

-- TRUNCATE TABLE Test


INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 12.6);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E002', 'Jhon Rinch', 'UK', 14.5);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E001', 'Priya Verma', 'India', 8.5);

SELECT * FROM Test;

INSERT INTO Test VALUES 
(NULL, 'Priya Verma', 'India', 8.5);

SELECT * FROM Test;

INSERT INTO Test VALUES 
('E003', 'Priya Verma', 'India', 8.5);

SELECT * FROM Test;
drop table test;


-- PRIMARY KEY, FOREIGN KEY

CREATE TABLE TestDep (
DeptID VARCHAR(5) PRIMARY KEY,
DeptName VARCHAR(50),
DeptEmailId VARCHAR(50),
DeptHead VARCHAR(50)
);


CREATE TABLE Test (
EmpID VARCHAR(10) PRIMARY KEY,
EmpName VARCHAR(50),
EmpCountry VARCHAR(50),
DeptID VARCHAR(5), 
Salary_lac DECIMAL(5,2),
FOREIGN KEY (DeptID) REFERENCES TestDep(DeptID)
);

-- DROP TABLE Test

-- TRUNCATE TABLE Test


INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 'D1', 12.6);

SELECT * FROM Test

INSERT INTO TestDep VALUES
('D1', 'IT', 'itgsd@xyz.com', 'Ankit Verma'),
('D2', 'HR', 'hrteam@xyz.com', 'Priya Mehta')

SELECT * FROM TestDep

INSERT INTO Test VALUES 
('E001', 'Ravi Singh', 'India', 'D1', 12.6)

SELECT * FROM Test

INSERT INTO Test VALUES 
('E005', 'Kanika', 'India', 'D3', 7.5)

SELECT * FROM Test



-- DROP TABLE Test

-- DROP TABLE TestDep





