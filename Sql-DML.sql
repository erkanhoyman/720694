--DML (Data Manipulation Language) Komutları

--Select, Insert, Update, Delete

--Select -> Aktif veritabanından istenilen kayıtların listelenmesini (seçilmesini) sağlar,
--Insert -> Aktif veritabanına yeni kayıt ekler,
--Update -> Seçilen kayıt üzerinde değişiklik (güncelleme) yapar,
--Delete -> Aktif veritabanından istenilen kaydı siler.

use OKUL
go
--Select Kolon1, Kolon2,... from TabloAdı where Şartlar

Select Adi, Soyadi, Telefon from Ogretmenler

Select * from Ogretmenler  --* -> tüm kolonları listeler.

--Branşı Yazılım .Net (1) olan öğretmenlerin tüm bilgilerini listeleyen T-Sql sorgusu.
select * from Ogretmenler where BransId = 1

--1 nolu sınıfta bulunan öğrencilerin Adı, Soyadı, Telefon ve Adres bilgilerini listeleyen sorgu.
select Adi, Soyadi, Telefon, Adres from Ogrenciler where SinifId = 1
--Taksit Sayısı 6 yada daha fazla olanların tüm bilgilerini gösteren sorgu.
select * from Ogrenciler where  TaksitSayisi >= 6

--Taksit Tutarı 500-700 aralığında olan öğrencilerin listesi.
select * from Ogrenciler where TaksitTutari>=500 and TaksitTutari<=700 

select * from Ogrenciler where TaksitTutari Between 500 and 700

--Ali Uçar'ın tüm ödeme bilgilerini gösteren sorgu.
select Adi, Soyadi, Telefon, TaksitSayisi, TaksitTutari, TaksitSayisi * TaksitTutari as ToplamTutar from Ogrenciler where Adi='Ali' and Soyadi='Uçar'

select Adi as [Öğrenci Adı], Soyadi, Telefon, TaksitSayisi, TaksitTutari, TaksitSayisi * TaksitTutari 'Toplam Tutar' from Ogrenciler where Adi='Ali' and Soyadi='Uçar'

--Mevcut kolonları matematiksel işlemlere sokarak yeni Hesaplanmış Kolonlar (Computed Columns) elde edebiliriz.

--Stock veritabanının oluşturulması
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

-- Kayıt ekleme	Insert
-- Insert into TabloAdı (Kolon1, Kolon2, ...) values (Deger1, deger2, ...)

insert into Catagories(CategoryName, Description) values ('Gömlekler', 'Kısa ve uzun kollu gömlekler')

insert into Catagories(CategoryName, Description) values ('Kazaklar', 'Kısa ve uzun kollu gömlekler')

insert into Catagories(CategoryName, Description) values ('Pantolonlar', 'Kısa ve uzun kollu gömlekler')

insert into Catagories(CategoryName, Description) values ('Ceketler', 'Kısa ve uzun kollu gömlekler')

select * from Catagories

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kısa Kollu Silim', 60, 20, 1)

insert into Products(ProductName, Price , UnitsStock , CategoryId) values ('Uzun Kollu Silim', 70, 50, 1)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kısa Kollu Regular', 60, 20, 1)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Uzun Kollu Regular', 70, 40, 1)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Bisiklet Yaka', 80, 30, 2)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('V Yaka Kazak', 75, 50, 2)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Balıkçı Yaka', 90, 40, 2)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kot Pantolon', 110, 60, 3)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kumaş Pantolon', 85, 50, 3)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Kadife Pantolon', 90, 40, 3)

select * from Products

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Spor Ceket ', 220, 30, 4)

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Klasik Ceket', 180, 30, 4)

select * from Products

-- Kayıtlar üzerinde değişiklik

--Update TabloAdi Set Kolon1=YeniDeger1, Kolon2=YeniDeger2, ...... Where Şart yazmazsak tüm katagorilerin açıklaması degişir where şartı ile sadece kazakları değiştirelim

Update Catagories set Description='Yünlü Kışlık Kazaklar' where Id =2

select * from Catagories

--Pantolonlar ve Ceketler kategorilerinin acıklamalarını kot ve kumaş şeklinde değiştiren sorgu

Update Catagories set Description='Kot ve Kumaş' where CategoryName = 'Pantolonlar' or CategoryName =   'Ceketler'

-- Kayıt Silme (Delete) :

-- Delete From TabloAdı where şart  // where konulmazsa tüm tabloyu siler :) 

-- ID si 12 olan ürünü silen sorgu 

Delete From Products where Id= 12

select * from Products

insert into Products(ProductName, Price , UnitsStock, CategoryId ) values ('Klasik Ceket', 180, 30, 4)

select * from Products

-- Hata yapıp silersek geri dönüşü olmayabilir o yüzden select kullanılır. mesela ıd si 150 den büyükleri silecekken yanlışlıkla küçüğü alınca haşırt :) 

select * From Products where Id > 11 -- gördükten sonra kopyalayıp delete e yapıştırırız.

delete from Products where Id > 11

