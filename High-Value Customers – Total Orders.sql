/*
Problem: High-Value Customers – Total Orders

Description:
This query identifies high-value customers based on their total
spending across all orders. A high-value customer is defined as
a customer whose combined order value in the year 2016 is
$15,000 or more, excluding any discounts.

Changes from Previous Requirement:
- Instead of requiring at least one single order of $10,000 or more,
  this version calculates the total value of all orders per customer.
- Customers qualify if their aggregated order total in 2016
  reaches or exceeds $15,000.

Scope:
- Only orders placed in the year 2016 are considered.
- Order totals are calculated before discounts are applied.

Purpose:
The result of this query will be used for VIP customer selection
based on total annual spending.
*/

Select
    Customers.CustomerID
    ,Customers.CompanyName
    --,Orders.OrderID
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
    --,Orders.Orderid
Having sum(Quantity * UnitPrice) > 15000
Order by TotalOrderAmount desc;
