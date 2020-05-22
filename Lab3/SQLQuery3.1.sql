USE torg_firm

SELECT zakaz_tovar.*,zakaz.date_rozm,tovar.Nazva
FROM ((zakaz_tovar
INNER JOIN tovar ON zakaz_tovar.id_tovar = tovar.id_tovar)
INNER JOIN zakaz ON zakaz_tovar.id_zakaz = zakaz.id_zakaz)
WHERE tovar.Nazva in('ÃÓÎÓÍÓ') AND zakaz.date_rozm Between '' And '2017-07-10T07:11:51.293';


SELECT tovar.Nazva,tovar.NaSklade,tovar.Price
FROM tovar 
WHERE Tovar.Price>3 AND Tovar.Price<18 AND tovar.NaSklade>=15; 

SELECT zakaz.*
FROM zakaz 
WHERE zakaz.date_rozm In (Null);

SELECT tovar.*
FROM tovar 
WHERE tovar.id_postav In(1) AND tovar.NaSklade=50;

SELECT SUM(Price)  
FROM  ((tovar INNER JOIN postachalnik ON tovar.id_postav = postachalnik.id_postach)),zakaz
WHERE postachalnik.Nazva Like'“Œ¬%' and  zakaz.date_rozm Between '' And '2017-06-30T07:11:51.297'

SELECT sotrudnik.*,zakaz.date_rozm
FROM sotrudnik INNER JOIN zakaz ON sotrudnik.id_sotrud = zakaz.id_sotrud
WHERE zakaz.id_klient in(1);

SELECT postachalnik.*
FROM postachalnik INNER JOIN tovar ON postachalnik.id_postach = tovar.id_postav
WHERE postachalnik.Nazva In('«¿“') And tovar.id_postav In (Null);

SELECT klient.*
FROM klient INNER JOIN zakaz ON klient.id_klient = zakaz.id_klient
WHERE klient.Nazva Like 'œœ%' AND zakaz.date_rozm In('2017-06-16T07:11:51.297');

SELECT sotrudnik.*
FROM sotrudnik
WHERE sotrudnik.Name LIKE 'ŒÎ%È'
ORDER BY sotrudnik.Fname;

SELECT klient.*
FROM klient
ORDER BY klient.Tel;
