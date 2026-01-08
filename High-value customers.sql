/*
Problem: High-Value Customers (VIP Selection)

Description:
This query identifies high-value customers who are eligible to receive
a special VIP gift. A high-value customer is defined as a customer who
has placed at least one order in the year 2016 with a total order value
of $10,000 or more, excluding any discounts.

Scope:
- Only orders created in the year 2016 are considered.
- Order total is calculated before applying discounts.
- Each customer must have at least one qualifying order.

Purpose:
The result of this query will be used for VIP customer targeting.
*/

Select
    Customers.CustomerID
    ,Customers.CompanyName
    ,Orders.OrderID
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
    ,Orders.Orderid
Having Sum(Quantity * UnitPrice) > 10000
Order by TotalOrderAmount DESC
