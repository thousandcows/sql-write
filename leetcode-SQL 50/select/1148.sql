-- 1148 - Article Views 1
SELECT 
    DISTINCT(author_id) AS id
FROM
    Views
WHERE
    author_id = viewer_id
ORDER BY 
    1;