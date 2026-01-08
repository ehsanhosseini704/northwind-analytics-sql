/*
Problem: Customers with Multiple Orders in a 5-Day Period

Description:
This query identifies customers who placed more than one
order within any 5-day period, helping salespeople advise
customers on reducing freight costs by consolidating orders.
*/

Select
    InitialOrder.CustomerID
    ,InitialOrderID = InitialOrder.OrderID
    ,InitialOrderDate = convert(date, InitialOrder.OrderDate)
    ,NextOrderID = NextOrder.OrderID
    ,NextOrderDate = convert(date, NextOrder.OrderDate)
    ,DaysBetween = datediff(dd, InitialOrder.OrderDate,
NextOrder.OrderDate)
from Orders InitialOrder
    join Orders NextOrder
        on InitialOrder.CustomerID = NextOrder.CustomerID
where
    InitialOrder.OrderID < NextOrder.OrderID
    and datediff(dd, InitialOrder.OrderDate, NextOrder.OrderDate) <= 5
Order by
    InitialOrder.CustomerID
    ,InitialOrder.OrderID
