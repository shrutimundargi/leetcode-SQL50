with cte as 
(select product_id, new_price as price, RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS
CustomerRank 
from Products
where change_date <= '2019-08-16')

select product_id, price from cte
where CustomerRank = 1
Union
select product_id, 10 as price from products where product_id not in (select product_id from cte)