select contest_id, round(count(Users.user_id)/(select count(*) from Users)*100,2) as percentage
from Users
join Register
on Users.user_id = Register.user_id
group by contest_id
order by percentage desc, contest_id