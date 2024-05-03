use kinas
go

create table Aktorius
(id int not null primary key identity(1,1),
vardas nvarchar(20) not null,
pavarde nvarchar(20) not null,
gim_data date not null)

create table Zanras
(id int not null primary key identity(1,1),
zanras nvarchar(20) not null)

create table Kinas
(id int not null primary key identity(1,1),
pavadinimas nvarchar(20) not null,
metai char(4) not null)

create table Kino_zanras
(id int not null primary key identity(1,1),
kinas_id int not null references Kinas(id),
zanras_id int not null references Zanras(id))

create table Vaidino
(id int not null primary key identity(1,1),
aktorius_id int not null references Aktorius(id),
kinas_id int not null references kinas(id))

alter table Kinas
alter column pavadinimas nvarchar(30)

insert Kinas(pavadinimas, metai)
values('Tadas Blinda. Pradþia', '2011'), ('Laumës vaikas', '2008'), ('Ponas ir ponia Smitai', '2005')

insert Zanras(zanras)
values('Nuotykiu'), ('Mistinis'), ('Kriminalinis'), ('Drama'), ('Trileris')

alter table Aktorius
alter column gim_data date null

insert Aktorius(vardas, pavarde)
values('Mantas', 'Jankavicius'), ('Dainius', 'Kazlauskas'), ('Agne', 'Ditkovskyte'), ('Angelina', 'Jolie'), 
('Gattlin', 'Griffith'), ('Brad', 'Pitt')

--DAR NERUNINAU, NEPADARIAU KAD ANGELINA 2 FILMOSE VIENU METU
insert Vaidino(aktorius_id, kinas_id)
values((select id from Aktorius where vardas = 'Mantas'), (select id from Kinas where pavadinimas like 'Tadas Blinda. Pradþia%')),
((select id from Aktorius where vardas = 'Dainius'), (select id from Kinas where pavadinimas like 'Tadas Blinda. Pradþia%')),
((select id from Aktorius where vardas = 'Agne'), (select id from Kinas where pavadinimas like 'Tadas Blinda. Pradþia%')),
((select id from Aktorius where vardas = 'Angelina'), (select id from Kinas where pavadinimas like 'Laumës vaikas%')),
((select id from Aktorius where vardas = 'Gattlin'), (select id from Kinas where pavadinimas like 'Laumës vaikas%')), 
((select id from Aktorius where vardas = 'Brad'), (select id from Kinas where pavadinimas like 'Ponas ir ponia Smitai%'))

insert Kino_zanras(kinas_id, zanras_id)
values((select id from Kinas where id = 4), (select id from  

--delete from Vaidino where id = 5 --jei be where, tada deletintu viska, bet as pasirinkau ka norejau deletinti


select * from Aktorius
select * from Kinas
select * from Kino_zanras
select * from Vaidino
select * from zanras