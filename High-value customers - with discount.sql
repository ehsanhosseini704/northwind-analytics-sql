/*
Problem: High-Value Customers – Including Discounts

Description:
This query identifies high-value customers based on their total
spending after discounts are applied. A high-value customer is
defined as a customer whose combined order value in the year 2016,
including discounts, is $15,000 or more.

Changes from Previous Requirement:
- Discounts are now included in the order total calculation.
- Customer qualification is based on the discounted total amount.
- Results are ordered by the total discounted order value.

Scope:
- Only orders placed in the year 2016 are considered.
- Order totals include discounts when calculating customer spending.
- Aggregation is performed across all orders per customer.

Purpose:
The result of this query will be used for VIP customer selection
based on total discounted spending.
*/

 
Select
    Customers.CustomerID
    ,Customers.CompanyName
    ,TotalsWithoutDiscount = SUM(Quantity * UnitPrice)
    ,TotalsWithDiscount = SUM(Quantity * UnitPrice * (1- Discount))
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
Having sum(Quantity * UnitPrice * (1- Discount)) > 10000
Order by TotalsWithDiscount DESC;
