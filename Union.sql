# to COMBINE the result-set of two or more SELECT statement #
# each SELECT statement within UNION must have the same number of columns #
# columns must have similar data types #
# the columns in each SELECT statement must be in the same order #
# If table 1 (names(kim,jung,jeon,lee,ahn), operator(sk, lg, naver, k2, kakao)) & table 2 (names(kim,jung,jeon,lee,han), hp(ip, samsung, oppo, huawei, LG))==> will be 6 rows#

select kode_produk, nama_produk,harga
from ms_produk_1
where harga < 100000
union
select kode_produk, nama_produk,harga
from ms_produk_2
where harga < 50000

select * from tabel_a
union
select * from tabel_b;

select * from tabel_a
where kode_produk='prod-04'
union
select * from tabel_b
where kode_produk='prod-04';

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

select customername, contactname, city, postalcode
from customers
union
select suppliername, contactname, city, postalcode
from suppliers;
