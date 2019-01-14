--order by, top, with ties, distinct

--order by Kolonad� -> Belirtilen kolona g�re k���kten b�y��e do�ru (A->Z, ascending) s�ralar.
--order by Kolonad� desc -> Belirtilen kolona g�re b�y�kten k����e do�ru (Z->A, descending) s�ralar.

--��rencilerimizi isimlerine g�re alfabetik olarak s�ralayan sorgu.
select * from Ogrenciler order by Adi
--��rencileri �dedikleri toplam e�itim �cretine g�re b�y�kten k����e do�ru s�ralayan liste.
select Adi, Soyadi, TaksitSayisi*TaksitTutari as ToplamUcret from Ogrenciler order by TaksitSayisi*TaksitTutari desc

select Adi, Soyadi, TaksitSayisi*TaksitTutari as ToplamUcret from Ogrenciler order by ToplamUcret desc

--Top n : Listeden �st�nden n say�da kayd� g�r�nt�ler.
select top 3 * from Ogrenciler order by Adi

--Taksit Tutar� en fazla olan 3 ��renciyi listeleyen sorgu.
select top 3 Adi, Soyadi, TaksitTutari from Ogrenciler order by TaksitTutari desc

--En fazla e�itim �creti �deyen ��renci ve �dedi�i toplam kurs �cretini g�steren sorgu.
select top 1 *, TaksitSayisi*TaksitTutari as ToplamTutar from Ogrenciler order by ToplamTutar desc

--Kampanya : En �ok �cret �deyen 4 ��renciye araba hediye etmek istiyoruz.
select top 4 with ties 'Araba Kazananlar', *, TaksitSayisi*TaksitTutari as ToplamTutar from Ogrenciler order by ToplamTutar desc
--with ties : S�ralama yap�lan kolonda k�r�lma ger�ekle�inceye kadar listelemeye devam eder.

--Distinct : Liste i�inde tekrar eden kay�tlardan sadece birini dikkate al�r.
select * from ogrenciler order by SinifId 

--S�n�flara g�re ��renci say�lar�n� SinifId'leriyle birlikte g�steren sorgu.
select SinifId, count(*) as Say�s� from Ogrenciler group by SinifId

--�u anda devam eden ka� farkl� s�n�f oldu�unu g�steren sorgu.
select count(*) as say�s� from Siniflar
--�u anda ��renci kay�t edilmemi� yani e�itime ba�lamam�� s�n�flar� da bu say�ya dahil eder.

select Distinct SinifId from Ogrenciler

select count(Distinct SinifId) as FarkliSinif from Ogrenciler
