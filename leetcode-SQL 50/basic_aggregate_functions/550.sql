-- 550. Game Play Analysis 4
WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) as first_login
    FROM Activity
    GROUP BY player_id
),
NextDayLogin AS (
    SELECT f.player_id
    FROM FirstLogin f
    JOIN Activity a ON f.player_id = a.player_id 
        AND a.event_date = f.first_login + INTERVAL '1 day'
)
SELECT 
    ROUND(COUNT(DISTINCT n.player_id) * 1.0 / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM 
    FirstLogin f
LEFT JOIN 
    NextDayLogin n ON f.player_id = n.player_id;
