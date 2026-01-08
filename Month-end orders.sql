/*
Problem: Month-End Orders

Description:
This query retrieves all orders that were placed on the last
day of their respective months. The purpose is to analyze
ordering patterns at month-end, when salespeople may push
harder to meet their monthly sales quotas.

Scope:
- Only orders placed on the final calendar day of each month
  are included.
- The query applies this logic across all available dates.

Output Requirements:
- Results are ordered by EmployeeID and OrderID.

Purpose:
The result of this query will be used to evaluate sales activity
and performance trends at the end of each month.
*/

Select
EmployeeID
,OrderID
,OrderDate
From Orders
Where OrderDate = EOMONTH(OrderDate )
Order by
EmployeeID
,OrderID
