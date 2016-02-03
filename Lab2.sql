


set foreign_key_checks = 0;
drop table if exists user;

set foreign_key_checks = 1;

create table user
(name varchar(45),
address varchar(45),
telNbr integer,
userName varchar(10),
primary key (userName));
                                                                            #a uppgift
insert into user (name, address, telNbr, userName)
values ('Osama Menim', 'Rubinvägen 38', 0777777, 'Oze131');

insert into user (name, address, telNbr, userName)
values ('Hamza Abdulilah', 'Malmögatan 3', 0777777, 'Hamzi131');

insert into user (name, address, telNbr, userName)
values ('Henrik Olsson', 'Anujansgata 8', 0777777, 'Henke11');

select * 
from user
order by name;

#--------------------------------------------------------------------------------------------------

create table theatre
(theName varchar(45),                                 #Understrukna attribut i IR modellen är PrimaryKeys
seats integer,
primary key (theName));

set foreign_key_checks = 1;
set foreign_key_checks = 0;
drop table if exists theatre;

insert into theatre (theName, seats)
values ('Royal', 540);
insert into theatre (theName, seats)
values ('Entré', 120);
insert into theatre (theName, seats)
values ('Filmstaden', 245);

select *
from theatre
order by theName;
#-----------------------------------------------------------------------------------------------

create table movie( title varchar(45), primary key(title));

set foreign_key_checks = 1;
set foreign_key_checks = 0;
drop table if exists movie;

insert into movie (title)
values ('Gudfadern');
insert into movie (title)
values ('Kalle Anka');
insert into movie (title)
values ('The Watch');
insert into movie (title)
values ('Divergent');
insert into movie (title)
values ('The Town');
insert into movie (title)
values ('Hobbit');

select * 
from movie
order by title;    

#-----------------------------------------------------------------------------------------------------


set foreign_key_checks = 1;
set foreign_key_checks = 0;

drop table if exists performance;

create table performance
(date varchar(45),                                                 #Weak entity, performance tar date, title ochv teaternamn.
title varchar(45),                                                 #Date och title utgör en key i detta fallet
theName varchar(45),                                    
primary key (date, title),
foreign key (title) references movie (title),                      #Foreign keys är nycklar som används från andra "klasser"
foreign key (theName) references theatre (theName));

insert into performance(date, title , theName)
values('2017-01-25', 'Hobbit', 'Royal');
insert into performance (date, title, theName)
values ('2016-01-23', 'Divergent', 'Royal');
insert into performance (date, title, theName)
values ('2016-01-25', 'Divergent', 'Entré');
insert into performance (date, title, theName)
values ('2016-01-17', 'Kalle Anka', 'Royal');
insert into performance (date, title, theName)
values ('2016-02-03', 'Divergent', 'Filmstaden');

select *
from performance
order by date;
#---------------------------------------------------------------------------------------------------------

set foreign_key_checks = 1;
set foreign_key_checks = 0;

drop table if exists reservation;

create table reservation (userName varchar(45),
resNbr integer auto_increment,
date varchar(45),                                                        #Enligt modellen, så ska reservation bestå utav grannarna (relationer) höger&vänster. Weak entity.
title varchar(45),
primary key (resNbr),
foreign key (userName) references user (userName),                       #Foreign keys är nycklar som används från andra "klasser"
foreign key (date, title) references performance (date, title));

insert into reservation (userName, date, title)
values ('Oze131', '2017-01-25' , 'Hobbit');

insert into reservation (userName, date, title)
values ('Henke11', '2016-02-03', 'Divergent');
insert into reservation (userName, date, title)
values ('Hamzi131','2016-01-17', 'Kalle Anka');

select *
from reservation
order by date;
