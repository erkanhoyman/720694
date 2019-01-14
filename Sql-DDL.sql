--T-SQL (Transact - Structured Query Language) Komutlarý

--DDL (Data Definition Language)

--create nesneturu nesneadý -> Yeni bir Sql nesnesi oluþturur.
--alter nesneturu nesneadý  -> Belirtilen nesne üzerinde deðiþklik yapýlmasýna izin verir.
--drop nesneturu nesneadý   -> Ýstenilen Sql nesnesi silinir.

use master
go
create database SilDb
go
use SilDb
go
create table tblSil
(
	Id int primary key identity(1,1),
	Ad varchar(20) not null,
	Soyad varchar(20) not null,
	KayitTarihi datetime not null default getdate(),
	Maas money not null default 0
)
go
alter table tblSil
add Silindi bit not null default 0

use master
go
drop database SilDb 