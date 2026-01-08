/*
Problem: Late Orders vs. Total Orders – Percentage

Description:
This query calculates the percentage of late orders relative
to the total number of orders for each employee.
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
    ,LateOrders = IsNull(LateOrders.TotalOrders, 0)
    ,PercentLateOrders =
        (IsNull(LateOrders.TotalOrders, 0) * 1.00) / AllOrders.TotalOrders
From Employees
    Join AllOrders
        on AllOrders.EmployeeID = Employees.EmployeeID
    Left Join LateOrders
on LateOrders.EmployeeID = Employees.EmployeeID