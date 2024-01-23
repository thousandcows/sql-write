-- Percentage of Users Attended a Contest
SELECT
    R.contest_id,
    ROUND(
        COUNT(DISTINCT R.user_id) * 100.00 / 
        (SELECT COUNT(U.user_id) FROM Users U), 2
    ) AS "percentage"
FROM 
    Register R
GROUP BY 
    R.contest_id
ORDER BY 
    percentage DESC, 
    R.contest_id;