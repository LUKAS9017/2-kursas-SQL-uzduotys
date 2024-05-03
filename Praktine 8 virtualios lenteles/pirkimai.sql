create database pirkimai
go
use pirkimai
go
create table tipas
(
id int not null primary key,
tipas nvarchar(30))
go 
create table prekes
(
id int not null primary key,
preke nvarchar(30),
tipas_id int references tipas(id))
go
create table tiekejai
(
id int not null primary key,
tiekejas nvarchar(30))
go
create table uzsakymas
(
id int not null primary key identity(1,1),
preke_id int references prekes(id),
tiek_id int references tiekejai(id),
kiekis int,
kaina money)
go
insert into tipas values (1, 'Kompiuterinė technika')
insert into tipas values (2, 'Buitinė technika')
insert into tipas values (3, 'Sodo technika')
insert into tipas values (4, 'Įrankiai')
insert into tipas values (5, 'Atsarginės dalys')

insert into tiekejai values (1, 'UAB "Kompiuteriukas"')
insert into tiekejai values (2, 'UAB "Viskas namams ir sodui"')
insert into tiekejai values (3, 'UAB "Meistriukas"')
insert into tiekejai values (4, 'UAB "Technika jums"')

insert into prekes values (1, 'Kompiuterio pelė',1)
insert into prekes values (2, 'Skalbimo mašina',2)
insert into prekes values (3, 'Žoliapjovė',3)
insert into prekes values (4, 'Atsuktuvai',4)
insert into prekes values (5, 'Plaktukas',4)
insert into prekes values (6, 'Klaviatūra',1)
insert into prekes values (7, 'Sulčiaspaudė',2)
insert into prekes values (8, 'Šakų smulkintuvas',3)

insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (1,1,10,15.99)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (2,1,2,1700)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (3,2,3,1200)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (4,3,9,57)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (5,2,3,12.79)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (5,3,5,9.70)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (6,1,2,29)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (7,2,3,379)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (8,2,1,467)
insert into uzsakymas(preke_id, tiek_id, kiekis, kaina) values (8,3,1,399)


