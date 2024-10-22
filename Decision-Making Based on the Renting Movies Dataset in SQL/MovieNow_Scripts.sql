
/*

READ ME

The table renting includes all records of movie rentals. 
Each record has a unique ID renting_id. 
It also contains information about customers (customer_id) and which movies they watched (movie_id).
Furthermore, customers can give a rating after watching the movie,
and the day the movie was rented is recorded.

*/

-- Explore Renting Table 
SELECT *  
FROM renting;


-- Explore Renting Table from specific time periods
SELECT *
FROM renting
WHERE date_renting BETWEEN '2018-04-01' AND '2018-08-31'
ORDER BY date_renting ASC; -- Order by recency in decreasing order




-- EXPLORE movie Table 
SELECT *
FROM movies
ORDER BY renting_price ASC ;


/* Only some users give a rating after watching a movie. Sometimes it is interesting to explore only those movie rentals where a rating was provided */

SELECT *
FROM renting
WHERE date_renting BETWEEN '2018-01-01' AND '2018-12-31' -- Renting in 2018
AND rating IS NOT NULL ; 




/* In most business decisions customers are analyzed in groups, such as customers per country or customers per age group  */

-- Count the number of customers born in the 80s
SELECT COUNT(*) number_of_customers_80s
FROM customers
WHERE date_of_birth BETWEEN '1980-01-01' AND '1989-12-31';



--Count the number of customers from Germany
SELECT count(*) nu_of_Germany_Customers
FROM customers
WHERE country ='Germany'; 




-- Count the number of countries where MovieNow has customers
SELECT COUNT(DISTINCT country)  NU_OF_Countries
FROM customers;



-- The movie ratings give us insight into the preferences of our customers , so this is summary statistics Report

SELECT MIN(rating) min_rating, 
	   MAX(rating) max_rating, 
	   AVG(rating) avg_rating, 
	   COUNT(rating) number_ratings 
FROM renting;



/* 
I am asked to provide a report about the development of the company. Specifically, 
my manager is interested in the total number of movie rentals, 
the total number of ratings and the average rating of all movies since the beginning of 2019
*/

SELECT COUNT(*) AS number_renting,
	  AVG(rating) AS average_rating, 
      COUNT(rating) AS number_ratings 
FROM renting
WHERE date_renting >= '2019-01-01';



-- Conduct an analysis to see when the first customer accounts were created for each country

SELECT country, 
   min(date_account_start) AS first_account
FROM customers
GROUP BY country
ORDER BY first_account;




-- For each movie the average rating, the number of ratings and the number of views has to be reported.
SELECT movie_id, 
       AVG(rating) AS avg_rating,
       COUNT(rating) AS number_ratings,
       COUNT(*) AS number_renting
FROM renting
GROUP BY movie_id
ORDER BY avg_rating DESC;



/* 

table with the average rating given by each customer, 
include the number of ratings and the number of movie rentals per customer. 
these summary statistics will report these summary statistics only for customers with more than 7 movie rentals 

*/


SELECT customer_id,
 avg(rating) ,
 count(rating) ,
 count(customer_id) 
FROM renting 
GROUP BY customer_id
HAVING count(customer_id) > 7
ORDER BY avg asc;




-- Average ratings of customers from Belgium
SELECT AVG(rating) 
FROM renting AS r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
WHERE c.country='Belgium';




/* 
The management of MovieNow wants to report key performance indicators (KPIs) for the performance of the company in 2018. 
They are interested in measuring the financial successes as well as user engagement
*/

SELECT 
	SUM(m.renting_price) revenue, 
	COUNT(*) number_of_movies, 
	COUNT(DISTINCT r.customer_id) number_of_customers
FROM renting AS r
LEFT JOIN movies AS m
ON r.movie_id = m.movie_id
WHERE date_renting  BETWEEN '2018-01-01' AND '2018-12-31';



--  overview of which actors play in which movie

SELECT  a.name,m.title
FROM actsin ai
LEFT JOIN actors a
ON ai.actor_id=a.actor_id
LEFT JOIN movies m
ON ai.movie_id=m.movie_id
GROUP BY a.name,m.title;




-- How much income did each movie generate?

SELECT rm.title, SUM(rm.renting_price) AS income_movie
FROM
       (SELECT m.title,  
               m.renting_price
       FROM renting AS r
       LEFT JOIN movies AS m
       ON r.movie_id=m.movie_id) AS rm
GROUP BY rm.title
ORDER BY income_movie DESC; 


-- the date of birth of the oldest and youngest US actor and actress.

SELECT a.gender,  
       min(a.year_of_birth) youngest, 
       max(a.year_of_birth) oldest
FROM
   (SELECT * FROM actors WHERE nationality='USA') AS a  
GROUP BY a.gender;


-- Which is the favorite movie for all customers born in the 70s ?


SELECT m.title, COUNT(*) number_of_renting , AVG(r.rating) average_rating
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE c.date_of_birth BETWEEN '1970-01-01' AND '1979-12-31'
GROUP BY m.title
HAVING COUNT(*) > 1 
ORDER BY average_rating DESC; 


--  explore actor popularity in Spain 

SELECT a.name,  c.gender,
       COUNT(*) AS number_views, 
       AVG(r.rating) AS avg_rating
FROM renting as r
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
LEFT JOIN actsin as ai
ON r.movie_id = ai.movie_id
LEFT JOIN actors as a
ON ai.actor_id = a.actor_id
WHERE c.country='Spain'
GROUP BY a.name, c.gender
HAVING AVG(r.rating) IS NOT NULL 
  AND COUNT(*) > 5 
ORDER BY avg_rating DESC, number_views DESC;


/*
 manager is interested in the total number of movie rentals, 
the average rating of all movies and the total revenue for each country since the beginning of 2019
*/

SELECT 
	country,                    -- For each country report
	COUNT(r.renting_id) AS number_renting, -- The number of movie rentals
	avg(r.rating) AS average_rating, -- The average rating
	sum(m.renting_price) AS revenue         -- The revenue from movie rentals
FROM renting AS r
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE date_renting >= '2019-01-01' and country is not null 
GROUP BY country;




/*
 manager wants  to make a list of movies excluding those which are hardly ever watched. This list of movies will be used for advertising. 
List all movies with more than 5 views
*/

SELECT *
FROM movies
where movie_id in   -- Select movie IDs from the inner query
	(SELECT movie_id
	FROM renting
	GROUP BY movie_id
	HAVING COUNT(*) > 5);


-- Report a list of customers who frequently rent movies 

SELECT *
FROM customers
where customer_id in            -- Select all customers with more than 10 movie rentals
	(SELECT customer_id 
	FROM renting
	GROUP BY customer_id
	having count(customer_id) > 10);
	
	
-- For the advertising campaign  manager  needs a list of popular movies with high ratings.	

SELECT title-- Report the movie titles of all movies with average rating higher than the total average
FROM movies
WHERE movie_id in
	(SELECT movie_id
	 FROM renting
     GROUP BY movie_id
     HAVING AVG(rating) > 
		(SELECT AVG(rating)
		 FROM renting));

/*
 A new advertising campaign is going to focus on customers who rented fewer than 5 movies,
 we will extract all customer information for the customers of interest	
*/

SELECT *
FROM customers as c
WHERE 5 > 
	(SELECT count(*)
	FROM renting as r
	WHERE r.customer_id = c.customer_id);
	
	
	
-- Identify customers who were not satisfied with movies they watched on MovieNow. this is a  list of customers with minimum rating smaller than 4
SELECT *
FROM customers c
WHERE 4 > -- Select all customers with a minimum rating smaller than 4 
	(SELECT MIN(rating)
	FROM renting AS r
	WHERE r.customer_id = c.customer_id);

/*
 Report contain  a list of movies that received the most attention on the movie platform, 
( report of  all movies with more than 5 ratings and all movies with an average rating higher than 8).
*/

SELECT *
FROM movies m
WHERE 5 < -- Select all movies with more than 5 ratings
	(SELECT count(r.rating) from renting r where m.movie_id=r.movie_id);
	

SELECT *
FROM movies AS m
WHERE 8 < -- Select all movies with an average rating higher than 8
	(SELECT avg(rating)
	FROM renting AS r
	WHERE r.movie_id = m.movie_id);
	
	
	
-- Having active customers is a key performance indicator for MovieNow. this is  list of customers who gave at least one rating	

SELECT *
FROM customers c -- Select all customers with at least one rating
WHERE exists
	(SELECT *
	FROM renting AS r
	WHERE rating IS NOT NULL 
	AND r.customer_id = c.customer_id);



/*

In order to analyze the diversity of actors in comedies, first,we will  report a list of actors who play in comedies and then, 
the number of actors for each nationality playing in comedies.

*/


SELECT *
FROM actors a
WHERE exists 
	(SELECT *
	 FROM actsin AS ai
	 LEFT JOIN movies AS m
	 ON m.movie_id = ai.movie_id
	 WHERE m.genre = 'Comedy'
	 AND ai.actor_id = a.actor_id);




SELECT a.nationality,count(*) --  the nationality and the number of actors for each nationality
FROM actors AS a
WHERE EXISTS
	(SELECT ai.actor_id
	 FROM actsin AS ai
	 LEFT JOIN movies AS m
	 ON m.movie_id = ai.movie_id
	 WHERE m.genre = 'Comedy'
	 AND ai.actor_id = a.actor_id)
group by a.nationality;




--  actors who are not from the USA and actors who were born after 1990

SELECT name, 
       nationality, 
       year_of_birth
FROM actors
WHERE nationality <> 'USA'
INTERSECT -- Select all actors who are not from the USA and who are also born after 1990
SELECT name, 
       nationality, 
       year_of_birth
FROM actors
WHERE year_of_birth > 1990;




/*

The advertising team has a new focus. They want to draw the attention of the customers to dramas. 
so this is  a list of all movies that are in the drama genre and have an average rating higher than 9
*/

SELECT *
FROM movies
WHERE movie_id =  -- Select all movies of genre drama with average rating higher than 9
   (SELECT movie_id
    FROM movies
    WHERE genre = 'Drama'
    INTERSECT
    SELECT movie_id
    FROM renting
    GROUP BY movie_id
    HAVING AVG(rating)>9);


--  total number of male and female customers from each country.

SELECT country, -- Extract information of a pivot table of gender and country for the number of customers
	   gender,
	   count(*)
FROM customers
GROUP BY CUBE (country, gender)
ORDER BY country;


--  List of the number of movies for different genres and release years

SELECT genre,
       year_of_release,
       count(*)
FROM movies
GROUP BY CUBE (genre,year_of_release)
ORDER BY year_of_release;

-- national preferences of the customers from MovieNow,(comparing the average rating of movies across countries and genres)

SELECT 
	c.country, 
	m.genre, 
	AVG(r.rating) AS avg_rating -- Calculate the average rating 
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
group by CUBE(c.country,m.genre) ; -- For all aggregation levels of country and genre


-- total number of customers, the number of customers for each country, and the number of female and male customers for each country

SELECT country,
       gender,
	   COUNT(*)
FROM customers
GROUP BY ROLLUP (country, gender)
ORDER BY country, gender; -- Order the result by country and gender



-- Are there particular genres which are more popular in specific countries?

-- Group by each county and genre with OLAP extension
SELECT 
	c.country, 
	m.genre, 
	AVG(r.rating) AS avg_rating, 
	COUNT(*) AS num_rating
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY ROLLUP(c.country,m.genre)
ORDER BY c.country, m.genre;



-- We are interested in how much diversity there is in the nationalities of the actors and how many actors and actresses are in the list


SELECT 
	nationality, -- Select nationality of the actors
    gender, -- Select gender of the actors
    Count(*) -- Count the number of actors
FROM actors
GROUP BY GROUPING SETS ((gender), (nationality), ()); 


/* 
MovieNow considers to invest money in new movies.It is more expensive for MovieNow to make movies available 
which were recently producedthan older ones.
First step of data analysis : Do customers give better ratings 
to movies which were recently produced than to olderones? Is there a difference across countries?
*/


SELECT c.country,
       m.year_of_release,
	   COUNT(*) AS n_rentals,
	   COUNT(DISTINCT r.movie_id) AS n_movies,
	   AVG(rating) AS avg_rating 
FROM renting AS r 
LEFT JOIN customers AS c
ON c.customer_id = r.customer_id
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE r.movie_id IN (
	                 SELECT movie_id
	                 FROM renting
	                 GROUP BY movie_id
	                 HAVING COUNT(rating) >=4 ) 
AND r.date_renting >='2018-04-01' 
GROUP BY ROLLUP (m.year_of_release, c.country)
ORDER BY c.country, m.year_of_release;

/*
You just saw that customers have no clear preference for more recent movies over older ones. 
Now the management considers investing money in movies of the best rated genres
*/

SELECT genre,
	   AVG(rating) AS avg_rating,
	   COUNT(rating) AS n_rating,
       COUNT(*) AS n_rentals,     
	   COUNT(DISTINCT m.movie_id) AS n_movies 
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
WHERE r.movie_id IN ( 
	SELECT movie_id
	FROM renting
	GROUP BY movie_id
	HAVING COUNT(rating) >= 3 )
AND r.date_renting >= '2018-01-01'
GROUP BY genre
ORDER BY avg_rating desc; -- Order the table by decreasing average rating

--  Action & Adventure has the highest rating, so we can invest in the movies of this two genres



-- The last aspect we have to analyze are customer preferences for certain actors.

SELECT a.nationality,
       a.gender,
	   AVG(r.rating) AS avg_rating,
	   COUNT(r.rating) AS n_rating,
	   COUNT(*) AS n_rentals,
	   COUNT(DISTINCT a.actor_id) AS n_actors
FROM renting AS r
LEFT JOIN actsin AS ai
ON ai.movie_id = r.movie_id
LEFT JOIN actors AS a
ON ai.actor_id = a.actor_id
WHERE r.movie_id IN ( 
	SELECT movie_id
	FROM renting
	GROUP BY movie_id
	HAVING COUNT(rating) >= 4)
AND r.date_renting >= '2018-04-01'
GROUP BY CUBE(a.nationality,a.gender); -- Provide results for all aggregation levels represented in a pivot table