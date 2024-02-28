-- 1327. List the Products Ordered in a Period
SELECT
    p.product_name,
    SUM(o.unit) AS unit
FROM
    Products p
INNER JOIN
    Orders o ON p.product_id = o.product_id
WHERE
    o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY
    p.product_name
HAVING
    unit >= 100;
