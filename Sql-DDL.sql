--T-SQL (Transact - Structured Query Language) Komutlar�

--DDL (Data Definition Language)

--create nesneturu nesnead� -> Yeni bir Sql nesnesi olu�turur.
--alter nesneturu nesnead�  -> Belirtilen nesne �zerinde de�i�klik yap�lmas�na izin verir.
--drop nesneturu nesnead�   -> �stenilen Sql nesnesi silinir.

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