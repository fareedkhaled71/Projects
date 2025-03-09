-- SELECT * FROM customer_reviews;

--***********************************
--***********************************

-- Clean white space issue in ReviewText column 



SELECT 
    ReviewID,  -- Selects the unique identifier for each review
    CustomerID,  -- Selects the unique identifier for each customer
    ProductID,  -- Selects the unique identifier for each product
    ReviewDate,  -- Selects the date when the review was written
    Rating,  -- Selects the numerical rating given by the customer (e.g., 1 to 5 stars)
    -- Cleans up the ReviewText by replacing double spaces with single spaces to ensure the text is more readable and standardized
    REPLACE(ReviewText, '  ', ' ') AS ReviewText
From customer_reviews