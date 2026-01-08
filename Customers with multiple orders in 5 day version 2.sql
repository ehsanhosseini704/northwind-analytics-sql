/*
Problem: Customers with Multiple Orders in a 5-Day Period – Version 2

Description:
This query identifies customers who placed multiple orders
within a 5-day period using window functions.
*/

With NextOrderDate as (
    Select
        CustomerID
        ,OrderDate = convert(date, OrderDate)
        ,NextOrderDate =
            convert(
                date
                ,Lead(OrderDate,1)
                    OVER (Partition by CustomerID order by CustomerID,
OrderDate)
                )
    From Orders
)
Select
    CustomerID
    ,OrderDate
    ,NextOrderDate
    ,DaysBetweenOrders = DateDiff (dd, OrderDate, NextOrderDate)
From NextOrderDate
Where
    DateDiff (dd, OrderDate, NextOrderDate)  <= 5