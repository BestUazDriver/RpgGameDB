
create table airports
(
    id   serial primary key,
    name varchar(20)
);
create table airplanes
(
    id   serial primary key,
    name varchar(20)
);
create table passengers(
                           id serial primary key,
                           name varchar(20)
);
create table reis
(
    id           serial primary key,
    airportIdIn  int,
    airportIdOut int,
    arplaneId    int,
    teamsId      int,
    outDate      date,
    inDate       date
);
create table teams
(
    id          serial primary key,
    pilot1      varchar(20),
    pilot2      varchar(20),
    stuardesses varchar(20),
    techs       varchar(20)
);
select count(*), name
from airports
         join reis f on f.airportIdOut = airports.id and f.outDate = '2021-11-11'
group by name;
select id, inDate-outDate from reis where (inDate-outDate)=(select max(inDate-reis.outDate) from reis);
insert into teams (pilot1, pilot2, stuardesses, techs) VALUES ('pavel', 'misha', 'olya', 'vitya');
insert into teams (pilot1, pilot2, stuardesses, techs) VALUES ('pain', 'konan', 'olya', 'vitya');
insert into teams (pilot1, pilot2, stuardesses, techs) VALUES ('sasuke', 'naruto', 'olya', 'vitya');
insert into airports (name) values ('domodedovo'), ('sheremetievo'), ('kitay airport');
insert into reis (airportIdIn, airportIdOut, arplaneId, teamsId, outDate, inDate) VALUES
(1,2,1,1,'2021-11-10', '2021-11-12'),
(1,2,1,1,'2021-11-13', '2021-11-14'),
(1,2,1,1,'2021-11-11', '2021-11-12');
insert into reis (airportIdIn, airportIdOut, arplaneId, teamsId, outDate, inDate) VALUES
(1,2,1,1,'2021-11-10', '2021-11-12');
insert into airplanes (name) values ('boeing-1001923'), ('lada niva'), ('bmw m5');
insert into passengers (name) values ('a'), ('b'), ('c');



drop table teams;
drop table airports;
drop table airplanes;
drop table passengers;
drop table reis;