/*
Problem: Orders – Random Assortment

Description:
This query retrieves a random sample of 2% of all orders
to support beta testing for the Northwind mobile app.
*/

Select top 2 percent
OrderID
From Orders
Order By NewID()
