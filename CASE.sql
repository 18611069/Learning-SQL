CASE input_expression
  WHEN when_expression THEN result_expression [...n]
  [ ELSE else_result_expression ]
END

CASE
WHEN C1 THEN E1
WHEN C2 THEN E2
...
ELSE [result else]
END

### Ex: there are employeeid, firstname, lastname, city(jkt, sby, calgary,etc), and calgary(other/calgary) as new column columns ###
# reclassify my city. If calgary = calgary, not calgary = other #
SELECT employeeid, firstname, lastname, city,
CASE City
  WHEN 'Calgary' THEN 'Calgary'
ELSE 'Other'
  END calgary
FROM Employees
ORDER BY LastName, FirstName;

### Ex: there are track id, name, and bytes columns #
# categorize the bytes into new column 'bytescategory'#
SELECT trackid, name, bytes
CASE WHEN bytes < 300000 THEN 'small'
WHEN bytes >= 300001 AND bytes <= 500000 THEN 'medium'
WHEN bytes >= 500001 THEN 'large'
ELSE 'other'
END bytescategory
FROM tracks;
