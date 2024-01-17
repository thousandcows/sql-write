-- 1934.Confirmation Rate
SELECT
    s.user_id,
    COALESCE(ROUND(c.confirmation_rate, 2), 0.00) AS confirmation_rate
FROM
    Signups s
LEFT JOIN
    (SELECT
        user_id,
        SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END)::numeric / COUNT(*) AS confirmation_rate
    FROM Confirmations
    GROUP BY 
        user_id
    ) c
ON 
    s.user_id = c.user_id;

