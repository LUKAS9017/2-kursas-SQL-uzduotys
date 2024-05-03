use master 
go

if DB_ID ('issilavinimas') is not null
begin
drop database issilavinimas 
end

go

create database issilavinimas
go
use issilavinimas
go

create table tipas (
	id int primary key identity(1,1),
	tipas nvarchar(20) not null)

create table istaiga(
	id int primary key identity (1,1),
	pavad nvarchar(max) not null,
	tipasID int not null references tipas(id))

create table issilavinimas (
	id int primary key identity(1,1),
	issilavinimas nvarchar(30) not null
	)
go
create table asmuo( 
	id int primary key identity(1,1),
	vardas nvarchar(10) not null,
	pavarde nvarchar(20) not null,
	gimData datetime,
	issilavID int not null references issilavinimas(id))
go

create table mokslai(
	id int primary key identity(1,1),
	asmuoID int not null references asmuo(id),
	istaigosID int not null references istaiga(id),
	istojimas date null,
	baigimas date null)

insert into tipas (tipas) values
('Universitetas'),
('Kolegija'),
('Profesinė mokykla'),
('Gimnazija')

insert into istaiga (pavad, tipasId) values
('Vilniaus universitetas Šiaulių akademija', '1'),
('Šiaulių valstybinė kolegija', '2'),
('Panevėžio kolegija', '2'),
('Alytaus kolegija', '2'),
('Klaipėdos valstybinė kolegija', '2'),
('Utenos kolegija', '2'),
('Šiaulių Lieporių gimnazija', '4'),
('Šiaulių Gegužių gimnazija', '4'),
('Šiaulių Juliaus Janonio gimnazija', '4'),
('Šiaulių Didždvario gimnazija', '4'),
('Šiaulių lengvosios pramonės mokykla', '3'),
('Šiaulių profesinio rengimo centras', '3'),
('Vilniaus universitetas', '1'),
('Radviliškio Vaižganto gimnazija', '4'),
('Radviliškio Lizdeikos gimnazija', '4'),
('Plungės statybininkų mokykla', '3'),
('Plungės Saulės gimnazija', '4'),
('Joniškio Juozo Baičkonio gimnazija', '4'),
('Kretingos pranciškonų gimnazija', '4')


insert into issilavinimas(issilavinimas) values (N'nebaigtas vidurinis')
insert into issilavinimas(issilavinimas) values (N'nebaigtas vidurinis')
insert into issilavinimas(issilavinimas) values (N'profesinis')
insert into issilavinimas(issilavinimas) values (N'aukštasis neuniversitetinis')
insert into issilavinimas(issilavinimas) values (N'aukštasis bakalauras')
insert into issilavinimas(issilavinimas) values (N'aukštasis magistras')
insert into issilavinimas(issilavinimas) values (N'aukštasis daktaras')
insert into issilavinimas(issilavinimas) values (N'vidurinis')

insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Regimantas', N'Jonaitis', '1975.10.12',5)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Petras', N'Petraitis', '1960.04.16',4)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Ugnė', N'Janaitienė', '1967.03.25',4)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Laisvë', N'Laisvutė', '1980.05.15',4)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Raimonda', N'Rūtaitė', '2001.06.12',2)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Ona', N'Rasutienė', '1983.05.25',2)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Romas', N'Romauskas', '2000.04.23',2)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Rokas', N'Rokutis', '2000.03.26',3)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Medas', N'Medauskas', '2000.01.01',2)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Justinas', N'Justinaitis', '1983.04.17',5)
insert into asmuo(vardas, pavarde, issilavId) values (N'Gediminas', N'Astrauskas',5)
insert into asmuo(vardas, pavarde, issilavId) values (N'Algirdas', N'Ardinauskas',3)
insert into asmuo(vardas, pavarde, issilavId) values (N'Lionidas', N'Lagatauskas',2)
insert into asmuo(vardas, pavarde, issilavId) values (N'Raimonda', N'Pliurauskaitė',2)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Elvina', N'Saraidaitienė', '2000.08.10',2)
insert into asmuo(vardas, pavarde, gimData, issilavId) values (N'Rima', N'Trancienė', '1993.01.01',8)


insert into mokslai(asmuoID, istaigosId, istojimas, baigimas) values (1,1,'1996-09-01', '2000-07-01')
insert into mokslai(asmuoID, istaigosId, istojimas, baigimas) values (2,2, '1998-09-01', '2002-07-01')
insert into mokslai(asmuoID, istaigosId, istojimas, baigimas)values (3,3, '1983-09-01', '1987-07-01')
insert into mokslai(asmuoID, istaigosId, istojimas, baigimas) values (4,4, '2002-09-01', '2006-07-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (5,8, '2022-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (6,9, '2002-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (7,10, '2020-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (8,12, '2021-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (9,9, '2022-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas, baigimas) values (10,3, '2002-09-01', '2006-07-01')
insert into mokslai(asmuoID, istaigosId, istojimas, baigimas) values (11,4, '2002-09-01', '2006-07-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (12, 12, '2020-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (13, 19, '2020-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (14, 19, '2021-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas) values (15,19, '2021-09-01')
insert into mokslai(asmuoID, istaigosId, istojimas, baigimas) values (16, 10, '2016-09-01', '2020-07-01')