create database imones
go
use imones
go

/*
create table imones
(id int not null primary key identity(1,1),
im_kodas char(6) not null, --ne int vietoj char, nes int negali prasideti nuliu ir im_kodas ne matematiskai svarbus
pavadinimas nvarchar(50) not null,
tel nvarchar(13)) --pagal nutilejima "null", tai nereikia rasyti
go

create table paslaugos
(id int not null primary key identity(1,1),
paslauga nvarchar(max) not null,
kaina money not null,
aprasymas ntext)
go

create table darbuotojai 
(id int not null primary key identity(1,1),
vardas nvarchar(20) not null,
pavarde nvarchar(20) not null,
tel nvarchar(13))
go

create table uzsak
(id int not null primary key identity(1,1),
imonesID int not null references imones(id),
paslaugosID int not null references paslaugos(id),
darbuotojaiID int not null references darbuotojai(id))
*/


insert into imones(pavadinimas, im_kodas) --kiek executinsi inserta tiek ir prides, todel geriau uzkomentint ji kad nebutu dahuja
values(123456, 'UAB')

select * from imones