# GROUP BY (every column is SELECT must be present in a GROUP BY clause except for aggregated function)#
SELECT Region, COUNT(CustomerID) AS total_customers
FROM Customers
GROUP BY Region;

# HAVING #
SELECT CustomerID, COUNT(*) AS orders
From Orders
GROUP BY CustomerID
HAVING COUNT(*) >= 2; #only selecting those customers who had orders >=2#

SELECT customer_id 
FROM Subscription 
GROUP BY customer_id 
HAVING COUNT(customer_id)> 1; #the result is count of cust_id who had cust_id >1#


--- SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY ---

select product_id, avg(pinalty), count(customer_id) as total
from invoice
group by product_id
having count(customer_id)>20;

SELECT 
	customer_id,
    product_id,
    subscription_date
FROM Subscription 
WHERE customer_id IN 
	(SELECT 
    	customer_id 
     FROM Subscription 
     GROUP BY customer_id 
     HAVING COUNT(customer_id) > 1
  	) 
ORDER BY customer_id ASC;

SELECT b.name,
	   b.address,
       b.phone, 
       a.product_id, 
       a.subscription_date 
FROM subscription a 
JOIN customer b 
ON a.customer_id=b.id
WHERE b.id IN 
(
	SELECT 
    	customer_id 
        FROM Subscription 
    GROUP BY customer_id 
    HAVING COUNT(customer_id) > 1
) 
ORDER BY b.id ASC;


SELECT SupplierID, COUNT(*) AS Num_Prod
FROM Products
WHERE UnitPrice >=4
GROUP BY SupplierID
HAVING COUNT(*) >= 2;

select product_id, max(total_price) as total from invoice group by product_id;

select product_id, max(total_price) as total from invoice group by product_id having max(total_price) > 1000000;

select product_id, max(pinalty) as total from invoice group by product_id having max(pinalty) > 30000;
