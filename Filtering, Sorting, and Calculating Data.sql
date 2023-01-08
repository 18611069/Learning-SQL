------------ FILTERING DATA ------------

# WHERE Clause Operators #

      SELECT column_name, column_name
      FROM table_name
      WHERE column_name operators value;
      
Note:
operators value ( =, <>, >, <, <=, >=, BETWEEN, IS NULL)

> Examples
SELECT ProductName, UnitPrice, SupplierID
FROM Products
WHERE ProductName = 'Tofu';

SELECT ProductName, UnitPrice, SupplierID
FROM Products
WHERE ProductName <> 'Anna Frozen';

SELECT ProductName, UnitPrice, SupplierID
FROM Products
WHERE UnitPrice >= 75;

SELECT ProductName, UnitPrice, SupplierID, UnitsInStock
FROM Products
WHERE UnitInStock BETWEEN 15 AND 90;

SELECT ProductName, UnitPrice, SupplierID, UnitsInStock
FROM Products
WHERE ProductName IS NULL;



# IN, OR, XOR and NOT Clause Operators #

> IN examples ( always use () ) < 

SELECT ProductName, UnitPrice, SupplierID, UnitsInStock
FROM Products
WHERE SupplierID IN (9, 10, 11);


> OR examples (will not  evaluate the second conditions in a WHERE if first condition is met) < 

SELECT ProductName, UnitPrice, SupplierID, UnitsInStock
FROM Products
WHERE ProductName = 'Tofu' OR 'Soy';


> OR with AND examples <

SELECT ProductName, UnitPrice, SupplierID, UnitsInStock
FROM Products
WHERE (SupplierID = 9 OR SupplierID = 11)
AND UnitPrice > 15;


> NOT example <

SELECT * FROM Employees
WHERE NOT City='London' AND NOT City='Seattle';

> Logika XOR (exclusive - or) digunakan untuk membandingkan dua nilai dimana jika kedua nilai sama-sama benar atau sama-sama salah, maka akan menghasilkan nilai FALSE <
SELECT 
    customer_id,
    product,
     Average_Transaction_Amount,
    product = 'Jaket' XOR average_transaction_amount > 1000000 logika_xor
FROM data_retail;
#Operator XOR di atas menghasilkan nilai 1 ketika: Produk yang dibeli adalah jaket dan rata-rata transaksi tidak lebih dari 1 juta. Produk yang dibeli bukan merupakan jaket dan rata-rata transaksi lebih dari 1 juta. #
# Operator XOR akan menghasilkan nilai 0 ketika: Produk yang dibeli adalah jaket dan rata-rata transaksi lebih dari 1 juta. Produk yang dibeli bukan merupakan Jaket dan rata-rata transaksi kurang dari 1 juta. #

------------ SORTING DATA ------------

SELECT something
FROM database
ORDER BY characteristic

Note:
ORDER BY 2,3 means 2nd column and 3rd column
DESC descending
ASC ascending



------------ CALCULATING DATA ------------

> Multiplication example <

SELECT ProductID, UnitsOnOrder, UnitPrice,
UnitsOnOrder * UnitPrice AS Total_Order_Cost
FROM Products;


> Combining Math Operation example <

SELECT ProductID, Quantity, UnitPrice, Discount,
(UnitPrice - Discount)/Quantity AS Total_Cost
FROM OrderDetails;



source: Coursera
