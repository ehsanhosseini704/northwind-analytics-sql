/*
Problem: Countries with Suppliers or Customers

Description:
This query returns a list of all countries that have at least
one supplier and/or customer for business trip planning.
*/
Select Country From Customers
Union
Select Country From Suppliers
Order by Country
