--Tarih Ýþlemleri

select * from Siniflar

select getdate() --sistem tarih ve saatini görüntüler.

--21.12.2018 tarihinde açýlan sýnýflarýn listesi.

select * from Siniflar where AcilisTarihi = '21.12.2018' --tür uyuþmazlýðý hatasý verir.

select * from Siniflar where AcilisTarihi = getdate() --saat farklýlýðý nedeniyle herhangi bir sýnýfý listelemez.

select Convert(varchar(20), getdate(), 101) --mm/dd/yyyy
select Convert(varchar(20), getdate(), 102) --yyyy.mm.dd
select Convert(varchar(20), getdate(), 103) --dd/mm/yyyy
select Convert(varchar(20), getdate(), 104) --dd.mm.yyyy
select Convert(varchar(20), getdate(), 105) --dd-mm-yyyy
select Convert(varchar(20), getdate(), 106) --dd MMM yyyy
select Convert(varchar(20), getdate(), 107) -- MMM dd, yyyy
select Convert(varchar(20), getdate(), 108) --hh:mm:ss

select * from Siniflar where Convert(varchar(20), AcilisTarihi, 104) = '21.12.2018'

--25-27 2018 tarihlerinde açýlan sýnýflarýn listesi.
select * from Siniflar where Convert(varchar(20), AcilisTarihi, 104) >= '25.12.2018' and Convert(varchar(20), AcilisTarihi, 104) <= '27.12.2018'
--Tarih deðerlerini varchar yani string'e çevirdiðimizden karakter karakter karþýlaþtýrýr. Bu nedenle aralýk kontrollerinde farklýlýklar oluþur (karakter olarak 2, 11 den büyüktür).
select * from Siniflar where Convert(varchar(20), AcilisTarihi, 102) >= '2018.12.25' and Convert(varchar(20), AcilisTarihi, 102) <= '2018.12.27'
--Bu hatayý önlemek için tarih formatý yyyy.mm.dd yapýlabilir. En doðrusu tarih formatýný Date türüne çevirmektir.

--Bugün açýlan sýnýflarý listeleyen sorgu.
