# to COMBINE the result-set of two or more SELECT statement #
# each SELECT statement within UNION must have the same number of columns #
# columns must have similar data types #
# the columns in each SELECT statement must be in the same order #

select * from tabel_a
union
select * from tabel_b;

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;
