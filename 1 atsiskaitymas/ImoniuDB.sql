
create database imoniuDB
go
use imoniuDB
go
create table forma (
	id int primary key identity(1,1),
	tipas nvarchar(30))
go
create table gatve (
	id int primary key identity(1,1),
	gatve nvarchar(30))
go
create table miestas (
	id int primary key identity(1,1),
	miestas nvarchar(30))
go
create table adresas (
	id int primary key identity(1,1),
	gatve_id int not null references gatve(id), 
	namas nvarchar(4) not null,
	butas nvarchar(4) null,
	miestas_id int not null references miestas(id))
go
create table imones( 
	id int primary key identity(1,1),
	pavadinimas nvarchar(30) not null,
	forma_id int not null references forma(id),
	adresas_id int not null references adresas(id),
	ikur_data datetime not null,
	apyvarta int)
go

insert into forma values
('Uþdaroji akcinë bendrovë'),
('Individuali ámonë'),
('Maþoji bendrija'),
('Akcinë bendrovë')

insert into gatve values
('Tilþës'),
('Liepø'),
('Serbentø'),
('Geguþiø'),
('Kaimo'),
('Vaidoto'),
('Gytariø'),
('Trakø')

insert into miestas values
('Ðiauliai'),
('Radviliðkis'),
('Joniðkis'),
('Maþeikiai'),
('Panevëþys'),
('Pakruojis'),
('Pasvalys'),
('Kaunas')

insert into adresas values
(1, 37,15, 1),
(2, 15,12, 2),
(3, 48,10, 1),
(4, 30,6, 1),
(5, 21,23, 3),
(4, 75,123, 1),
(1, 48,12, 1),
(1, 271,156, 1),
(8, 13,5, 2),
(2, 75,7, 2),
(4, 50,89, 1)

insert into imones values ('Pirmoji',1, 1, '1980.08.12',12365)
insert into imones values ('Antroji',1, 2, '1987.06.05',1258965)
insert into imones values ('Treèioji',2, 3, '1990.04.27',12365)
insert into imones values ('Ketvirtoji',1, 4, '1990.01.12',14785)
insert into imones values ('Penktoji',3, 5, '1991.07.25',1258963)
insert into imones values ('Ðeðtoji',2, 6, '1993.08.15',125852)
insert into imones values ('Septintoji',1, 7, '1997.09.13',963852)
insert into imones values ('Aðtuntoji',2, 8, '2018.03.29',74125)
insert into imones values ('Devintoji',3, 9, '2005.04.15',12369)
insert into imones values ('Deðimtoji',1, 10, '2006.07.05',125896)
insert into imones values ('Dvideðimtoji',3, 11,'2014.12.05',85000)