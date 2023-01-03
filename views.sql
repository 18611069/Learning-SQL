# A View can add or remove columns without changing the schema. You're not actually writing the query to the database or anything. What you're doing is you're just kind of storing it for the time being #
# creating a view of a table but not actually writing data to that table, so you avoid the limitations #
# creating a view of a table but not actually writing data to that table, so you avoid the limitations #

#Ex: count of how many territories each employee has #
CREATE VIEW my_view AS
SELECT r.regiondesctiption,
t.territorydescription,
e.Lastname,
e.Firstname,
e.Hiredate,
e.Reportsto
FROM Region r
INNER JOIN Terriotries t on r.regionid = t.regionid
INNER JOIN Employeeterriotries et on t.TerritoryID = et.TerritoryID
INNER JOIN Empolyees e on et.employeeid = e.EmployeeID

# To actually view the data though, you'll need to use a select statement #
SELECT * FROM my_view

# to delete #
DROP VIEW my_view;

----- count of how many territories each employee has -----
SELECT count(territorydescription), Firstname, Lastname
FROM my_view
GROUP BY Lastname, Firstname;
