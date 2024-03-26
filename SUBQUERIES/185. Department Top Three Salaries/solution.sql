select d.name as Department, e1.name as Employee, e1.Salary from Employee e1
join Department d on e1.departmentId = d.id
where 3 > (select count(Distinct e2.Salary) from employee e2
where e2.salary > e1.Salary
and e1.departmentId = e2.DepartmentId)