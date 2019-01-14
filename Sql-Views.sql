--VIEWS Sorgular�

--Normalle�me gere�i olu�an �ok say�da tablodan �ekti�imiz karma��k sorgular� view dosyas� olarak kaydedebilir, ihtiyac�m�z oldu�unda bu dosyalar� kullanabiliriz.
--Ger�ekte ayr� bir tablo olu�maz, veritaban�ndaki base tablolar� sorgular (sadece select sorgusu i�erir).
--Kurumsal firmalarda kullan�c� yada grup yetkilerini k�s�tlamak i�in, yada kompleks raporlamalarda �ok kullan��l�d�r.

use OKUL
 
select * from vw_YazilimOgretmenleri order by Ad�Soyad�

sp_helptext vw_YazilimOgretmenleri --View dosyas�n�n i�eri�ini (kodlar�n�) g�sterir.

sp_depends vw_YazilimOgretmenleri --View'da kullan�lan tablo ve kolonlar� listeler.

create view vw_OgrenciIletisim
as
select Adi + ' ' + Soyadi as Ogrenci, Telefon from Ogrenciler

select * from vw_OgrenciIletisim

sp_helptext vw_OgrenciIletisim

alter view vw_OgrenciIletisim
with encryption --kodlar� �ifreleyerek gizler.
as
select Adi + ' ' + Soyadi as Ogrenci, Telefon from Ogrenciler

sp_helptext vw_OgrenciIletisim --i�erik g�r�nt�lenmez.

alter view vw_OgrenciIletisim
as
select Adi + ' ' + Soyadi as Ogrenci, Telefon from Ogrenciler

--View dosyalar�nda insert, update, delete i�lemleri

--Yap�lan i�lem birden fazla tabloyu etkiledi�inde yada herhangi bir constraint'e tak�ld���nda i�lem hata verir.

select * from vw_YazilimOgretmenleri

insert into vw_YazilimOgretmenleri(Bransi, Telefon, Adres) values('Yaz�l�m .Net', '2123453453', 'Wissen Akademie')

--hata verir (the modification affects multiple base tables).

insert into vw_YazilimOgretmenleri(Telefon, Adres) values('2123453453', 'Wissen Akademie') --BransId vb. constraint hatas� verir.

insert into vw_YazilimOgretmenleri(Bransi) values('Siber G�venlik')

--Sadece Branslar tablosunu etkiledi�i ve hi�bir k�s�tlay�c�ya tak�lmad��� i�in sorgu �al���r ve esas tabloya yeni bir kay�t ekler.

select * from vw_Odemeler

sp_helptext vw_Odemeler