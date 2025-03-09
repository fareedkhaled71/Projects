USE Marketing;


-- Check Products Table 
SELECT * 
FROM products;

-- ****************************************************************
-- ****************************************************************

-- Categorize Products based on their price 
SELECT ProductID, ProductName , Price ,
CASE WHEN Price < 50 THEN 'Low'
     WHEN price Between 50 AND 200 THEN 'Medium'
	 Else  'High'
END AS 'PriceCategory' 
FROM products