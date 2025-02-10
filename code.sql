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
