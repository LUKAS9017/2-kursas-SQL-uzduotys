use issilavinimas
go

--1 teisingai
select pavad, tipas from istaiga
inner join tipas on istaiga.tipasID = tipas.id
where tipas = 'Kolegija'

--2 teisingas
select concat(issilavinimas, ' - ', count(issilavID)) as skaicius from issilavinimas
inner join asmuo on issilavinimas.id = asmuo.issilavID group by issilavinimas

--3
select istaiga.pavad, tipas.tipas from mokslai
inner join istaiga on istaiga.id = mokslai.istaigosID
inner join tipas on tipas.id = istaiga.tipasID
where mokslai.baigimas is not null and istaiga.id = mokslai.istaigosID and distinct mokslai.istaigosID 










--3
select istaiga.pavad, tipas.tipas, count(asmuo.id) as 'pabaige' from mokslai
inner join asmuo on asmuo.id = mokslai.asmuoID
inner join istaiga on istaiga.id = mokslai.istaigosID
inner join tipas on tipas.id = istaiga.tipasID
where mokslai.baigimas is not null
group by istaiga.pavad, tipas.tipas order by istaiga.pavad desc