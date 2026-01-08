/*
Problem: Late Orders vs. Total Orders – Missing Employee

Description:
This query ensures that all employees who have taken orders
are included in the results, even if they have no late orders.
*/

With LateOrders as (
    Select
        EmployeeID
        ,TotalOrders = Count(*)
    From Orders
    Where
        RequiredDate <= ShippedDate
    Group By
        EmployeeID
)
, AllOrders as (
    Select
        EmployeeID
        ,TotalOrders = Count(*)
    From Orders
    Group By
        EmployeeID
)
Select
    Employees.EmployeeID
    ,LastName
    ,AllOrders = AllOrders.TotalOrders
    ,LateOrders = LateOrders.TotalOrders
From Employees
    Join AllOrders
        on AllOrders.EmployeeID = Employees.EmployeeID
    Left Join LateOrders
on LateOrders.EmployeeID = Employees.EmployeeID
