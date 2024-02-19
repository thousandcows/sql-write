-- 1204. Last Person to Fit in the Bus
WITH total_weight AS (
    SELECT
        q.person_name, 
        q.turn,
        (SELECT SUM(weight) FROM Queue WHERE turn <= q.turn) AS total_weight
    FROM
        Queue q
)

SELECT
    tw.person_name
FROM
    total_weight tw
WHERE
    tw.total_weight <= 1000
ORDER BY
    tw.total_weight DESC
LIMIT 1;
