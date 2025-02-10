WITH FilteredTraffic AS (
    SELECT 
        t.visited_on,
        t.time_spent
    FROM traffic t
    JOIN users u ON t.user_id = u.id
    WHERE u.user_type = 'user'
),
DailySum AS (
    SELECT 
        visited_on,
        SUM(time_spent) AS total_time_spent
    FROM FilteredTraffic
    GROUP BY visited_on
),
MovingAverage AS (
    SELECT 
        d1.visited_on,
        ROUND(AVG(d2.total_time_spent), 4) AS avg_time_spent
    FROM DailySum d1
    JOIN DailySum d2 
    ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 2 DAY) AND d1.visited_on
    GROUP BY d1.visited_on
)
SELECT visited_on, avg_time_spent
FROM MovingAverage
ORDER BY visited_on;



-- There is a database that contains a website's traffic data over a period of 30 days. The first table contains users' information including the user type (user, crawler, admin). The second table consists of the time of each visit to the website, the id of the visitor, time spent on the website in seconds. Write an SQL query to show the 3 day moving average of time spent on the website for users.user_type = 'user'.

-- Note: avg time spent must have 4 decimal digits and rounded off (example: 5/3 = 1.6667, 5/2 = 2.5000 and 1/3 = 0.3333)