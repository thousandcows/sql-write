-- 185. Department Top Three Salaries
WITH salary_ranking AS (
    SELECT
        departmentId,
        name,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS ranking
    FROM
        Employee
)
SELECT
    d.name AS "Department",
    s.name AS "Employee",
    s.salary AS "Salary"
FROM
    salary_ranking s
INNER JOIN
    Department d ON s.departmentId = d.id
WHERE
    s.ranking <= 3;
