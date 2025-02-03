-------------------------------------------------------------- SQL LeetCode Problem with  Solution  ---------------------------------------------------------- 
Q - Recyclable and Low Fat Products
SELECT product_id FROM Products WHERE low_fats  = 'Y' AND recyclable =  'Y';

->  Find Customer Referee
SELECT name FROM customer WHERE referee_id IS NULL OR referee_id != 2;

-> Big Countries
select name, population, area from  World where area >=3000000 or population >=  25000000;

-> Article Views I
SELECT DISTINCT author_id as id FROM Views WHERE author_id = viewer_id 
ORDER BY author_id;

-> Invalid Tweets
SELECT  tweet_id FROM Tweets WHERE LEN(content) > 15;
