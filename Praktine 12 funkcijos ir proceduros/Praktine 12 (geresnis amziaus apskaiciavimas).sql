use biblioteka
go

--PRAKTINË UÞDUOTIS NR. 12 Funkcijø ir procedûrø kûrimas

--1
create function apskritimo_perimetras
(@r float)
returns float
as
begin
return 2 * pi() * @r
end

select dbo.apskritimo_perimetras(20)


--2
create function amzius
(@gim_data date)
returns int
as
begin
declare @b int
select @b = DATEDIFF(day,@gim_data,GETDATE())/365 --Tikslesnis budas amziu apskaiciuoti. Neapskaiciuoti kelemieji metai
return @b
end

select dbo.amzius('2003-04-16')


--3
alter function paimtos_knygos
(@skaitytojo_id int)
returns int
as
begin
declare @a int
select @a = count(egz_id) from skaito where skaitytojas_id = @skaitytojo_id and g_data is null
return @a
end

select dbo.paimtos_knygos(13)


--4 (galejau trumpiau padaryti su inner joinais)
alter function paimtu_knygu_sarasas
(@pavarde nvarchar(20))
returns nvarchar(30)
as
begin
declare @pavarde_id int
declare @egzemplioriu_id table(id int)
declare @knygu_id table(id int)
declare @knygos table(id int)
declare @knygos_pav nvarchar(30)
set @knygos_pav = ''

select @pavarde_id = id from skaitytojas where pavarde = @pavarde --like @pavarde + '%' ir nutrini 20 nuo nvrachar irgi teisingai
insert into @egzemplioriu_id select egz_id from skaito where @pavarde_id = skaitytojas_id
insert into @knygu_id select knyga_id from egz where egz.id in (select * from @egzemplioriu_id)
insert into @knygos select id from knyga where knyga.id in (select * from @knygu_id)
select @knygos_pav = @knygos_pav + ', ' + pavadinimas from knyga where knyga.id in (select * from @knygos)

return @knygos_pav
end

select dbo.paimtu_knygu_sarasas('Kalnaitis')

--5


