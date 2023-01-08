SELECT Distinct
	Customer_ID, Product,
    Average_transaction,
    Average_transaction >= 1000000 is_eligible
FROM summary_transaction;
# the results show columns including new column (is_eligible (1, 0) #

# Beberapa versi SQL seperti MS SQL Server, atau MySQL 5.7 tidak memiliki tipe data boolean, tetapi tipe data ini dapat digantikan dengan tipe data lain seperti bit atau tinyint. #

--- retrieve all is_eligible = 1 ---
SELECT Distinct
	Customer_ID, Product,
    Average_transaction,
    Average_transaction >= 1000000 is_eligible
FROM summary_transaction
where (Average_transaction >= 1000000)= '1';

SELECT
	Customer_ID, Product, average_transaction_amount,
    product = 'jaket' AND average_transaction_amount >= 1000000 loyal_buyer_jaket
FROM data_retail
WHERE product = 'jaket'

SELECT 
     customer_id, 
     product, 
     average_transaction_amount,
     product = 'jaket' OR product = 'baju' buyer_fashion
FROM data_retail;
# nilai 1 ketika produk yang dibeli merupakan jaket atau baju. Namun, ketika customer membeli produk tas atau sepatu, maka akan bernilai 0 #

