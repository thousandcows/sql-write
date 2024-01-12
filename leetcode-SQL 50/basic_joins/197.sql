-- 197 Rising Temperature
SELECT 
    current.id
FROM 
    Weather current
JOIN 
    Weather previous
ON 
    current.recordDate = previous.recordDate + INTERVAL '1 day'
WHERE 
    current.temperature > previous.temperature;