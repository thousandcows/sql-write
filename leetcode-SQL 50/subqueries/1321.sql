-- 1321. Restaurant Growth
WITH calculated_totals AS (
    SELECT
        visited_on,
        SUM(SUM(amount)) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(
            AVG(SUM(amount)) OVER (
                ORDER BY visited_on
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ), 2
        ) AS average_amount
    FROM
        Customer
    GROUP BY
        visited_on
)
SELECT
    *
FROM
    calculated_totals
WHERE
    visited_on >= (
        SELECT
            MIN(visited_on)
        FROM
            calculated_totals
    ) + INTERVAL '6 days';
