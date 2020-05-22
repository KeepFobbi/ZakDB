USE torg_firm

SELECT postachalnik.Nazva,SUM(NaSklade)
FROM  tovar INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach
GROUP BY postachalnik.Nazva
--2--
DECLARE @min decimal(10,0) = 1
SELECT postachalnik.Nazva, SUM(@min) 
FROM  sotrudnik INNER JOIN postachalnik ON sotrudnik.id_postach = postachalnik.id_postach
GROUP BY postachalnik.Nazva
--3--
DECLARE @mini decimal(10,0) = 1
SELECT postachalnik.Nazva, SUM(@mini) 
FROM  postachalnik
WHERE postachalnik.Nazva = postachalnik.Nazva
GROUP BY postachalnik.Nazva
--4--
DECLARE @mins decimal(10,0) = 1
SELECT tovar.Nazva, SUM(@mins) 
FROM (zakaz_tovar INNER JOIN tovar ON zakaz_tovar.id_tovar = tovar.id_tovar)
INNER JOIN zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz
WHERE zakaz.date_rozm Between '' And '2017-06-22T07:11:51.297'
GROUP BY tovar.Nazva
--5--
SELECT SUM(Price)
FROM zakaz_tovar INNER JOIN tovar ON zakaz_tovar.id_tovar = tovar.id_tovar
INNER JOIN zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz
WHERE zakaz.date_rozm Between '' And '2017-06-16T07:11:51.297'
--6--
SELECT postachalnik.Nazva, SUM(Price)
FROM zakaz_tovar INNER JOIN zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz
INNER JOIN tovar INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach ON zakaz_tovar.id_tovar = tovar.id_tovar
GROUP BY postachalnik.Nazva
--7--
SELECT postachalnik.Nazva, SUM(Kilkist)
FROM zakaz_tovar INNER JOIN zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz
INNER JOIN tovar INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach ON zakaz_tovar.id_tovar = tovar.id_tovar
WHERE tovar.Nazva in ('Молоко')
GROUP BY postachalnik.Nazva
--8--
SELECT AVG(Price)
FROM ((zakaz_tovar INNER JOIN tovar ON zakaz_tovar.id_tovar = tovar.id_tovar)
INNER JOIN zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz)
--9--
SELECT Sum(Price), klient.Nazva
FROM zakaz_tovar INNER JOIN tovar ON zakaz_tovar.id_tovar = tovar.id_tovar
INNER JOIN zakaz INNER JOIN klient ON zakaz.id_klient = klient.id_klient ON zakaz_tovar.id_zakaz = zakaz.id_zakaz
WHERE klient.City like 'Жито%'  
GROUP BY klient.Nazva
--10--
SELECT postachalnik.Nazva, AVG(Price)
FROM  tovar INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach
GROUP BY postachalnik.Nazva