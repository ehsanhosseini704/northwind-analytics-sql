/*
Problem: Countries with Suppliers or Customers – Version 3

Description:
This query returns each country along with the total number
of suppliers and total number of customers based in that country.
*/

With SupplierCountries as
(Select Country , Total = Count(*) from Suppliers group by Country)
,CustomerCountries as
(Select  Country , Total = Count(*) from Customers group by Country)
Select
Country = isnull( SupplierCountries.Country, CustomerCountries.Country)
,TotalSuppliers= isnull(SupplierCountries.Total,0)
,TotalCustomers= isnull(CustomerCountries.Total,0)
From SupplierCountries
Full Outer Join CustomerCountries
on CustomerCountries.Country = SupplierCountries.Country
