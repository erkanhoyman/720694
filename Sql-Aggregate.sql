--Aggregate Fonksiyonlar�

--count : Ger�ekle�tirilen i�lem say�s�n� verir.
--sum   : Se�ilen kolondaki toplam de�eri verir.
--max   : Se�ilen kolondaki maksimum de�eri verir.
--min   : Se�ilen kolondaki minimum de�eri verir.
--avg   : Se�ilen kolondaki ortalama de�eri verir.

--Geriye tek bir sonu� d�nd�r�r.

select count(Id) from Categories

select count(Id) as Say�s� from Categories

--Count, sayd�rd���m�z kolon de�eri NULL olan kay�tlar� saymayacakt�r. Bu nedenle genelde Not null kolonlar� sayd�r�r�z.

select count(*) as UrunSay�s� from Products -- * : Toplam kay�t say�s�n� verir.

--Sto�umuzdaki �r�nlerin toplam adedini veren sorgu.
select sum(UnitsInStock) as Toplam�r�n from products

--Sto�umuzdaki �r�nlerin ortalama fiyat�n� g�steren sorgu.
Select Avg(Price) as OrtalamaFiyat from Products
--Stok de�eri en fazla olan �r�n�n toplam stok de�erini g�steren sorgu.
select Max(Price*UnitsInStock) as MaxStokDe�eri from Products
--Stok de�eri en az olan �r�n�n stok miktar�n� g�steren sorgu.
select Min(UnitsInStock) as MinStok from Products

select * from Products

--Sto�umuzun toplam de�erini g�steren sorgu.
select Sum(Price*UnitsInStock) as ToplamStokDe�eri from Products

--Elimizde ka� farkl� kazak oldu�unu g�steren sorgu(Kategorisi Kazaklar (2) olanlar�n say�s�).

select Count(*) as Say�s� from Products where CategoryId=2

--Kategorilere g�re �r�nlerin say�s�n� CategoryId ile birlikte g�steren sorgu.

select CategoryId, count(*) as Say�s� from Products group by CategoryId

--�r�n say�s� 4 ten az olan kategorilerin �r�n say�lar�n� CategoryId ile birlikte g�steren sorgu.
select CategoryId, count(*) as Say�s� from Products group by CategoryId having count(*) < 4  --gruplamadan sonra filtre, �art uygulamak i�in having kullan�yoruz.

select CategoryId, count(*) as Say�s� from Products where Price >= 70 group by CategoryId having count(*) < 4 --�nce Fiyat� 70 yada daha fazla �r�nler filtrelenir, daha sonra bu �r�nlere group by uygulan�r, daha sonra olu�an gruplara having ile filtre uygulan�r.

--where, group by olan sorgularda group by dan �nce kullan�l�r ve tablonun geneline filtre uygular, group by sonra devreye girer.