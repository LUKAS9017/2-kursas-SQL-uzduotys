use master
go
drop database trigeriai
go
create database trigeriai
go

use trigeriai
go

--1 uzduotis
create table rysio_planai
(id int not null primary key identity(1,1),
rysio_plano_nr int not null,
pavadinimas nvarchar(30) not null,
sujungimo_kaina money not null,
PSK money not null)

create table klientas
(id int not null primary key identity(1,1),
kliento_nr int not null,
vardas nvarchar(30) not null,
pavarde nvarchar(30) not null,
tel char(9) not null,
rysio_planas int not null references rysio_planai(id))

create table isklotine
(id int not null primary key identity(1,1),
kliento_id int not null references klientas(id),
data date not null,
laikas time not null,
skambinta_nr char(9) not null,
pokalbio_trukme int not null)

create table saskaita
(id int not null primary key identity(1,1),
kliento_id int not null references klientas(id),
menuo char(2) not null,
metai char(4) not null,
suma money not null)

--2 uzduotis
create trigger naujas_klientas
on klientas
for insert
as
begin
insert into saskaita(menuo, metai, suma, kliento_id)
select month(getdate()), year(getdate()), 0, kliento_nr from inserted --inserted pajam insertuotus duomenis
end

insert into rysio_planai
values(1, 'tele2', 3, 3)

insert into klientas
values(1, 'Kevinas', 'Durantas', 867554063, 1)

select * from rysio_planai
select * from klientas
select * from saskaita

--3 uzduotis
create trigger iskloti
on isklotine
for update
as
begin
update saskaita
set suma = suma + (select sujungimo_kaina + (PSK * (select pokalbio_trukme from inserted)) from rysio_planai --inserted pajam insertuotus duomenis
inner join isklotine on rysio_planai.id = isklotine.id)
end

insert into isklotine
values(1, '2003-06-14', '13:40:50', 863457381, 20)

update isklotine
set pokalbio_trukme = pokalbio_trukme + 50

select * from isklotine
select * from saskaita

--4 uzduotis
create table rysio_planai_kopijos
(id int not null primary key identity(1,1),
rysio_plano_nr int not null,
pavadinimas nvarchar(30) not null,
sujungimo_kaina money not null,
PSK money not null,
keitimo_data date not null,
vartotojas nvarchar(30) not null,
veiksmas char(6) not null)

create trigger duomenys
on rysio_planai
for update, insert, delete
as
begin
if exists (select * from inserted) and exists (select * from deleted) 
begin
insert into rysio_planai_kopijos
select rysio_plano_nr, pavadinimas, sujungimo_kaina, PSK , getdate(), 'Lukas', 'up-del' from deleted
insert into rysio_planai_kopijos
select rysio_plano_nr, pavadinimas, sujungimo_kaina, PSK , getdate(), 'Lukas', 'up-ins' from inserted
end

else if exists (select * from inserted)
begin
insert into rysio_planai_kopijos
select rysio_plano_nr, pavadinimas, sujungimo_kaina, PSK , getdate(), 'Lukas', 'insert' from inserted
end

else 
begin
insert into rysio_planai_kopijos
select rysio_plano_nr, pavadinimas, sujungimo_kaina, PSK , getdate(), 'Lukas', 'delete' from deleted
end
end

insert into rysio_planai
values(2, 'ezys', 5, 2)

update rysio_planai
set pavadinimas = 'labas' where id= 2

delete from rysio_planai
where id = 2

select * from rysio_planai_kopijos --padaro kopijas vis kai insertina, updatina arba deletina

--5 uzduotis
create table saskaita_kopija
(id int not null primary key identity(1,1),
kliento_id int not null references klientas(id),
menuo char(2) not null,
metai char(4) not null,
suma money not null)

alter trigger kopijavimas
on saskaita
instead of delete --vietoj for parasiau instead of, reikia cia zaistis sujai norimam rezultatui gauti
as
begin
insert into saskaita_kopija
select kliento_id, menuo, metai, suma from saskaita
end

delete from saskaita where id = 1

select * from saskaita
select * from saskaita_kopija