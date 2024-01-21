-- 1075 Project Employees 1
SELECT
    p.project_id,
    ROUND(AVG(e.experience_years)::numeric, 2) AS average_years
FROM
    Project AS p
JOIN
    Employee AS e
ON
    p.employee_id = e.employee_id
GROUP BY
    p.project_id;
