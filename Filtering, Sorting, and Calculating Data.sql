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

SELECT distinct
	Customer_ID, 
    count(distinct Product) jenis_barang,
    avg(Average_Transaction_Amount) rata_rata_transaksi,
    sum(Count_Transaction) total_transaksi
FROM data_retail
GROUP BY 1
ORDER by 4 desc;
# jenis_barang (count of products type=> 1,2,3) #

SELECT
 Customer_ID,
 Product,
 Last_Transation,
 from_unixtime(Last_Transation/1000) timestamp_transaction,
 date(from_unixtime(Last_Transation/1000)) date_transaction, --untuk mendapatkan data tanggal transaksi--
 EXTRACT(month from (from_unixtime(Last_Transation/1000))) month_transaction, --Untuk mendapatkan data bulan atau tahun, dapat menggunakan perintah EXTRACT--
 EXTRACT(YEAR_MONTH from (from_unixtime(Last_Transation/1000))) -- result: 201612--
  year_month_transaction,
 sum(Count_transaction) total_pembelian_produk
FROM
 data_retail
GROUP BY
 1,2,3,4,5,6
 # "EXTRACT(date from timestamp)" akan mengeluarkan data berupa tanggal,ex:2016-12-10 #
 # "EXTRACT(monthyear from timestamp)" akan mengeluarkan data berupa bulan dan tahun transaksi#
 # data last transaction dibawah merupakan data epoch, angka 1531280000000 dibawah ini merupakan data dalam format milliseconds, maka dari itu last_transaction akan dibagi dengan 1000 untuk mendapatkan angka dalam jumlah detik#
 
 ------------ penjualan tertinggi & terendah 3 bulan teratas produk 'Sepatu' pada tahun 2018 - 2019 ------------
 SELECT 
	EXTRACT(YEAR_MONTH from (from_unixtime(last_transaction/1000))) year_month_transaction,
   	sum(Count_Transaction) total_pembelian_produk
FROM
	data_retail
WHERE 
	Product = 'sepatu' AND
    EXTRACT(YEAR from (from_unixtime(Last_Transaction/1000))) in (2019, 2018)
GROUP BY
	1
ORDER BY 
	2 desc
LIMIT 
	3

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
