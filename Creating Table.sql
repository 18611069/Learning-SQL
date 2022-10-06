# Example: Creating table Shoes #
CREATE TABLE Shoes
(
Id char (10) PRIMARY KEY,
Brand char (10) NOT NULL,
Color char (250) NOT NULL,
Price decimal (8,2) NOT NULL,
Desc Varchar (750) NULL
);

Note:
- Primary keys must have a value



# Example: Adding data to the table #
INSERT INTO Shoes
VALUES ('123456',
        'Chanel',
        'White',
        '695.00',
        NULL);

Note:
- Price is in decimal



# Example with specific columns #
INSERT INTO Shoes
        (Id,
         Brand,
         Color,
         Price,
         Desc)
VALUES ('123456',
        'Chanel',
        'White',
        '695.00',
        NULL);



# Example: Creating temporary table #
Note: -Temporary table will be deleted when current session is terminated,
- You use temporary tables to simplify by creating a subset, and then joining to that subset, and derive a new calculation.

CREATE TEMPORARY TABLE Sandals AS
(
SELECT * FROM shoes,
WHERE shoe_type = 'sandals'
)



# Adding Comments #
> Mute brand_id
SELECT shoe_id
--, brand_id
, shoe_name
from shoes

> Mute brand_id and shoe_name
SELECT shoe_id
/*, brand_id
, shoe_name
*/
from shoes

> Longer example
-- Selecting the average amount for shirts
SELECT avg(c.Shirt_amount)
-- Joining to the customer table and the dates table so we can provide filters.
FROM Shirt c INNER JOIN Customer m ON c.shirt_nbr = m.shir_nbr
                INNER JOIN dates dt ON c.date_skey = dt.date_skey
--Filtering on dates for 2014 and filtering
WHERE date_yyyymm between '201401' AND '201412'
--- Need to create the customers age from their date of birth
            AND YEAR(CURRENT DATE - Customer_DOB) >=0
            AND YEAR(CURRENT DATE - Customer_DOB) < 19
            AND c.sbtk = 1
            AND c.category in ('A', '9')
-- Ordering it by random
ORDER BY rand()
    FETCH first 10000 rows only;
    

source : Coursera
