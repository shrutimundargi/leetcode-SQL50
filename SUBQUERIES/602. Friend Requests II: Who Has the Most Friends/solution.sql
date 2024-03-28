-- Write your MySQL query statement below
SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS temp
GROUP BY id
HAVING num = (
    SELECT COUNT(*) AS max_num
    FROM (
        SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted
    ) AS temp
    GROUP BY id
    ORDER BY max_num DESC
    LIMIT 1
);
