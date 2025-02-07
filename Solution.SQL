-------------------------------------------------------------- SQL LeetCode Problem with  Solution  ---------------------------------------------------------- 
Q - Recyclable and Low Fat Products
SELECT product_id FROM Products WHERE low_fats  = 'Y' AND recyclable =  'Y';

-> Find Customer Referee
SELECT name FROM customer WHERE referee_id IS NULL OR referee_id != 2;

-> Big Countries
select name, population, area from  World where area >=3000000 or population >=  25000000;

-> Article Views I
SELECT DISTINCT author_id as id FROM Views WHERE author_id = viewer_id 
ORDER BY author_id;

-> Invalid Tweets
SELECT  tweet_id FROM Tweets WHERE LEN(content) > 15;

-> Replace Employee ID With The Unique Identifier
SELECT unique_id, name from Employees LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id;

-> Product Sales Analysis I
SELECT
    p.product_name, s.year, s.price
FROM
    Sales s , Product p 
        
WHERE s.product_id = p.product_id;

-> Customer Who Visited but Did Not Make Any Transactions

SELECT customer_id, COUNT(visit_id) AS count_no_trans
FROM Visits WHERE visit_id NOT IN (
    SELECT visit_id FROM Transactions
)
GROUP BY customer_id;

-> Rising Temperature
SELECT W1.id
FROM Weather W1
JOIN Weather W2 ON W1.recordDate = DATEADD(day, 1, W2.recordDate)
WHERE W1.temperature > W2.temperature;


-> Average Time of Process per Machine
SELECT a1.machine_id ,
 ROUND(AVG(a2.timestamp - a1.timestamp), 3) as processing_time
 from Activity a1
 join Activity a2
 on a1.process_id = a2.process_id
 and a1.machine_id = a2.machine_id
 and a1.timestamp < a2.timestamp
 group by a1.machine_id;

-> Employee Bonus
SELECT e.name, 
    COALESCE(b.bonus, null) AS bonus  //if emp doesn't have a bonus, return null
FROM 
    Employee e
LEFT JOIN 
    Bonus b
ON 
    e.empId = b.empId
WHERE 
    b.bonus < 1000 OR b.bonus IS NULL;

