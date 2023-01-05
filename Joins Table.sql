select * from ms_item_kategori, ms_item_warna
where nama_barang=nama_item;

------------ Cartesian (Cross) Join -----------
# Cross Joins => EACH row from the first table joins with ALL the rows of another table 
# Ex : 1st table (1, 2, 3), 2nd table (a, b, c) => 1a, 1b, 1c, 2a, 2b, 2c, 3a, 3b, 3c #

SELECT product_name, unit_price, company_name
FROM suppliers CROSS JOIN products
# Note : table 1 = suppliers, table 2 = products #
# output will be 1st table (29 records) multiplied by the number of rows in the 2nd table (77 records) = 2233 records #


------------ Inner Joins ------------
# select records that have matching values in both tables #

SELECT suppliers.CompanyName, ProductName, UnitPrice
FROM Suppliers INNER JOIN Products
ON Suppliers.supplierid = Products.supplierid
# Note : ON(tablename.tablecolumnname) #

SELECT o.OrderID, c.CompanyName, e.LastName
FROM ((Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID)
INNER JOIN Employeees e ON o.Employee.ID = e.EmployeeID);

------------ Left Join -------------
# Returns all records from the left table (table1) and the matched records from the right table (table2) #
# if there is no match, the results is NULL from the right side #

SELECT C.CustomerName, O.OrderID
FROM Customer C
LEFT JOIN Orders O ON C.CustomerID = O.Customer.ID
ORDER BY C.CustomerName;

select * from ms_item_kategori a inner join ms_item_warna b on a.nama_item=b.nama_barang


------------- Right Join -------------
# Returns all records from the right table (table2) and the matched records from the left table (table1) #
# if there is no match, the results is NULL from the left side #

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.Employee.ID
ORDER BY Orders.OrderID


------------- Full Outer Join ------------
# Returns all records when there is a match in either left (table1) or right (table2) table records #
# "Hey, just return and give me everything, whether there's a matching one or matching two." #

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
# Note : will selects all customers and all orders #
