select * from ms_item_kategori, ms_item_warna
where nama_barang=nama_item;

# jika akan menggabungkan kedua tabel, dengan menyatakan tabel ms_item_warna terlebih dahulu di bagian FROM, tetapi yang ingin dimunculkan kolomnya di awal hasil adalah dari yang ms_item_kategori, maka querynya akan menjadi sebagai berikut.#
select ms_item_kategori.*,ms_item_warna.* from ms_item_warna, ms_item_kategori where nama_barang=nama_item;

------------ Cartesian (Cross) Join -----------
# Cross Joins => EACH row from the first table joins with ALL the rows of another table 
# Ex : 1st table (1, 2, 3), 2nd table (a, b, c) => 1a, 1b, 1c, 2a, 2b, 2c, 3a, 3b, 3c #

SELECT product_name, unit_price, company_name
FROM suppliers CROSS JOIN products
# Note : table 1 = suppliers, table 2 = products #
# output will be 1st table (29 records) multiplied by the number of rows in the 2nd table (77 records) = 2233 records #

select * from ms_item_kategori, ms_item_warna;


------------ Inner Joins ------------
# select records that have matching values in both tables #

SELECT suppliers.CompanyName, ProductName, UnitPrice
FROM Suppliers INNER JOIN Products
ON Suppliers.supplierid = Products.supplierid
# Note : ON(tablename.tablecolumnname) #

SELECT o.OrderID, c.CompanyName, e.LastName
FROM ((Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID)
INNER JOIN Employeees e ON o.Employee.ID = e.EmployeeID);

select distinct ms_pelanggan.kode_pelanggan, ms_pelanggan.nama_customer, ms_pelanggan.alamat
from ms_pelanggan
inner join tr_penjualan
on ms_pelanggan.kode_pelanggan=tr_penjualan.kode_pelanggan
where tr_penjualan.nama_produk = 'Kotak Pensil DQLab' or tr_penjualan.nama_produk ='Flashdisk DQLab 32 GB' or tr_penjualan.nama_produk ='Sticky Notes DQLab 500 sheets';

------------ Left Join -------------
# Returns all records from the left table (table1) and the matched records from the right table (table2) #
# if there is no match, the results is NULL from the right side #
# if left table (id(1,2,3,4), kurs(usd, sgd, eur, aud) & right table (id(1,2,3,4,5), kurs(1,2,3,4,2), kurs_value(1000,2000,2000,1400,2444)) ==> the result table is 5#

SELECT C.CustomerName, O.OrderID
FROM Customer C
LEFT JOIN Orders O ON C.CustomerID = O.Customer.ID
ORDER BY C.CustomerName;

select * from ms_item_kategori a inner join ms_item_warna b on a.nama_item=b.nama_barang


------------- Right Join -------------
# Returns all records from the right table (table2) and the matched records from the left table (table1) #
# if there is no match, the results is NULL from the left side #
# if left table (id(1,2,3,4), kurs(usd, sgd, eur, aud) & right table (id(1,2,3,4,5), kurs(1,2,3,4,2), kurs_value(1000,2000,2000,1400,2444)) ==> the result table is 5#

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
