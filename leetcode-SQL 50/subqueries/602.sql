-- 602. Friend Requests II: Who Has the Most Friends
WITH FriendsCount AS (
    SELECT
        accepter_id AS id,
        COUNT(*) AS num
    FROM
        RequestAccepted
    GROUP BY
        accepter_id
    UNION ALL
    SELECT
        requester_id AS id,
        COUNT(*) AS num
    FROM
        RequestAccepted
    GROUP BY
        requester_id
),
TotalFriendsCount AS (
    SELECT
        id,
        SUM(num) AS total_num
    FROM
        FriendsCount
    GROUP BY
        id
),
MaximumFriendsCount AS (
    SELECT
        MAX(total_num) AS max_count
    FROM
        TotalFriendsCount
)

SELECT
    TFC.id,
    TFC.total_num
FROM
    TotalFriendsCount TFC
JOIN
    MaximumFriendsCount MFC ON TFC.total_num = MFC.max_count;
