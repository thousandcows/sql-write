-- 585. Investments in 2016
SELECT
    ROUND(SUM(i.tiv_2016)::NUMERIC, 2) AS tiv_2016
FROM
    Insurance i
WHERE
    i.tiv_2015 IN (
        SELECT tiv_2015
        FROM Insurance
        WHERE pid != i.pid
    )
    AND (lat, lon) NOT IN (
        SELECT lat, lon
        FROM Insurance
        WHERE pid != i.pid
    );
