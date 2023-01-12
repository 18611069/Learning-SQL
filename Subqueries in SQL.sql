# subqueries is queries embedded into other queries (a query inside other query) #

SELECT CustomerID, CompanyName, Region
FROM Customers
WHERE customerID in (SELECT CustomerID FROM Orders WHERE Freight > 100);

# Note : SELECT only a single column (can't retrieve all columns (*)) #

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
