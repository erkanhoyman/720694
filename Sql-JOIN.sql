--�li�kilendirme (JOIN) - �oklu Tablolar

--Birden fazla tabloyu ortak kolonlar �zerinden birbirine ba�lamam�z� sa�lar.

--inner join (join) : �li�kilendirilen tabloda ortak kolonun de�erine sahip olan kayd�n t�m kolonlar�na kullanma imkan� verir.
--outer join (left-right) : Tablolar�n ortak �zellikleri hen�z olu�mam�� olsa dahi, t�r�ne g�re, soldaki veya sa�daki tablonun t�m kay�tlar�n� getirir. Di�er tabloda bo� olan kolonlara Null de�eri atar.
--cross join : �li�kilendirilen tablolardan birindeki kay�tlar�, di�er tablodaki t�m kay�tlarla ayr� ayr� (�apraz) e�le�tirir.

 --Tablo1 inner join Tablo2 on Tablo1.ortakkolon = Tablo2.ortakkolon

 --��renci bilgilerini SinifAdi ile birlikte listeleyen sorguyu yaz�n�z.
 select Adi, Soyadi, Telefon, Adres, SinifAdi from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id

 select Ogrenciler.*, SinifAdi from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id

--��retmen bilgilerini Bran��yla birlikte g�steren sorgu.
select Adi, Soyadi, Bransi, Telefon from Ogretmenler inner join Branslar on Ogretmenler.BransId = Branslar.Id

--Yaz�l�m .Net bran��ndaki e�itmenlerin ileti�im bilgilerini g�steren sorgu.
select Adi, Soyadi, Telefon, Adres from Ogretmenler inner join Branslar on Ogretmenler.BransId = Branslar.Id where Bransi='Yaz�l�m .Net'

--Yaz�l�m bran��ndaki t�m e�itmenlerin ileti�im bilgilerini g�steren sorgu.
select Ogretmenler.Id, Adi, Soyadi, Telefon, Adres from Ogretmenler inner join Branslar on Ogretmenler.BransId = Branslar.Id where Bransi like 'Yaz�l�m%'

--E�er her 2 tabloda da ayn� isimle bulunan bir kolonu g�r�nt�lemek istersek bir �ak��ma ('ambiguous column') hatas� al�r�z. Bunu gidermek i�in TabloAd�.Kolon �eklinde g�stermeliyiz.

select o.Id, Adi, Soyadi, Telefon, Adres from Ogretmenler o inner join Branslar b on o.BransId = b.Id where Bransi like 'Yaz�l�m%'

--S�n�flara g�re ��renci say�lar�n� SinifId'leriyle birlikte g�steren sorguyu yaz�n�z.
select SinifId, count(*) as S�n�fMevcudu from Ogrenciler group by SinifId

--S�n�flara g�re ��renci say�lar�n� SinifAd'lar�yla birlikte g�steren sorguyu yaz�n�z.
select SinifAdi, count(*) as S�n�fMevcudu from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id group by SinifAdi

--��renci bilgilerini S�n�f ve ��retmen bilgileriyle birlikte listeleyen sorgu.
select Ogrenciler.Adi, Ogrenciler.Soyadi, Ogrenciler.Telefon, Ogrenciler.Adres, SinifAdi, Ogretmenler.Adi, Ogretmenler.Soyadi from Ogrenciler inner join Siniflar on Ogrenciler.SinifId = Siniflar.Id inner join Ogretmenler on Siniflar.OgretmenId = Ogretmenler.Id

select o.Adi, o.Soyadi, o.Telefon, o.Adres, SinifAdi, omn.Adi, omn.Soyadi from Ogrenciler o inner join Siniflar s on o.SinifId = s.Id inner join Ogretmenler omn on s.OgretmenId = omn.Id

--��renci bilgilerini ��retmen ad�, soyad� ve bran��yla birlikte g�steren sorgu.
select o.Adi, o.Soyadi, o.Telefon, o.Adres, omn.Adi, omn.Soyadi, Bransi from Ogrenciler o inner join Siniflar s on o.SinifId = s.Id inner join Ogretmenler omn on s.OgretmenId = omn.Id inner join Branslar b on omn.BransId = b.Id
--left yani 1.Tablodaki (Branslar) t�m kay�tlar� di�er tabloda kar��l��� olmasa da getirir. Di�er tabloda kar��l��� olmayan kolonlar yerine Null g�r�nt�ler. 
select Bransi, Adi, Soyadi from Branslar left outer join Ogretmenler on Branslar.Id = Ogretmenler.BransId

--right yani 2.Tablodaki (Branslar) t�m kay�tlar� di�er tabloda kar��l��� olmasa da getirir. Di�er tabloda kar��l��� olmayan kolonlar yerine Null g�r�nt�ler.
select Bransi, Adi, Soyadi from Ogretmenler right outer join Branslar on Branslar.Id = Ogretmenler.BransId

--inner join kulland���m�zda mutlaka her iki tabloda da ortak kolonlarda ayn� de�erin olmas� gerekir. Olmayan kay�tlar listelenmez.
select Bransi, Adi, Soyadi from Branslar inner join Ogretmenler on Branslar.Id = Ogretmenler.BransId