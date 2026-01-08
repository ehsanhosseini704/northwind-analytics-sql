/*
Problem: Customer Grouping – Fix NULL

Description:
This query fixes the customer grouping logic to ensure that
no NULL values appear in the CustomerGroup field.
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
        case
            when TotalOrderAmount >= 0 and TotalOrderAmount  < 1000 then
'Low'
            when TotalOrderAmount >= 1000 and TotalOrderAmount  < 5000
then 'Medium'
            when TotalOrderAmount >= 5000 and TotalOrderAmount  <10000
then 'High'
when TotalOrderAmount >= 10000 then 'Very High'
end
from Orders2016
Order by CustomerID
