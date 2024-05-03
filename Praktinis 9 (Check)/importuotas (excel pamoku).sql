--kad importuoti duomenis: -> betkuri baze -> tasks -> import data -> data source: paskutinis
use Importavimas
go

create table grupe
(id int not null primary key identity(1,1),
grupe nvarchar(10))

create table trimestras
(id int not null primary key identity(1,1),
lietuviu int,
anglu int,
matematika int,
it int,
fizika int)

create table studentas
(id int not null primary key identity(1,1),
vardas nvarchar(20),
pavarde nvarchar(20),
lytis nvarchar(20),
grupe_id int not null references grupe(id),
trimestras_id int not null references trimestras(id))

insert into studentas(vardas, pavarde, lytis, grupe_id, trimestras_id)
select right([Pavardë, vardas], len([Pavardë, vardas]) - charindex(' ', [Pavardë, vardas])), 
left([Pavardë, vardas], charindex(' ', [Pavardë, vardas])), lytis, 
grupe.id, trimestras.id from studentai$
inner join grupe on Grupë = grupe
inner join trimestras on trimestras.lietuviu = studentai$.Lietuviø and trimestras.anglu = studentai$.[Anglø kalba] and
trimestras.matematika = studentai$.[Matematika ] and trimestras.it = studentai$.[Informacinës technologijos ] and
trimestras.fizika = studentai$.Fizika

insert into grupe(grupe)
select distinct Grupë from studentai$

insert into trimestras(lietuviu, anglu, matematika, it, fizika)
select distinct Lietuviø, [Anglø kalba], [Matematika ], [Informacinës technologijos ], Fizika from studentai$

alter table grupe
add istojimo_metai nvarchar(10)
check(istojimo_metai = concat('[0-9]', '[0-9]', '[0-9]', '[0-9]') and istojimo_metai < year(getdate()))

alter table trimestras
add constraint labas
check(lietuviu > 0 and lietuviu <11 and anglu > 0 and anglu <11 and matematika > 0 and matematika <11 and 
it > 0 and it <11 and fizika > 0 and fizika <11)

alter table trimestras
add daile nvarchar(20) default 'Iskaita'

alter table studentas
add constraint sveiki unique(vardas, pavarde) 
--unique, kad nebutu tokio pacio vardo su pavarde, o constraints tam, kad galetum prideti unique ir kitokius dalykus

--delete from studentas
--delete from grupe
--delete from trimestras

select * from studentai$

select * from trimestras
select * from studentas