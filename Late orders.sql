/*
Problem: Late Orders

Description:
This query identifies orders that were delivered later than
their required delivery date.
*/


Select
OrderID
,OrderDate = convert(date, OrderDate)
,RequiredDate = convert(date, RequiredDate)
,ShippedDate = convert(date, ShippedDate)
From Orders
Where
RequiredDate <= ShippedDate
