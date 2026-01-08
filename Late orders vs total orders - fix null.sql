/*
Problem: Late Orders vs. Total Orders – Fix NULL Values

Description:
This query replaces NULL values in the late orders count
with 0, ensuring accurate reporting for all employees.
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
From Employees
    Join AllOrders
        on AllOrders.EmployeeID = Employees.EmployeeID
    Left Join LateOrders
        on LateOrders.EmployeeID = Employees.EmployeeID