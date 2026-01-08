/*
Problem: Late Orders vs. Total Orders – Fix Decimal

Description:
This query formats the late orders percentage by rounding
or truncating the value to two decimal places for improved
readability.
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
        Convert(
            Decimal (10,2)
            ,(IsNull(LateOrders.TotalOrders, 0) * 1.00) / AllOrders.TotalOrders
            )
From Employees
Join AllOrders
on AllOrders.EmployeeID = Employees.EmployeeID
Left Join LateOrders
on LateOrders.EmployeeID = Employees.EmployeeID
