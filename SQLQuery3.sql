use issilavinimas
go

/*select pavad, tipas from istaiga
inner join tipas on istaiga.tipasID = tipas.id*/

--klaida
/*select (issilavinimas + count(issilavID)) as sk from issilavinimas
inner join asmuo on asmuo.issilavID = issilavinimas.id group by issilavinimas*/

--geriau gal galetum
/*select pavad, tipas from istaiga
inner join tipas on istaiga.tipasID = tipas.id
inner join mokslai on istaiga.id = mokslai.istaigosID
where istaigosID > 0*/

/*select vardas, pavarde, issilavinimas, year(gimdata) as metai from asmuo
inner join issilavinimas on asmuo.issilavID = issilavinimas.id
where year(gimdata) = 1980 or year(gimdata) = 1983 or year(gimdata) = 2000 or year(gimdata) = 2001*/

/*select * from mokslai
inner join asmuo on mokslai.id = asmuo.id
where year(getdate()) - year(baigimas) > 9*/

--nebaigiau
/*select * from asmuo
where vardas between 'p' and 's' or pavarde between 'p' and 's' order by pavarde asc*/
/*select * from asmuo
where vardas like 'p%' and pavarde like 'p%' order by pavarde asc*/

/*select top 7 vardas, pavarde, year(getdate()) - year(gimdata) as metai from asmuo order by metai desc*/

/*select vardas, pavarde from asmuo
where left(vardas, 1) not like left(pavarde, 1)*/

/*alter view info
as
select asmuo.id, vardas, pavarde, gimdata, issilavID,  issilavinimas.id as id2, issilavinimas,  
istaiga.id as id3, pavad, tipasID,  mokslai.id as id4, asmuoID, istaigosID, istojimas, baigimas,
tipas.id as id5, tipas from asmuo
inner join issilavinimas on asmuo.id = issilavinimas.id
inner join istaiga on istaiga.id = asmuo.id
inner join mokslai on mokslai.asmuoID = asmuo.id
inner join tipas on tipas.id = asmuo.id*/