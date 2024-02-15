-- 180. Consecutive Numbers

-- Solved with self join
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM
    logs l1
    JOIN logs l2 ON l1.id = l2.id - 1
    JOIN logs l3 ON l2.id = l3.id - 1
WHERE
    l1.num = l2.num
    AND l2.num = l3.num;

-- Solve with window functions
SELECT DISTINCT
    num AS ConsecutiveNums
FROM (
    SELECT
        id,
        num,
        CASE
            WHEN 
                LEAD(num, 1) OVER (ORDER BY id) = num AND
                LEAD(num, 2) OVER (ORDER BY id) = num THEN 1
            ELSE 0
        END AS consecutive
    FROM
        logs
) cons
WHERE consecutive = 1;

