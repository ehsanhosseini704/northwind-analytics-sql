/*
Problem: Late Orders vs. Total Orders

Description:
This query compares the number of late orders to the total
number of orders for each salesperson, providing a more
accurate view of late delivery performance.
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
    Join LateOrders
        on LateOrders.EmployeeID = Employees.EmployeeID