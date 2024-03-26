SELECT distinct(num) AS ConsecutiveNums
FROM (
  SELECT 
    num,
    LEAD(num, 1) OVER() AS lead1,
    LEAD(num, 2) OVER() AS lead2
  FROM Logs
) AS subquery
WHERE lead1 = num AND lead2 = num;