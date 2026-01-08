/*
Problem: First Order in Each Country

Description:
This query retrieves the first order placed in each country,
returning one row per ShipCountry with the corresponding
CustomerID, OrderID, and OrderDate, ordered by OrderID.
*/
with OrdersByCountry as
(
    Select
        ShipCountry
        ,CustomerID
        ,OrderID
        ,OrderDate = convert(date, OrderDate)
        ,RowNumberPerCountry = 
            Row_Number()
                over (Partition by ShipCountry Order by ShipCountry, OrderID)
    From Orders
)
Select
    ShipCountry
    ,CustomerID
    ,OrderID
    ,OrderDate
From OrdersByCountry
Where
    RowNumberPerCountry = 1
Order by
    ShipCountry
