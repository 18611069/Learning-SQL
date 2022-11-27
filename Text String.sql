--- Concatenations ---
# note: SQL server support + instead of || #
SELECT ComapanyName, ContactName, CompanyName || '(' || ContactName || ')'
FROM customers
# resultnya misal company name= Vivi dan ContactName= Z jadinya Vivi(Z) #

--- Trimming Strings ---
TRIM
RTRIM
LTRIM

SELECT TRIM ("    You the best.   ") AS TrimmedString;

--- Substring ---
# returns the specified number of characters from a particular position of given string #
# allow you to pull apart just a portion of the string that you're looking at #

### rumus ###
SUBSTR(string name, string position, number of character to be returned);

SELECT first_name, SUBSTR(first_name, 2, 3)
FROM employees
WHERE department_id=60;
# ex: first name = Diana, substr = ian. first name = Alexander, substr = lex #

SELECT first_name, SUBSTR(first_name, 3, 4)
FROM employees
WHERE department_id=100;
# ex: first name = Nancy, substr = ncy. first name = Margaret, substr = rgar #

--- UPPER AND LOWER ---
SELECT UPPER(column_name) FROM table_name;

SELECT LOWER(column_name) FROM table_name;

SELECT UCASE(column_name) FROM table_name;
