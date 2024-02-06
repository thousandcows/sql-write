-- 1045. Customers Who Bought All Products

WITH ProductCount AS (
    SELECT COUNT(DISTINCT product_key) AS total_products
    FROM Product
)

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT total_products FROM ProductCount);
