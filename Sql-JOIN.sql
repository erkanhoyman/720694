--Ýliþkilendirme (JOIN) - Çoklu Tablolar

--Birden fazla tabloyu ortak kolonlar üzerinden birbirine baðlamamýzý saðlar.

--inner join (join) : Ýliþkilendirilen tabloda ortak kolonun deðerine sahip olan kaydýn tüm kolonlarýna kullanma imkaný verir.
--outer join (left-right) : Tablolarýn ortak özellikleri henüz oluþmamýþ olsa dahi, türüne göre, soldaki veya saðdaki tablonun tüm kayýtlarýný getirir. Diðer tabloda boþ olan kolonlara Null deðeri atar.
--cross join : Ýliþkilendirilen tablolardan birindeki kayýtlarý, diðer tablodaki tüm kayýtlarla ayrý ayrý (çapraz) eþleþtirir.

 --Tablo1 inner join Tablo2 on Tablo1.ortakkolon = Tablo2.ortakkolon

 --Öðrenci bilgilerini SinifAdi ile birlikte listeleyen sorguyu yazýnýz.
 select Adi, Soyadi, Telefon, Adres, SinifAdi from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id

 select Ogrenciler.*, SinifAdi from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id

--Öðretmen bilgilerini Branþýyla birlikte gösteren sorgu.
select Adi, Soyadi, Bransi, Telefon from Ogretmenler inner join Branslar on Ogretmenler.BransId = Branslar.Id

--Yazýlým .Net branþýndaki eðitmenlerin iletiþim bilgilerini gösteren sorgu.
select Adi, Soyadi, Telefon, Adres from Ogretmenler inner join Branslar on Ogretmenler.BransId = Branslar.Id where Bransi='Yazýlým .Net'

--Yazýlým branþýndaki tüm eðitmenlerin iletiþim bilgilerini gösteren sorgu.
select Ogretmenler.Id, Adi, Soyadi, Telefon, Adres from Ogretmenler inner join Branslar on Ogretmenler.BransId = Branslar.Id where Bransi like 'Yazýlým%'

--Eðer her 2 tabloda da ayný isimle bulunan bir kolonu görüntülemek istersek bir çakýþma ('ambiguous column') hatasý alýrýz. Bunu gidermek için TabloAdý.Kolon þeklinde göstermeliyiz.

select o.Id, Adi, Soyadi, Telefon, Adres from Ogretmenler o inner join Branslar b on o.BransId = b.Id where Bransi like 'Yazýlým%'

--Sýnýflara göre öðrenci sayýlarýný SinifId'leriyle birlikte gösteren sorguyu yazýnýz.
select SinifId, count(*) as SýnýfMevcudu from Ogrenciler group by SinifId

--Sýnýflara göre öðrenci sayýlarýný SinifAd'larýyla birlikte gösteren sorguyu yazýnýz.
select SinifAdi, count(*) as SýnýfMevcudu from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id group by SinifAdi

--Öðrenci bilgilerini Sýnýf ve Öðretmen bilgileriyle birlikte listeleyen sorgu.
select Ogrenciler.Adi, Ogrenciler.Soyadi, Ogrenciler.Telefon, Ogrenciler.Adres, SinifAdi, Ogretmenler.Adi, Ogretmenler.Soyadi from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id inner join Ogretmenler on Siniflar.OgretmenId = Ogretmenler.Id

select o.Adi, o.Soyadi, o.Telefon, o.Adres, SinifAdi, omn.Adi, omn.Soyadi from Ogrenciler o inner join Siniflar s on o.SinifId = s.Id inner join Ogretmenler omn on s.OgretmenId = omn.Id

--Öðrenci bilgilerini öðretmen adý, soyadý ve branþýyla birlikte gösteren sorgu.
select o.Adi, o.Soyadi, o.Telefon, o.Adres, omn.Adi, omn.Soyadi, Bransi from Ogrenciler o inner join Siniflar s on o.SinifId = s.Id inner join Ogretmenler omn on s.OgretmenId = omn.Id inner join Branslar b on omn.BransId = b.Id
--left yani 1.Tablodaki (Branslar) tüm kayýtlarý diðer tabloda karþýlýðý olmasa da getirir. Diðer tabloda karþýlýðý olmayan kolonlar yerine Null görüntüler. 
select Bransi, Adi, Soyadi from Branslar left outer join Ogretmenler on Branslar.Id = Ogretmenler.BransId

--right yani 2.Tablodaki (Branslar) tüm kayýtlarý diðer tabloda karþýlýðý olmasa da getirir. Diðer tabloda karþýlýðý olmayan kolonlar yerine Null görüntüler.
select Bransi, Adi, Soyadi from Ogretmenler right outer join Branslar on Branslar.Id = Ogretmenler.BransId

--inner join kullandýðýmýzda mutlaka her iki tabloda da ortak kolonlarda ayný deðerin olmasý gerekir. Olmayan kayýtlar listelenmez.
select Bransi, Adi, Soyadi from Branslar inner join Ogretmenler on Branslar.Id = Ogretmenler.BransId