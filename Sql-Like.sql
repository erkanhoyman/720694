--LIKE Kullanýmý

--KolonAdý Like 'A%' -> A ile baþlayanlarýn listesini verir.
--KolonAdý Like '%A' -> Herhangi bir karakter yada karakter grubuyla baþlayýp A ile bitenlerin listesini verir.
--KolonAdý Like '%A%'-> Ýçinde herhangi bir yerde A geçenlerin listesini verir.

use OKUL

select * from Ogretmenler
select * from Ogrenciler
--Soyadý Ö ile baþlayan öðretmenlerin listesi.
select * from Ogretmenler where Soyadi like 'ö%'
--Soyadý ar ile biten öðrencilerin Ýletiþim Bilgilerini listeleyen sorgu.
select Adi, Soyadi, Telefon, Adres from Ogrenciler where Soyadi like '%ar'
--Anadolu yakasýnda oturan öðrencilerin listesi.
select * from Ogrenciler where Telefon like '216%'

--köy'de oturan öðrencilerin Ödeme Bilgilerini gösteren sorgu.
select Adi, Soyadi, TaksitSayisi, TaksitTutari, TaksitSayisi* TaksitTutari as ToplamTutar, Adres from Ogrenciler where Adres like '%köy%'

--Ýsmi A-M arasýndaki harflerle baþlayan öðrencilerin listesi.
select * from Ogrenciler where Adi like '[A-M]%'

--Ýsmi N dýþýndaki harflerle baþlayan öðrencilerin listesi.
select * from Ogrenciler where Adi like '[^N]%'

--Soyadý K ile baþlayýp toplam 4 karakter uzunluðunda olan öðrencilerin listesi.
select * from Ogrenciler where Soyadi like 'K___'
