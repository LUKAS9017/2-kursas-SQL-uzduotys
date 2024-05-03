use master
go --go padarok kad kodas toliau eitu, net jeigu sutinka klaida, tai kodas po apacia vistiek bus ivygditas net jei pries go buvo klaida
drop database testas
go
create database testas
go
use testas
go

create table miestai
(id int not null primary key identity(1,1), 
miestas nvarchar(20) not null)
go

create table asmuo
(id int not null, 
vardas nvarchar(20) not null,
pavarde nvarchar(30) not null,
miestasID int not null references miestai(id))

/*
alter table asmuo --cia "asmuo" table pataisymui, kad pataisyti reikejo atskirai rasyti
add primary key(id)

alter table asmuo
add kitas bit not null --prideti stulpeli

alter table asmuo
alter column kitas int null --koreguoti stulpeli

alter table asmuo
drop column kitas --ismesti stulpeli
*/