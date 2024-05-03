use destytojai
go

create table dalykai
(id int not null primary key identity(1,1),
dalykas nvarchar(40) not null)

create table Destytojas
(id int not null primary key identity(1,1),
vardas nvarchar(30) not null,
pavarde nvarchar(30) not null,
gim_data char(10) not null,
dalyko_id int not null references dalykai(id))

create table rysiai
(id int not null primary key identity(1,1),
Destytojas_id int not null references Destytojas(id),
Dalyko_id int not null references dalykai(id))

drop table rysiai
drop table Destytojas
drop table dalykai
drop column dalyko_id
alter table Destytojas
--add lytis nvarchar(7) not null
--delete lytis


insert into dalykai(dalykas)
values('Tinklinis programavimas'), ('Puslapiø kûrimas'), ('Duomenø pajieðka internete'),
('Elektroninis verslas'), ('Informacinës technologijos')

insert into Destytojas(vardas, pavarde, gim_data, dalyko_id)
values('Rokas', 'Rokaitis', '1978-03-13', (select id from dalykai where id = 1)),
('Petras', 'Petraitis', '1975-06-23', (select id from dalykai where dalykas = 'Elektroninis verslas')),
('Regina', 'Jurgaitiene', '1976-05-14', (select id from dalykai where dalykas = 'Duomenø pajieðka internete')),
('Saule', 'Laimute', '1979-02-13', (select id from dalykai where dalykas = 'Informacinës technologijos')),
('Liepa', 'Lapiene', '1981-04-24', (select id from dalykai where dalykas = 'Informacinës technologijos')),
('Jurgis', 'Jurgutis', '1987-02-23', (select id from dalykai where dalykas = 'Tinklinis programavimas'))

insert into rysiai(destytojas_id, dalyko_id)
values((select id from destytojas where vardas = 'Rokas'), (select id from dalykai where dalykas = 'Tinklinis programavimas')),
((select id from destytojas where vardas = 'Rokas'), (select id from dalykai where dalykas = 'Puslapiø kûrimas')),
((select id from destytojas where vardas = 'Rokas'), (select id from dalykai where dalykas = 'Duomenø pajieðka internete')),
((select id from destytojas where vardas = 'Petras'), (select id from dalykai where dalykas = 'Elektroninis verslas')),
((select id from destytojas where vardas = 'Regina'), (select id from dalykai where dalykas = 'Duomenø pajieðka internete')),
((select id from destytojas where vardas = 'Saule'), (select id from dalykai where dalykas = 'Informacinës technologijos')),
((select id from destytojas where vardas = 'Liepa'), (select id from dalykai where dalykas = 'Informacinës technologijos')),
((select id from destytojas where vardas = 'Jurgis'), (select id from dalykai where dalykas = 'Tinklinis programavimas')),
((select id from destytojas where vardas = 'Jurgis'), (select id from dalykai where dalykas = 'Puslapiø kûrimas'))

update destytojas set pavarde = 'Pakeista' where pavarde = 'Saule'

select * from dalykai
select * from Destytojas
select * from rysiai