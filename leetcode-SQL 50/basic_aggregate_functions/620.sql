-- 620 Not Boring Movies
SELECT 
    *
FROM
    Cinema c
WHERE
    MOD(id, 2) = 1 and c.description != 'boring'
ORDER BY
    c.rating desc;