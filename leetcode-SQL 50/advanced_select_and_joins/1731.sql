-- 1731. The Number of Employees Which Report to Each Employee
SELECT
    ee.reports_to AS "employee_id",
    e.name,
    COUNT(*) AS "reports_count",
    ROUND(AVG(ee.age)) AS "average_age"
FROM
    Employees ee
JOIN
    Employees e ON e.employee_id = ee.reports_to
GROUP BY
    ee.reports_to, e.name
ORDER BY
    "employee_id";
