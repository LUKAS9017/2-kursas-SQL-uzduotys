use biblioteka
go

-- PROCEDÛROS

--1 uzduotis
alter procedure vidurkis2
@sk float, @sk2 float
as
begin
select (@sk + @sk2) / 2
end

exec dbo.vidurkis2 5, 10

--2 uzduotis
create procedure iterpimas
@g nvarchar(50)
as
begin
if @g not in (select gatve from gatve)
insert into gatve
values((select max(id) + 1 from gatve), @g)
else print 'tokia gatve jau yra'
end

exec dbo.iterpimas 'Maironio'
select * from gatve

--3 uzduotis
alter procedure pavarde
@p nvarchar(30)
as
begin
select count(pavarde) from skaitytojas where pavarde = @p
select * from skaitytojas where pavarde = @p
end

exec dbo.pavarde 'Simaitis'
select * from skaitytojas

--4 uzduotis (NEBAIGTA)
create procedure pajieska
@sk int, @fragmentas nvarchar(5)
as
begin
if @sk = 0
if @fragmentas like skaitytojas.vardas 
select vardas from skaitytojas where @fragmentas like vardas


else if @sk = 1
select * from autoriai
else if @sk = 2
select * from skaitytojas
select * from autoriai
else print 'pajieska negalima'
end

exec dbo.pajieska 0, 'Simaitis'