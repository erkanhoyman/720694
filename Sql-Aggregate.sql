--Aggregate Fonksiyonlarý

--count : Gerçekleþtirilen iþlem sayýsýný verir.
--sum   : Seçilen kolondaki toplam deðeri verir.
--max   : Seçilen kolondaki maksimum deðeri verir.
--min   : Seçilen kolondaki minimum deðeri verir.
--avg   : Seçilen kolondaki ortalama deðeri verir.

--Geriye tek bir sonuç döndürür.

select count(Id) from Categories

select count(Id) as Sayýsý from Categories

--Count, saydýrdýðýmýz kolon deðeri NULL olan kayýtlarý saymayacaktýr. Bu nedenle genelde Not null kolonlarý saydýrýrýz.

select count(*) as UrunSayýsý from Products -- * : Toplam kayýt sayýsýný verir.

--Stoðumuzdaki ürünlerin toplam adedini veren sorgu.
select sum(UnitsInStock) as ToplamÜrün from products

--Stoðumuzdaki ürünlerin ortalama fiyatýný gösteren sorgu.
Select Avg(Price) as OrtalamaFiyat from Products
--Stok deðeri en fazla olan ürünün toplam stok deðerini gösteren sorgu.
select Max(Price*UnitsInStock) as MaxStokDeðeri from Products
--Stok deðeri en az olan ürünün stok miktarýný gösteren sorgu.
select Min(UnitsInStock) as MinStok from Products

select * from Products

--Stoðumuzun toplam deðerini gösteren sorgu.
select Sum(Price*UnitsInStock) as ToplamStokDeðeri from Products

--Elimizde kaç farklý kazak olduðunu gösteren sorgu(Kategorisi Kazaklar (2) olanlarýn sayýsý).

select Count(*) as Sayýsý from Products where CategoryId=2

--Kategorilere göre ürünlerin sayýsýný CategoryId ile birlikte gösteren sorgu.

select CategoryId, count(*) as Sayýsý from Products group by CategoryId

--Ürün sayýsý 4 ten az olan kategorilerin ürün sayýlarýný CategoryId ile birlikte gösteren sorgu.
select CategoryId, count(*) as Sayýsý from Products group by CategoryId having count(*) < 4  --gruplamadan sonra filtre, þart uygulamak için having kullanýyoruz.

select CategoryId, count(*) as Sayýsý from Products where Price >= 70 group by CategoryId having count(*) < 4 --Önce Fiyatý 70 yada daha fazla ürünler filtrelenir, daha sonra bu ürünlere group by uygulanýr, daha sonra oluþan gruplara having ile filtre uygulanýr.

--where, group by olan sorgularda group by dan önce kullanýlýr ve tablonun geneline filtre uygular, group by sonra devreye girer.