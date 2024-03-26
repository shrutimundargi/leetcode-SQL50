select max(number) as num from (select num as number from MyNumbers 
group by num
having count(num)=1
order by num desc) p