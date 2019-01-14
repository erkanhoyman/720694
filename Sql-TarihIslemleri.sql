--Tarih ��lemleri

select * from Siniflar

select getdate() --sistem tarih ve saatini g�r�nt�ler.

--21.12.2018 tarihinde a��lan s�n�flar�n listesi.

select * from Siniflar where AcilisTarihi = '21.12.2018' --t�r uyu�mazl��� hatas� verir.

select * from Siniflar where AcilisTarihi = getdate() --saat farkl�l��� nedeniyle herhangi bir s�n�f� listelemez.

select Convert(varchar(20), getdate(), 101) --mm/dd/yyyy
select Convert(varchar(20), getdate(), 102) --yyyy.mm.dd
select Convert(varchar(20), getdate(), 103) --dd/mm/yyyy
select Convert(varchar(20), getdate(), 104) --dd.mm.yyyy
select Convert(varchar(20), getdate(), 105) --dd-mm-yyyy
select Convert(varchar(20), getdate(), 106) --dd MMM yyyy
select Convert(varchar(20), getdate(), 107) -- MMM dd, yyyy
select Convert(varchar(20), getdate(), 108) --hh:mm:ss

select * from Siniflar where Convert(varchar(20), AcilisTarihi, 104) = '21.12.2018'

--25-27 2018 tarihlerinde a��lan s�n�flar�n listesi.
select * from Siniflar where Convert(varchar(20), AcilisTarihi, 104) >= '25.12.2018' and Convert(varchar(20), AcilisTarihi, 104) <= '27.12.2018'
--Tarih de�erlerini varchar yani string'e �evirdi�imizden karakter karakter kar��la�t�r�r. Bu nedenle aral�k kontrollerinde farkl�l�klar olu�ur (karakter olarak 2, 11 den b�y�kt�r).
select * from Siniflar where Convert(varchar(20), AcilisTarihi, 102) >= '2018.12.25' and Convert(varchar(20), AcilisTarihi, 102) <= '2018.12.27'
--Bu hatay� �nlemek i�in tarih format� yyyy.mm.dd yap�labilir. En do�rusu tarih format�n� Date t�r�ne �evirmektir.

--Bug�n a��lan s�n�flar� listeleyen sorgu.
