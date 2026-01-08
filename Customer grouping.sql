/*
Problem: Customer Grouping

Description:
This query groups customers based on their total order
amount in 2016 for targeted sales campaigns. Customers
are categorized into predefined spending ranges and only
those with at least one order in 2016 are included. Results
are ordered by CustomerID.
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
    ,CustomerGroup =
        Case
            when TotalOrderAmount between 0 and 1000 then 'Low'
            when TotalOrderAmount between 1001 and 5000 then 'Medium'
            when TotalOrderAmount between 5001 and 10000 then 'High'
            when TotalOrderAmount > 10000 then 'Very High'
        End
from Orders2016
Order by CustomerID
