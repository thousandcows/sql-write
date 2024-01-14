-- 1280. Students and Examination
SELECT
    s.student_id, 
    s.student_name, 
    ss.subject_name, 
    count(e.subject_name) AS "attended_exams"
FROM
    Students s
CROSS JOIN
    Subjects ss
LEFT JOIN
    Examinations e
ON
    e.student_id = s.student_id
AND
    ss.subject_name = e.subject_name
GROUP BY
    s.student_id, s.student_name, ss.subject_name
ORDER BY
    1, 3;
