-- 1174 Immediate Food Delivery 2
WITH FirstOrderDates AS (
    SELECT
        customer_id,
        MIN(order_date) AS "order_date"
    FROM
        Delivery
    GROUP BY
        customer_id
)
SELECT
    ROUND(SUM(
        CASE
            WHEN d.order_date = d.customer_pref_delivery_date THEN 1
            ELSE 0
        END
    ) * 100.00 / COUNT(d.customer_id), 2) AS immediate_percentage
FROM
    Delivery d
JOIN
    FirstOrderDates fod ON d.customer_id = fod.customer_id AND d.order_date = fod.order_date;