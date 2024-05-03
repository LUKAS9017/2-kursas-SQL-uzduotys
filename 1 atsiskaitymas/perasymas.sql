use imoniuDB
go

/*--1
select pavadinimas, forma.tipas, ikur_data from imones
inner join forma on imones.forma_id = forma.id
where year(ikur_data) % 2 = 0*/

--2
/*select top 4 pavadinimas, forma.tipas, ikur_data from imones
inner join forma on imones.forma_id = forma.id
order by ikur_data asc*/

--3
/*select pavadinimas, forma.tipas, ikur_data, year(getdate()) - year(ikur_data) as darbo_metai from imones
inner join forma on imones.forma_id = forma.id
where (year(getdate()) - year(ikur_data)) > 20*/

/*--4 nebaigiau
select gatve from gatve
inner join adresas on gatve.id = adresas.gatve_id
inner join imones on adresas.id = imones.adresas_id
where gatve.id != adresas.gatve_id
order by gatve asc*/

/*--5
select pavadinimas, forma.tipas from imones
inner join forma on imones.forma_id = forma.id
where tipas = 'Maşoji bendrija'*/

/*--6
select pavadinimas, forma.tipas, ikur_data from imones
inner join forma on imones.forma_id = forma.id
where month(ikur_data) between 03 and 09*/

/*--7 nebaigiau
select concat(year(ikur_data), ' - ', count(year(ikur_data))) as skaicius from imones group by ikur_data*/

/*--8
select pavadinimas,forma.tipas, year(ikur_data) as ikurimo_metai from imones
inner join forma on imones.forma_id = forma.id
where year(ikur_data) between 1980 and 1995*/

--9
/*select imones.id, imones.pavadinimas, forma.tipas, adresas.gatve_id, adresas.namas, 
adresas.butas, adresas.miestas_id, imones.ikur_data, imones.apyvarta from imones
inner join forma on imones.forma_id = forma.id
inner join adresas on imones.adresas_id = adresas.id*/

--10
select pavadinimas, forma_id, adresas_id, ikur_data, apyvarta from imones
where pavadinimas between 'M%' and 'Ş%' order by pavadinimas, forma_id, adresas_id, ikur_data, apyvarta desc
