use biblioteka
go

--select * --gali buti prie selecto top 5
/*from autorius 
where komentaras is null
order by pavarde asc, vardas --desc*/
--where komentaras is not null
--id in (1, 7, 8) --arba id = 1 or id = 7 or id = 8
--where id between 1 and 5 --arba id > 1 and id < 6
--where pavarde between 'a' and 'l' --arba 'k'
--where id > 5 or id = 1
--where vardas = 'Romnas'
/*where pavarde like 'b%'
and
vardas like 'R%' --pavarde = 'b' (butu taspats) % zenklas nustato kur riade bus. _ reiskia viena raide*/

/*
select vardas, count(vardas) 
from autorius
where vardas between 'a' and 's'
group by vardas 
having count(vardas) > 1*/

/*
select avg(id) as vidurkis 
	count(*) as sk
from autorius --as pavadina stulpeli*/



/*
select '51212032569' as 'asmens kodas', 
left('51212032569', 1) as 'pirmas simbolis',
substring('51212032569', 2, 6) as '6 sk',
cast('20' + substring('48912032569', 2, 6) as date) as date,
right('51212032569', 4),
len('51212032569') --pajema kiek simboliu yra

select miestas, LEN(miestas), sum(id)
from miestas group by id, miestas, len(miestas)*/

--select year(getdate()), datepart(year, getdate()) --dabartiniai metai

/*
select gim_data from skaitytojas
where month(gim_data) = 2*/




--select * from miestas inner join leidykla on miestas.id = leidykla.miestas_id

--select leidykla, miestas from miestas full join leidykla on miestas.id = leidykla.miestas_id

/*select vardas, adresas_id from skaitytojas
union all
select vardas, id from autorius
where vardas like 'R%'
order by vardas asc*/