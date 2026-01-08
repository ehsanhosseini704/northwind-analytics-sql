/*
Problem: Orders with Many Line Items

Description:
This query retrieves sample orders that contain a large number
of individual line items. The goal is to help the Northwind mobile
app development team test and validate the app’s ability to
correctly display large and complex orders.

Scope:
- Each line item represents a single product entry within an order.
- The total number of line items is calculated per order.

Output Requirements:
- Return the top 10 orders with the highest number of line items.
- Results are ordered by the total line item count in descending order.

Purpose:
The result of this query will be used for testing and quality
assurance of the order display functionality in the mobile app.
*/

Select top 10
Orders.OrderID
,TotalOrderDetails = count(*)
From Orders
Join OrderDetails
on Orders.OrderID = OrderDetails.OrderID
Group By Orders.OrderID
Order By count(*) desc
