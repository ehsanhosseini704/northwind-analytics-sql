/*
Problem: Late Orders – Which Employees?

Description:
This query identifies salespeople whose orders arrive late
most frequently, in order to evaluate performance and
training needs.
*/

Select
Employees.EmployeeID
,LastName
,TotalLateOrders = Count(*)
From Orders
Join Employees
on Employees.EmployeeID = Orders.EmployeeID
Where
RequiredDate <= ShippedDate
Group By
Employees.EmployeeID
,Employees.LastName
Order by TotalLateOrders desc
