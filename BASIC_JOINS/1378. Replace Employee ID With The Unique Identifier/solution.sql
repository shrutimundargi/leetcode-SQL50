select unique_id, name from Employees
Left outer join EmployeeUNI
on Employees.id = EmployeeUNI.id