# subqueries is queries embedded into other queries (a query inside other query) #

SELECT CustomerID, CompanyName, Region
FROM Customers
WHERE customerID in (SELECT CustomerID FROM Orders WHERE Freight > 100);

# Note : SELECT only a single column (cant retrieve all columns (*)) #

SELECT Costumer_name, Costumer_contact
FROM Customers
WHERE cust_id IN 
    SELECT customer_id
    FROM Orders
    WHERE order_number IN (SELECT order_number
       FROM OrderItems
          WHERE prod_name = 'Toothbrush');
          


------------ SUBQUERIES FOR CALCULATION ------------

SELECT COUNT (*) AS orders
FROM Orders
WHERE customer_id = '12345';

SELECT customer_name, customer_state
  (SELECT COUNT (*) AS orders
  FROM Orders
  WHERE Orders.customer_id = Customer.customer_id) AS orders
FROM customers
ORDER BY Customer_name;


Subquery harus berada dalam tanda kurung
Subquery hanya dapat memiliki satu kolom pada klausa SELECT.
Subquery yang menghasilkan nilai lebih dari satu hanya dapat digunakan dalam operator IN

--- single row subquery in where query ---
select id, count_transaction
from data_retail
where count_transaction > (select avg(count_transaction) avg_transaction from data_retail)

--- multiple row subquery usually used in IN, ANY, ALL query---
# ex: jika ingin mendapatkan siapa saja customer yang membeli sepatu dan juga membeli tas #
select distinct customer_id
where product = 'sepatu'
      customer_id IN (select distinct customer_id from data_retail where product = 'tas')
      
--- Correlated Subquery ---
select distinct customer_id
where product = 'sepatu'
and customer_id IN (select distinct customer_id from data_retail where product = 'tas')
