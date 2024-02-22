-- 626. Exchange Seats
SELECT 
    CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id % 2 != 0 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
        ELSE id
    END AS new_id,
    student
FROM 
    Seat s
ORDER BY 
    new_id ASC;
