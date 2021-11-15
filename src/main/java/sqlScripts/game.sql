create table Country
(
    id   serial primary key,
    name varchar(20)
);
create table Organisation
(
    id        serial primary key,
    countryId integer,
    name      varchar(20)
);
create table Mob
(
    id             serial primary key,
    organisationId integer,
    name           varchar(20)
);
create table Transport
(
    id    serial primary key,
    mobId integer,
    speed integer,
    name  varchar(20)
);
create table Weapon
(
    id     serial primary key,
    mobId  integer,
    damage integer,
    name   varchar(20)
);

insert into Country (name)
values ('USA');
insert into Country (name)
values ('Japan');
insert into Organisation (countryId, name)
values (1, 'NIP');
insert into Organisation (countryId, name)
values (1, 'RENEGADES');
insert into Organisation (countryId, name)
values (2, 'Akatsuki');
insert into Organisation (countryId, name)
values (2, 'Konoha');
insert into Mob (organisationId, name)
values (3, 'Itachi');
insert into Mob (organisationId, name)
values (3, 'Pain');
insert into Mob (organisationId, name)
values (4, 'Naruto');
insert into Weapon (mobId, damage, name)
values (1, 10, 'kunai');
insert into Weapon (mobId, damage, name)
values (3, 10, 'kunai');
insert into Weapon (mobId, damage, name)
values (2, 30, 'iron stick');
insert into Transport (mobId, speed, name)
values (3, 90, 'air');
insert into Transport (mobId, speed, name)
values (1, 20, 'foot');
insert into Transport (mobId, speed, name)
values (2, 20, 'foot');

create view orgMembers as
select *
from mob
where organisationId = 3;
select *
from orgMembers;
create view mobInwentory as
select *
from weapon
where mobId = 1;
select *
from mobInwentory;

drop table country;
drop table mob;
drop table organisation;
drop table weapon;
drop table transport;


