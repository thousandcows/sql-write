-- 1211. Queries Quality and Percentage
SELECT 
    q.query_name,
    ROUND(AVG(q.rating * 1.00 / q.position), 2) AS quality,
    ROUND(
        AVG(
            CASE 
                WHEN q.rating < 3 THEN 1
                ELSE 0
            END
        ) * 100.00, 2
    ) AS poor_query_percentage
FROM 
    queries q
WHERE 
    q.query_name IS NOT NULL
GROUP BY 
    q.query_name;
