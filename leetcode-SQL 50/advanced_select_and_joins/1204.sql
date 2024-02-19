-- 1204. Last Person to Fit in the Bus
WITH CumulativeWeight AS (
    SELECT
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM
        Queue
)
SELECT
    person_name
FROM
    CumulativeWeight
WHERE
    total_weight <= 1000
ORDER BY
    turn DESC
LIMIT 1;
