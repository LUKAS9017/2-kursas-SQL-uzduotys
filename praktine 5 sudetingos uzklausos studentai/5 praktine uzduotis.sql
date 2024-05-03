use studentai
go

--5 praktine uzduotis
--Sudëtingø SQL uşklausø kûrimas

/*--1 uzduotis
select vardas, pavarde, grupe from student --kai inner join panaudoji, tada jama is abeju baziu bendrai, todel galejau "grupe" parasyt
inner join grupe on student.grupe_id = grupe.id
where grupe = 'informaciniø sistemø technologija'*/

/*--2 uzduotis
select vardas, pavarde, avg(paz) as paz_vidurkis from student 
inner join vertinimas on student.id = vertinimas.stud_id group by vardas, pavarde*/

/*--3 uzduotis
select grupe, count(grupe_id) as grupiu_skaicius from grupe
inner join student on grupe.id = student.grupe_id group by grupe --reikia ziureti su kuo sujungi, nes kitaip atspausdins per mazai rezultatu*/

/*--4 uzduotis
select vardas, pavarde, pavadinimas from dest
inner join dalykas on dalykas.dest_id = dest.id 
where dest_id = 5*/

--5 uzduotis
