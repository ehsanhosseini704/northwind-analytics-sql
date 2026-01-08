/*
Problem: Countries with Suppliers or Customers – Version 2

Description:
This query provides a detailed view of countries that have
suppliers and/or customers, including additional summary
information as shown in the expected results.
*/

With SupplierCountries as
(Select Distinct Country from Suppliers)
,CustomerCountries as
(Select Distinct Country from Customers)
Select
SupplierCountry = SupplierCountries .Country
,CustomerCountry = CustomerCountries .Country
From SupplierCountries
Full Outer Join CustomerCountries
on CustomerCountries.Country = SupplierCountries.Country
