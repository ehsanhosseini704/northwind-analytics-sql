/*
Problem: Customer Grouping with Percentage

Description:
This query shows all customer groups along with the
percentage of customers in each group, ordered by the
total number of customers per group in descending order.
*/

with Orders2016 as (
    Select
        Customers.CustomerID
        ,Customers.CompanyName
        ,TotalOrderAmount = SUM(Quantity * UnitPrice)
    From Customers
        join Orders
            on Orders.CustomerID = Customers.CustomerID
        join OrderDetails
            on Orders.OrderID = OrderDetails.OrderID
    Where
        OrderDate >= '20160101'
        and OrderDate  < '20170101'
    Group By
        Customers.CustomerID
        ,Customers.CompanyName
)
,CustomerGrouping as (
    Select
        CustomerID
        ,CompanyName
        ,TotalOrderAmount
        ,CustomerGroup =
            case
                when TotalOrderAmount >= 0 and TotalOrderAmount  < 1000
then 'Low'
                when TotalOrderAmount >= 1000 and TotalOrderAmount  < 5000
then 'Medium'
                when TotalOrderAmount >= 5000 and TotalOrderAmount  <10000
then 'High'
                when TotalOrderAmount >= 10000 then 'Very High'
            end
    from Orders2016
    -- Order by CustomerID
)
Select
    CustomerGroup
    , TotalInGroup = Count(*)
    , PercentageInGroup = Count(*) * 1.0/ (select count(*) from
CustomerGrouping)
from CustomerGrouping
group by CustomerGroup
order by TotalInGroup  desc
