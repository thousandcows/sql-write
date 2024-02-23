-- 1341. Movie Rating
WITH MostRatedUser AS (
    SELECT 
        u.name
    FROM 
        MovieRating mr
    JOIN
        Users u ON mr.user_id = u.user_id
    GROUP BY
        mr.user_id, u.name
    ORDER BY 
        COUNT(*) DESC, u.name ASC
    LIMIT 1
), HighestRatedMovie AS (
    SELECT
        m.title
    FROM 
        MovieRating mr
    JOIN
        Movies m ON mr.movie_id = m.movie_id
    WHERE
        mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY 
        mr.movie_id, m.title
    ORDER BY 
        AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
)

SELECT
    name AS results
FROM 
    MostRatedUser
UNION ALL
SELECT
    title AS results
FROM 
    HighestRatedMovie;
