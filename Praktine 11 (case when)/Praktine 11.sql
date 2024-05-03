use biblioteka
go
use smallBussiness
go

--1
declare @a int 
set @a = 0

while @a<10
begin 
print @a
set @a = @a + 1
end

--2
create table asmuo
(id int not null primary key identity(1,1),
vardas nvarchar (30) not null,
pavarde nvarchar(30) not null,
gim_data date not null)

insert into asmuo(vardas, pavarde, gim_data)
values('Jonas', 'Jonaitis', '1997-05-04'), ('Aldona', 'Macijauskaite', '1984-02-12'), ('Maryte', 'Marija', '1965-12-12'),
('Kestas', 'Kestulis', '1995-04-15'), ('Andrius', 'Andrulis', '2000-01-01'), ('Ricardas', 'Rycka', '1993-03-11'),
('Lebronas', 'Jaimsas', '2003-04-16'), ('Zigmantas', 'Zigmis', '1950-05-15'), ('Sepetys', 'visockis', '1999-09-19'),
('Ciobrelyte', 'skaniene', '1987-06-29')

update asmuo set gim_data = '1988-04-12' where gim_data = '1998-04-12'

declare @d date
select @d = Min(gim_data) from asmuo
select vardas, pavarde, gim_data from asmuo 
where gim_data = @d

select STRING_AGG(vardas, ', ') from asmuo --pateikia visus vardus vienoje eiluteje

declare @d int
--declare @amzius int
select @d = avg(year(getdate()) - year(gim_data)) from asmuo
--select @amzius = year(getdate()) - year(gim_data)
select vardas, pavarde, year(getdate()) - year(gim_data) as amzius,
case when year(getdate()) - year(gim_data) < @d then 'jaunesnis' 
else case when year(getdate()) - year(gim_data) = @d then 'sutampa' else 'senesnis' end end from asmuo

--3 yra 8 praktineje

--4.1
select first_name, last_name, hire_date, year(getdate()) - year(hire_date) as laiko_dirba, salary,
case when year(getdate()) - year(hire_date) > 30 then salary else 500 end as premija from employees


--4.2
select employees.first_name, employees.last_name, 
case when count(dependents.employee_id) > 1 then '1 per menesi'
else case when count(dependents.employee_id) = 1 then '1 per 3 menesius'
else case when count(dependents.employee_id) = 0 then 'nepriklauso' else 'klaida' end end end as tevadieniai 
from employees 
left join dependents on employees.employee_id = dependents.employee_id
group by employees.first_name, employees.last_name

/*select * from employees -- cia buvo parodymas kaip inner join nuo left join skiriasi
left join dependents on employees.employee_id = dependents.employee_id

select * from employees
inner join dependents on employees.employee_id = dependents.employee_id*/ 

--4.3 nebaigiau
declare @x int
select @x = 10 from employees
case when @x < 10 then 
	insert into employees(first_name, last_name) 
	values('Derekas', 'akylas') else end 
