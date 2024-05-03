use biblioteka
go

create function vidurkis
(@kint float, @kint2 float)
returns float 
as
begin
return (@kint + @kint2) / 2
end

select dbo.vidurkis(5.3, 4.7)--, vardas from skaitytojas --galima prideti from, kad is kitur imti duomenis



alter procedure vidurkis1
@kint float, @kint2 float
as begin
select (@kint + @kint2) / 2
end

exec vidurkis1 5.5, 10



use smallBussiness
go

select biblioteka.dbo.vidurkis(min_salary, max_salary) as vidurkis from jobs