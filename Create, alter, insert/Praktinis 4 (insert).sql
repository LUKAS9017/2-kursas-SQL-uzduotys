use automobiliai
go

create table masinos
(id int not null primary key identity(1,1),
metai date not null,
kaina money not null)

create table marke
(id int not null primary key identity(1,1),
marke nvarchar(20) not null)

create table modelis
(id int not null primary key identity(1,1),
marke_id int not null references marke(id),
modelis nvarchar(30) not null)

create table kuro_tipas
(id int not null primary key identity(1,1),
kuro_tipas nvarchar(20))

create table spalva
(id int not null primary key identity(1,1),
spalva nvarchar(20))

alter table masinos
add modelis_id int not null references modelis(id),
spalva_id int not null references spalva(id),
kuro_id int not null references kuro_tipas(id)

insert into marke(marke)
values('Toyota'), ('Renault'), ('Nissan'), ('Mercedes-Benz'), ('BMW')

insert into modelis(marke_id, modelis)
values((select id from marke where marke = 'Toyota'),'Yaris'), ((select id from marke where marke = 'Renault'), 'Scenic'), 
((select id from marke where marke = 'Nissan'), 'Leaf'), ((select id from marke where marke = 'Mercedes-Benz'), 'C200'), 
((select id from marke where marke = 'BMW'), 'X6'), ((select id from marke where marke = 'Renault'), 'Laguna')
--reikejo du uzpildyt vienu metu - marke_id ir modelis, nes neisejo po viena

insert into kuro_tipas(kuro_tipas)
values('Elektra'), ('Dyzelinas'), ('Benzinas')

insert into spalva(spalva)
values('Raudona'), ('Balta'), ('Zydra'), ('Juoda'), ('Pilka')

alter table masinos
alter column metai char(4) not null

insert into masinos(metai, kaina, modelis_id, spalva_id, kuro_id)
values('2018', 12800, (select id from modelis where modelis = 'Yaris'), (select id from spalva where spalva = 'Raudona'),
(select id from kuro_tipas where kuro_tipas = 'Elektra')), 
('2010', 3999, (select id from modelis where modelis = 'Scenic'), (select id from spalva where spalva = 'Balta'),
(select id from kuro_tipas where kuro_tipas = 'Dyzelinas')), 
('2013', 8181, (select id from modelis where modelis = 'Leaf'), (select id from spalva where spalva = 'Zydra'),
(select id from kuro_tipas where kuro_tipas = 'Elektra')),
('2011', 11200, (select id from modelis where modelis = 'C200'), (select id from spalva where spalva = 'Juoda'),
(select id from kuro_tipas where kuro_tipas = 'Dyzelinas')),
('2010', 13300, (select id from modelis where modelis = 'X6'), (select id from spalva where spalva = 'Pilka'),
(select id from kuro_tipas where kuro_tipas = 'Benzinas')),
('2003', 880, (select id from modelis where modelis = 'Laguna'), (select id from spalva where spalva = 'Zydra'),
(select id from kuro_tipas where kuro_tipas = 'Benzinas'))

--delete from marke where id = 1 --jei be where, tada deletintu viska, bet as pasirinkau ka norejau deletinti

select * from masinos
select * from marke
select * from kuro_tipas
select * from modelis
select * from spalva