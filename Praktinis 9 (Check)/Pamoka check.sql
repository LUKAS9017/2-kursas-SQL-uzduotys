use dtipai 
go

create table asmuo2
(id int not null,
vardas nvarchar(15),
gim_data date not null,
--constraint pirminis primary key(id),
check(vardas like '%[0-9]%')) 
--checkas arba constraint, nzn kuris, kazkaip su design table susijes, tikriausiai daro, kad duomenu negali netinkamu ivesti

select * from asmuo2

--unique kaska svarbaus daro, pasipraktikuok
