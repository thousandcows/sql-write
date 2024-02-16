-- 1978. Employees Whose Manager Left the Company
-- Select employee IDs
SELECT
    employee_id
FROM
    Employees
WHERE
    manager_id IS NOT NULL
    AND manager_id NOT IN (
        SELECT employee_id FROM Employees
    )
    AND salary < 30000
ORDER BY
    employee_id ASC;
