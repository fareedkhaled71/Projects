USE Marketing ;

SELECT * 
FROM customer_journey;

--******************************************
--******************************************

-- CTE TO identify the duplicate records 
WITH DuplicateRecords AS (
 SELECT JourneyID,
        CustomerID,
        ProductID,
	    VisitDate,
	    Stage,
	    Action,
	    Duration,
	    ROW_NUMBER() OVER(PARTITION BY CustomerID,ProductID,VisitDate,Stage,Action ORDER BY journeyID) as row_num
 FROM customer_journey 
)

Select * 
FROM DuplicateRecords
--where row_num > 1
Order by JourneyID ;


--*******************************************
--*******************************************

-- selects the final cleaned and standardized data
SELECT  journeyID,
        CustomerID,
        ProductID,
	    VisitDate,
	    Stage,
	    Action,
		COALESCE(Duration, avg_duration) as Duration
FROM (
-- Subquery to process and clean the data
  SELECT  
        journeyID,
        CustomerID,
        ProductID,
	    VisitDate,
	    UPPER(Stage) AS Stage,
	    Action,
		Duration,
		AVG(Duration) OVER(PARTITION BY VisitDate) AS avg_duration ,
		ROW_NUMBER() OVER(PARTITION BY CustomerID,ProductID,VisitDate,UPPER(Stage),Action ORDER BY journeyID) as row_num
 FROM customer_journey
) AS subquery 
WHERE row_num = 1