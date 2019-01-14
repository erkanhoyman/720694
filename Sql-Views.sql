--VIEWS Sorgularý

--Normalleþme gereði oluþan çok sayýda tablodan çektiðimiz karmaþýk sorgularý view dosyasý olarak kaydedebilir, ihtiyacýmýz olduðunda bu dosyalarý kullanabiliriz.
--Gerçekte ayrý bir tablo oluþmaz, veritabanýndaki base tablolarý sorgular (sadece select sorgusu içerir).
--Kurumsal firmalarda kullanýcý yada grup yetkilerini kýsýtlamak için, yada kompleks raporlamalarda çok kullanýþlýdýr.

use OKUL
 
select * from vw_YazilimOgretmenleri order by AdýSoyadý

sp_helptext vw_YazilimOgretmenleri --View dosyasýnýn içeriðini (kodlarýný) gösterir.

sp_depends vw_YazilimOgretmenleri --View'da kullanýlan tablo ve kolonlarý listeler.

create view vw_OgrenciIletisim
as
select Adi + ' ' + Soyadi as Ogrenci, Telefon from Ogrenciler

select * from vw_OgrenciIletisim

sp_helptext vw_OgrenciIletisim

alter view vw_OgrenciIletisim
with encryption --kodlarý þifreleyerek gizler.
as
select Adi + ' ' + Soyadi as Ogrenci, Telefon from Ogrenciler

sp_helptext vw_OgrenciIletisim --içerik görüntülenmez.

alter view vw_OgrenciIletisim
as
select Adi + ' ' + Soyadi as Ogrenci, Telefon from Ogrenciler

--View dosyalarýnda insert, update, delete iþlemleri

--Yapýlan iþlem birden fazla tabloyu etkilediðinde yada herhangi bir constraint'e takýldýðýnda iþlem hata verir.

select * from vw_YazilimOgretmenleri

insert into vw_YazilimOgretmenleri(Bransi, Telefon, Adres) values('Yazýlým .Net', '2123453453', 'Wissen Akademie')

--hata verir (the modification affects multiple base tables).

insert into vw_YazilimOgretmenleri(Telefon, Adres) values('2123453453', 'Wissen Akademie') --BransId vb. constraint hatasý verir.

insert into vw_YazilimOgretmenleri(Bransi) values('Siber Güvenlik')

--Sadece Branslar tablosunu etkilediði ve hiçbir kýsýtlayýcýya takýlmadýðý için sorgu çalýþýr ve esas tabloya yeni bir kayýt ekler.

select * from vw_Odemeler

sp_helptext vw_Odemeler