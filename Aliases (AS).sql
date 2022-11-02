------------ Aliases and Self Joins --------------
# SQL aliases give a table or a column a temporary name #

# before AS #
SELECT vendor_name, product_name, product_price
FROM Vendors, Products
WHERE Vendors.vendor_id = Products.vendor_id;

# using AS #
SELECT vendor_name, product_name, product_price
FROM Vendors AS v, Products AS p
WHERE v.vendor_id = p.vendor_id;

SELECT column_name(s)
FROM table1 T1, table2 T2
WHERE condition;

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
Where A.CustomerID = B.CustomerID
AND A.City = B.City
ORDER BY A.City;
