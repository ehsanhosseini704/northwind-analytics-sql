/*
Problem: Orders – Accidental Double Entry Details

Description:
This query retrieves detailed order information for orders
that may contain accidentally duplicated line items, based
on the criteria defined in the previous query.
*/

with PotentialDuplicates as (
    Select
        OrderID
    From OrderDetails
    Where Quantity >= 60
    Group By OrderID, Quantity
    Having Count(*) > 1
    )
Select
    OrderID
    ,ProductID
    ,UnitPrice
    ,Quantity
    ,Discount
From OrderDetails
Where
    OrderID in (Select OrderID from PotentialDuplicates)
Order by
    OrderID
    ,Quantity
