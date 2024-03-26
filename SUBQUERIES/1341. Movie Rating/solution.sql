with temp as
(select distinct first_value(name) over (order by count(movie_id) desc, name) as results from Users u 
join MovieRating mr
on u.User_id = mr.user_id
group by mr.user_id
)

(Select u.name as results 
from MovieRating as m, Users as u 
where u.user_id = m.user_id Group By m.user_id 
Order by count(m.user_id) desc, u.name limit 1)
union all
(Select m.title as results
from MovieRating as r, Movies as m
where m.movie_id = r.movie_id 
and r.created_at like "2020-02-%"
Group By r.movie_id 
Order by avg(r.rating) desc, m.title limit 1);