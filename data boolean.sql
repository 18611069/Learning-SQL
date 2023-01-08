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

