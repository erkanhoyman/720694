--LIKE Kullan�m�

--KolonAd� Like 'A%' -> A ile ba�layanlar�n listesini verir.
--KolonAd� Like '%A' -> Herhangi bir karakter yada karakter grubuyla ba�lay�p A ile bitenlerin listesini verir.
--KolonAd� Like '%A%'-> ��inde herhangi bir yerde A ge�enlerin listesini verir.

use OKUL

select * from Ogretmenler
select * from Ogrenciler
--Soyad� � ile ba�layan ��retmenlerin listesi.
select * from Ogretmenler where Soyadi like '�%'
--Soyad� ar ile biten ��rencilerin �leti�im Bilgilerini listeleyen sorgu.
select Adi, Soyadi, Telefon, Adres from Ogrenciler where Soyadi like '%ar'
--Anadolu yakas�nda oturan ��rencilerin listesi.
select * from Ogrenciler where Telefon like '216%'

--k�y'de oturan ��rencilerin �deme Bilgilerini g�steren sorgu.
select Adi, Soyadi, TaksitSayisi, TaksitTutari, TaksitSayisi* TaksitTutari as ToplamTutar, Adres from Ogrenciler where Adres like '%k�y%'

--�smi A-M aras�ndaki harflerle ba�layan ��rencilerin listesi.
select * from Ogrenciler where Adi like '[A-M]%'

--�smi N d���ndaki harflerle ba�layan ��rencilerin listesi.
select * from Ogrenciler where Adi like '[^N]%'

--Soyad� K ile ba�lay�p toplam 4 karakter uzunlu�unda olan ��rencilerin listesi.
select * from Ogrenciler where Soyadi like 'K___'
