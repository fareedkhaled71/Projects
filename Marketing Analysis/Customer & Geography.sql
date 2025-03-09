USE Marketing;

-- Check Customer Data 
SELECT * FROM customers;



-- Check geography table  
SELECT * FROM geography;

-- **********************************************
-- **********************************************

-- join customer table with geography to connect each customer with thre related geography information 

Select c.CustomerID,
       c.CustomerName,
	   c.Email,
	   c.Gender,
	   c.Age,
	   g.Country,
	   g.City
FROM customers AS c
LEFT JOIN geography as g 
ON c.GeographyID = g.GeographyID




