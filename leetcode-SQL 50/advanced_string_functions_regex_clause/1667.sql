-- 1667. Fix Names in a Table
SELECT
    user_id,
    CONCAT(
        UPPER(SUBSTRING(name FROM 1 FOR 1)),
        LOWER(SUBSTRING(name FROM 2))
    ) AS name
FROM
    Users
ORDER BY
    user_id;
