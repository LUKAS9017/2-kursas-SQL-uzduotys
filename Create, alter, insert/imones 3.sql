use imones
go

select * from uzsak
select * from imones
select * from darbuotojai
select * from paslaugos

/*alter table uzsak
add uzsak_data date not null
default getdate()*/

/*alter table uzsak
add iv_term date*/

select top 2 id from uzsak
update uzsak
set uzsak_data = '2022.02.11', iv_term = '2022.09.25'
	where ID in (1,2)  --arba  in(select top 2 id from uzsak)