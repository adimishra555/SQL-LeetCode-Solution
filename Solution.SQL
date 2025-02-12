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
    COALESCE(b.bonus, null) AS bonus  // if emp doesn't have a bonus, return null
FROM 
    Employee e
LEFT JOIN 
    Bonus b
ON 
    e.empId = b.empId
WHERE 
    b.bonus < 1000 OR b.bonus IS NULL;


-> Managers with at Least 5 Direct Reports
SELECT NAME FROM Employee WHERE id IN (
    SELECT managerID FROM Employee GROUP BY managerID HAVING COUNT(*) >=5
);

-> Confirmation Rate
SELECT  
    s.user_id,
    COALESCE(ROUND(CAST(COUNT(CASE WHEN c.action = 'confirmed' THEN 1 ELSE NULL END) AS FLOAT) / 
                   NULLIF(COUNT(c.user_id), 0), 2), 0) AS confirmation_rate
FROM  
    Signups s
LEFT JOIN  
    Confirmations c
ON  
    s.user_id = c.user_id
GROUP BY  
    s.user_id
ORDER BY  
    s.user_id;

-> Not Boring Movies
SELECT * FROM Cinema
WHERE id%2 != 0 AND description != 'boring'
ORDER BY rating DESC;


-> Average Selling Price
SELECT p.product_id, CAST(COALESCE(ROUND(SUM(p.price * u.units*1.00) / SUM(u.units), 2), 0) as float) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id
    AND purchase_date BETWEEN start_date AND end_date
GROUP BY p.product_id;


-> Project Employees I
SELECT p.project_id, ROUND(AVG(e.experience_years * 1.0), 2) AS average_years
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;

-> Percentage of Users Attended a Contest
SELECT r.contest_id, round(count(r.user_id) * 100.0 / (SELECT count(distinct u.user_id) FROM users u), 2) as percentage
FROM register r
left join users u on u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage desc, contest_id;

-> Queries Quality and Percentage
SELECT query_name, round(avg(1.0 * rating / position), 2) as quality,
round(sum(iif (rating < 3, 100.0, 0)) / Count(rating), 2) as poor_query_percentage
from Queries
GROUP BY query_name HAVING query_name IS NOT NULL;

Monthly Transactions I
SELECT format(trans_date, 'yyyy-MM') as month, country,
    COUNT(state) as trans_count,
    SUM(iif(state='approved', 1, 0)) as approved_count, 
    SUM(amount) as trans_total_amount,
    SUM(iif(state='approved', amount, 0)) as approved_total_amount
from Transactions group by format(trans_date, 'yyyy-MM'), country;

