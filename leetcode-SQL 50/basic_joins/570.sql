-- Managers with at Least 5 Direct Reports
SELECT
    e.name
FROM
    Employee e
JOIN 
    Employee ee
ON 
    e.id = ee.managerId
GROUP BY 
    e.id, e.name
HAVING 
    count(*) >= 5;