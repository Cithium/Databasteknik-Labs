select firstName, lastName
from students;                  #Uppgift 1a

select firstName, lastName      #Uppgift 1b
from students
order by lastName, firstName;

select pNbr
from students
where pNbr like '75%';        #Uppgift 1c

select pNbr
from students
where mod(substr(pNbr, 10 , 1), 2) = 0 ; #uppgift 1d

select count(*)
from students;                           #uppgift 1e

select *
from courses
where courseCode like 'FMA%';            #Uppgift 1f

select *
from courses
where credits > 5;                       #Uppgift 1g

select *
from takenCourses
where pNbr = '790101-1234';             #Uppgift 1h

select courseName, credits
from courses
where courseCode in 
(select courseCode                     #Uppgift 1i  
from takencourses       
where pNbr = '790101-1234');

select sum(credits) as total from(courses)
where courseCode in
(select courseCode                     #Uppgift 1j  
from takencourses       
where pNbr = '790101-1234');

select avg(grade)
from takencourses
where pNbr = '790101-1234';           #Uppgift 1k


select *
from takenCourses
where pNbr = (select pNbr                                 # uppgift l, courses, credits och grade för Eva
from students
where firstName = 'Eva' and lastName = 'Alm') ;

select courseName, credits
from courses
where courseCode in 
(select courseCode                       
from takencourses       
where pNbr = (select pNbr                                 # uppgift l, courses & credits för Eva
from students
where firstName = 'Eva' and lastName = 'Alm')) ;

select sum(credits) as total from(courses)
where courseCode in
(select courseCode                 
from takencourses       
where pNbr = (select pNbr                                 # uppgift l, summa av credits för Eva
from students
where firstName = 'Eva' and lastName = 'Alm'));

select avg(grade)
from takenCourses
where pNbr = (select pNbr                                 # uppgift l, average av grades för Eva
from students
where firstName = 'Eva' and lastName = 'Alm');

select firstName, lastName
from students
where pNbr not in (select pNbr from takencourses);











