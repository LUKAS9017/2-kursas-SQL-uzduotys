use biblioteka
go

--1 praktine uzduotis
--Predikato LIKE (NOT LIKE) naudojimas, rezultatø rikiavimas (ORDER BY)

/*--1 uzduotis
select vardas, pavarde from skaitytojas
where vardas like 'j%'*/

/*--2 uzduotis
select pavarde from skaitytojas
where pavarde like '%is'*/

/*--3 uzduotis
select vardas, pavarde from skaitytojas
where pavarde like '%as%'*/

/*--4 uzduotis
select vardas, pavarde from skaitytojas
where vardas like 'M%' or pavarde like 'M%'*/

/*--5 uzduotis
select * from skaitytojas
where adresas_id = 4*/

/*--6 uzduotis
select pavarde from skaitytojas
where pavarde like '%r%_%t%'
order by pavarde desc*/

/*--7 uzduotis
select pavarde from skaitytojas
where pavarde like '%t%_%t%'*/

/*--8 uzduotis
select vardas, pavarde from skaitytojas
where pavarde not like 'D%'*/



--Predikato BETWEEN (NOT BETWEEN) naudojimas, rezultatø rikiavimas (ORDER BY)

/*--1 uzduotis
select pavarde from skaitytojas
where pavarde between 'J' and 'o' order by pavarde desc*/

/*--2 uzduotis
select pavarde from skaitytojas
where pavarde between 'a' and 'k' or pavarde between 's' and 'z'*/

/*--3 uzduotis
select vardas, pavarde from skaitytojas
where vardas between 'a' and 'l' and pavarde between 'a' and 'l'*/



--Predikato IN (NOT IN) naudojimas

/*--1 uzduotis
select vardas from skaitytojas
where vardas in('Jonas')*/



--Predikato IS NULL (IS NOT NULL) naudojimas

/*--1 uzduotis
select * from autorius
where komentaras is null*/

/*--2 uzduotis
select * from autorius
where komentaras is not null*/



--Agregatiniø (count(); max(); min(); avg(); sum()) ir kitø funkcijø (len(), 
--substring(), cast(), convert(), year(), month(), day(), getdate() …) naudojimas.

/*--1 uzduotis
select count(id) as 'egzemplioriai' from egz*/

/*--2 uzduotis
select pavarde, count(pavarde) from skaitytojas group by pavarde*/

/*--3 uzduotis
select * from skaitytojas
where id%2 = 0*/

/*--4 uzduotis
select pavarde from skaitytojas group by pavarde
having count(pavarde) > 1 --having - turintis*/

/*--5 uzduotis
select metai, count(metai) as isleista from egz group by metai*/

/*--6 uzduotis
select pavadinimas, len(pavadinimas) from knyga*/

/*--7 uzduotis
select min(len(vardas)) as 'trupiausio autoriaus vardo simboliu skaicius' from autorius*/

/*--8 uzduotis
select pavarde from autorius
where len(pavarde) > 7*/

/*--9 uzduotis
select avg(len(pavarde)) as 'skaitytoju pavardziu ilgiu vidurkis' from skaitytojas*/

/*--10 uzduotis
select * from skaitytojas
where month(gim_data) between 6 and 8*/

/*--11 uzduotis
select pavarde, left(vardas, 1) as 'vardo pirmoji raide', 
year(gim_data) as 'gimimo metai',
year(getdate()) - year(gim_data) as amzius 
from skaitytojas order by pavarde asc*/

/*--12 uzduotis
select cast(avg(year(getdate()) - year(gim_data)) as float) as 'vidurkis' from skaitytojas*/



--inner join

/*--1 uzduotis
select vardas, pavarde, gim_data, gatve, namo_nr, buto_nr, miestas from skaitytojas 
inner join adresas 
	on skaitytojas.adresas_id = adresas.id
inner join gatve 
	on adresas.gatve_id = gatve.id
inner join miestas
	on adresas.miestas_id = miestas.id*/



--Pamoka Virtualios lenteles

/*create view skaitytojas_info --su "create" kuri, o su "alter" koreguoji jau sukurta
as
select skaitytojas.id as sk_id, vardas, pavarde, gim_data, gatve, namo_nr, buto_nr, miestas from skaitytojas
inner join adresas on adresas.id = skaitytojas.adresas_id
inner join gatve on gatve.id = adresas.gatve_id
inner join miestas on miestas.id = adresas.miestas_id*/

--select * from skaitytojas_info