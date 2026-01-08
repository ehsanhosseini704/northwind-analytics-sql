/*
Problem: Customer Grouping – Flexible

Description:
This query dynamically groups customers based on total
order amounts in 2016 using the CustomerGroupThreshold
table, allowing group boundaries to be changed without
modifying the SQL.
*/

with Orders2016 as (
    Select
        Customers.CustomerID
        ,Customers.CompanyName
        ,TotalOrderAmount = SUM(Quantity * UnitPrice)
    From Customers
        Join Orders
            on Orders.CustomerID = Customers.CustomerID
        Join OrderDetails
            on Orders.OrderID = OrderDetails.OrderID
    Where
        OrderDate >= '20160101'
        and OrderDate  < '20170101'
    Group by
        Customers.CustomerID
        ,Customers.CompanyName
)
Select
    CustomerID
    ,CompanyName
    ,TotalOrderAmount
    ,CustomerGroupName
from Orders2016
    Join CustomerGroupThresholds
        on Orders2016.TotalOrderAmount between
            CustomerGroupThresholds.RangeBottom and
CustomerGroupThresholds.RangeTop
Order by CustomerID