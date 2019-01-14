--order by, top, with ties, distinct

--order by Kolonadý -> Belirtilen kolona göre küçükten büyüðe doðru (A->Z, ascending) sýralar.
--order by Kolonadý desc -> Belirtilen kolona göre büyükten küçüðe doðru (Z->A, descending) sýralar.

--Öðrencilerimizi isimlerine göre alfabetik olarak sýralayan sorgu.
select * from Ogrenciler order by Adi
--Öðrencileri ödedikleri toplam eðitim ücretine göre büyükten küçüðe doðru sýralayan liste.
select Adi, Soyadi, TaksitSayisi*TaksitTutari as ToplamUcret from Ogrenciler order by TaksitSayisi*TaksitTutari desc

select Adi, Soyadi, TaksitSayisi*TaksitTutari as ToplamUcret from Ogrenciler order by ToplamUcret desc

--Top n : Listeden üstünden n sayýda kaydý görüntüler.
select top 3 * from Ogrenciler order by Adi

--Taksit Tutarý en fazla olan 3 öðrenciyi listeleyen sorgu.
select top 3 Adi, Soyadi, TaksitTutari from Ogrenciler order by TaksitTutari desc

--En fazla eðitim ücreti ödeyen öðrenci ve ödediði toplam kurs ücretini gösteren sorgu.
select top 1 *, TaksitSayisi*TaksitTutari as ToplamTutar from Ogrenciler order by ToplamTutar desc

--Kampanya : En çok ücret ödeyen 4 öðrenciye araba hediye etmek istiyoruz.
select top 4 with ties 'Araba Kazananlar', *, TaksitSayisi*TaksitTutari as ToplamTutar from Ogrenciler order by ToplamTutar desc
--with ties : Sýralama yapýlan kolonda kýrýlma gerçekleþinceye kadar listelemeye devam eder.

--Distinct : Liste içinde tekrar eden kayýtlardan sadece birini dikkate alýr.
select * from ogrenciler order by SinifId 

--Sýnýflara göre öðrenci sayýlarýný SinifId'leriyle birlikte gösteren sorgu.
select SinifId, count(*) as Sayýsý from Ogrenciler group by SinifId

--Þu anda devam eden kaç farklý sýnýf olduðunu gösteren sorgu.
select count(*) as sayýsý from Siniflar
--Þu anda öðrenci kayýt edilmemiþ yani eðitime baþlamamýþ sýnýflarý da bu sayýya dahil eder.

select Distinct SinifId from Ogrenciler

select count(Distinct SinifId) as FarkliSinif from Ogrenciler
