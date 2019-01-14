--DML (Data Manipulation Language) Komutlar�

--Select, Insert, Update, Delete

--Select -> Aktif veritaban�ndan istenilen kay�tlar�n listelenmesini (se�ilmesini) sa�lar,
--Insert -> Aktif veritaban�na yeni kay�t ekler,
--Update -> Se�ilen kay�t �zerinde de�i�iklik (g�ncelleme) yapar,
--Delete -> Aktif veritaban�ndan istenilen kayd� siler.

use OKUL
go
--Select Kolon1, Kolon2,... from TabloAd� where �artlar

Select Adi, Soyadi, Telefon from Ogretmenler

Select * from Ogretmenler  --* -> t�m kolonlar� listeler.

--Bran�� Yaz�l�m .Net (1) olan ��retmenlerin t�m bilgilerini listeleyen T-Sql sorgusu.
select * from Ogretmenler where BransId = 1

--1 nolu s�n�fta bulunan ��rencilerin Ad�, Soyad�, Telefon ve Adres bilgilerini listeleyen sorgu.
select Adi, Soyadi, Telefon, Adres from Ogrenciler where SinifId = 1
--Taksit Say�s� 6 yada daha fazla olanlar�n t�m bilgilerini g�steren sorgu.
select * from Ogrenciler where  TaksitSayisi >= 6

--Taksit Tutar� 500-700 aral���nda olan ��rencilerin listesi.
select * from Ogrenciler where TaksitTutari>=500 and TaksitTutari<=700 

select * from Ogrenciler where TaksitTutari Between 500 and 700

--Ali U�ar'�n t�m �deme bilgilerini g�steren sorgu.
select Adi, Soyadi, Telefon, TaksitSayisi, TaksitTutari, TaksitSayisi * TaksitTutari as ToplamTutar from Ogrenciler where Adi='Ali' and Soyadi='U�ar'

select Adi as [��renci Ad�], Soyadi, Telefon, TaksitSayisi, TaksitTutari, TaksitSayisi * TaksitTutari 'Toplam Tutar' from Ogrenciler where Adi='Ali' and Soyadi='U�ar'

--Mevcut kolonlar� matematiksel i�lemlere sokarak yeni Hesaplanm�� Kolonlar (Computed Columns) elde edebiliriz.

--Stock veritaban�n�n olu�turulmas�
use master
go
create database Stock
go
use Stock
go
create table Categories
(
	Id int primary key identity(1,1),
	CategoryName varchar(20) not null,
	Description varchar(max)
)
go
create table Products
(
	Id int primary key identity(1,1),
	ProductName varchar(20) not null,
	Price money not null default 0,
	UnitsInStock int not null default 1,
	CategoryId int not null
)

alter table Products
add constraint CK_Price CHECK(Price < 1000)

alter table Products
add constraint UK_Name Unique(ProductName)

alter table Products
add constraint FK_Products_Categories
foreign key(CategoryId)
references Categories(Id)

-- Kay�t ekleme	Insert
-- Insert into TabloAd� (Kolon1, Kolon2, ...) values (Deger1, deger2, ...)

insert into Catagories(CategoryName, Description) values ('G�mlekler', 'K�sa ve uzun kollu g�mlekler')

insert into Catagories(CategoryName, Description) values ('Kazaklar', 'K�sa ve uzun kollu g�mlekler')

insert into Catagories(CategoryName, Description) values ('Pantolonlar', 'K�sa ve uzun kollu g�mlekler')

insert into Catagories(CategoryName, Description) values ('Ceketler', 'K�sa ve uzun kollu g�mlekler')

select * from Catagories

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('K�sa Kollu Silim', 60, 20, 1)

insert into Products(ProductName, Price , UnitsStock , CategoryId) values ('Uzun Kollu Silim', 70, 50, 1)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('K�sa Kollu Regular', 60, 20, 1)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Uzun Kollu Regular', 70, 40, 1)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Bisiklet Yaka', 80, 30, 2)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('V Yaka Kazak', 75, 50, 2)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Bal�k�� Yaka', 90, 40, 2)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kot Pantolon', 110, 60, 3)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kuma� Pantolon', 85, 50, 3)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kadife Pantolon', 90, 40, 3)

select * from Products

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Spor Ceket ', 220, 30, 4)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Klasik Ceket', 180, 30, 4)

select * from Products

-- Kay�tlar �zerinde de�i�iklik

--Update TabloAdi Set Kolon1=YeniDeger1, Kolon2=YeniDeger2, ...... Where �art yazmazsak t�m katagorilerin a��klamas� degi�ir where �art� ile sadece kazaklar� de�i�tirelim

Update Catagories set Description='Y�nl� K��l�k Kazaklar' where Id =2

select * from Catagories

--Pantolonlar ve Ceketler kategorilerinin ac�klamalar�n� kot ve kuma� �eklinde de�i�tiren sorgu

Update Catagories set Description='Kot ve Kuma�' where CategoryName = 'Pantolonlar' or CategoryName =   'Ceketler'

-- Kay�t Silme (Delete) :

-- Delete From TabloAd� where �art  // where konulmazsa t�m tabloyu siler :) 

-- ID si 12 olan �r�n� silen sorgu 

Delete From Products where Id= 12

select * from Products

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Klasik Ceket', 180, 30, 4)

select * from Products

-- Hata yap�p silersek geri d�n��� olmayabilir o y�zden select kullan�l�r. mesela �d si 150 den b�y�kleri silecekken yanl��l�kla k����� al�nca ha��rt :) 

select * From Products where Id > 11 -- g�rd�kten sonra kopyalay�p delete e yap��t�r�r�z.

delete from Products where Id > 11

