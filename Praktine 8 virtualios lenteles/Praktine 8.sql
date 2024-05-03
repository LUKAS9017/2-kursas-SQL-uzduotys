use pirkimai
go

--praktine 8 - virtulios_lenteles

--1 uzduotis
alter view prekes_info
as
select preke, tipas, kiekis, kaina, tiekejas, (kiekis * kaina) as suma_be_PVM, '21%' as PVM,  
(kiekis * kaina * 0.21) as PVM_dydis_eurais, (kiekis * kaina * 0.21 + kiekis * kaina) as suma_su_PVM,
case when kaina > 50 then kaina + kaina * 10 / 100 else kaina + kaina * 20 / 100 end as antkainis from prekes
inner join tipas on prekes.tipas_id = tipas.id
inner join uzsakymas on prekes.id = uzsakymas.preke_id
inner join tiekejai on tiekejai.id = uzsakymas.tiek_id

/*--2 uzduotis
select preke, tipas, kiekis, kaina, tiekejas, suma_be_PVM, PVM, PVM_dydis_eurais, suma_su_PVM from prekes_info order by kaina asc*/

/*--3 uzduotis
select tiekejas, sum(suma_be_PVM) as kaina_be_PVM, '21%' as PVM, sum(suma_su_PVM) as kaina_su_PVM from prekes_info group by tiekejas*/

/*--4 uzduotis
select preke, tipas, kaina from prekes_info
where kaina > 300*/