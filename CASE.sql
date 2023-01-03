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


SELECT MONTH(order_date) AS order_month, sum(item_price) AS total_price, 
CASE
	WHEN sum(item_price) >= 30000000000 THEN 'Target Achieved'
    WHEN sum(item_price) <= 25000000000 THEN 'Less Performed'
    ELSE 'Follow Up'
END as remark
FROM sales_retail_2019
GROUP BY MONTH(order_date);


## Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, avg(total) as avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;
## Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'   
    ELSE 'Medium'  
END as kategori 
FROM tr_penjualan;
