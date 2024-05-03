use biblioteka
go

exec sp_tables --exec yra execute trumpinys

exec sp_rename 'autorius', 'autoriai' --jau ivygdziau sita komanda

exec sp_spaceused autoriai

exec sp_columns autoriai


select * from miestas
if 'Alytus' not in (select miestas from miestas)
insert into miestas
values((select max(id) + 1 from miestas ), 'Alytus') --selectas nesvarbus, tiesiog nebuvo automatinio id skaiciavimo
else print 'toks miestas yra'

--pavertem visutini koda i procedura
create procedure iterpti
@m nvarchar(50)
as
begin
if @m not in (select miestas from miestas)
insert into miestas
values((select max(id) + 1 from miestas ), @m) --selectas nesvarbus, tiesiog nebuvo automatinio id skaiciavimo
else print 'toks miestas yra'
end

exec dbo.iterpti 'Alytus'

--exec dbo.iterpti @m = 'Joniðkis'