------------------------- SET OPERATORS-------------------------------

USE new_schema_2;

CREATE TABLE T1 (
Person VARCHAR(50),
Age INT
);

DROP TABLE T1;

CREATE TABLE T2 (
Person VARCHAR(50),
Age INT
);


INSERT INTO T1 VALUES 
('Siya', 24),
('Gunjan', 21),
('Pawan', 19),
('Alok', 25),
('Gunjan', 23);



INSERT INTO T2 VALUES 
('Priya', 18),
('Sanjay', 22),
('Priya', 18),
('Gunjan', 21);


SELECT * FROM T1;

SELECT * FROM T2;

-- UNION

SELECT * FROM T1
UNION
SELECT * FROM T2;

-- UNION ALL

SELECT * FROM T1
UNION ALL
SELECT * FROM T2 ;


-- INTERSECT

SELECT * FROM T1
INTERSECT
select * FROM T2 ;

-- EXCEPT

SELECT * FROM T1
EXCEPT
SELECT * FROM T2 ;

SELECT * FROM T2
EXCEPT
SELECT * FROM T1;




DROP TABLE T1 ;

DROP TABLE T2;




















































