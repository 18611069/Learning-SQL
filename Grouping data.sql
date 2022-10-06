# GROUP BY (every column is SELECT must be present in a GROUP BY clause except for aggregated function)#
SELECT Region, COUNT(CustomerID) AS total_customers
FROM Customers
GROUP BY Region;

# HAVING #
SELECT CustomerID, COUNT(*) AS orders
From Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 2; #only selecting those customers who had orders >=2#


--- SELECT, FROM, WHERE, ORDER BY, GROUP BY, HAVING ---

SELECT SupplierID, COUNT(*) AS Num_Prod
FROM Products
WHERE UnitPrice >=4
GROUP BY SupplierID
HAVING COUNT(*) >= 2;
