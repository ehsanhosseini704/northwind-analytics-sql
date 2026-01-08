/*
Problem: Orders – Accidental Double Entry

Description:
This query identifies orders that may contain accidentally
duplicated line items entered with different ProductIDs but
the same quantity (60 or more). Results are ordered by OrderID.
*/


Select
OrderID
From OrderDetails
Where Quantity >= 60
Group By
OrderID
,Quantity
Having Count(*) > 1
