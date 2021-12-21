--создание модели бд- страны из наруто (Страны, организации, мобы (персонажи), оружие, транспорт)

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


drop table country;
drop table mob;
drop table organisation;
drop table weapon;
drop table transport;



--view


--сделать отдельную таблицу из мобов, состоящих в акацуки
create view orgMembers as
select *
from mob
where organisationId = 3;

select *
from orgMembers;


--создать таблицу с инвентарем отдельного персонажа
create view mobInwentory as
select *
from weapon
where mobId = 1;

select *
from mobInwentory;


-- (11,13,15)  cte, join, group by


--достать воинов из Конохи, чье оружие- кунаи

with konoha_members as (select * from mob where organisationId = 4) /*создаем вспомогательную таблицу с персонажами из 4-ой организации*/
select *
from weapon w
         join konoha_members on w.mobId = konoha_members.id /* объединяем таблицу оружия (name='kunai') и вспомогательную таблицу conoha_members */
where w.name = 'kunai';


--список состава организации

select o.name, m.name
from organisation o
         right join mob m on m.organisationId = o.id
where o.name = 'Akatsuki';


--вывод оружия каждого персонажа

select mob.name, w.name, w.damage
from mob
         left join weapon w on mob.id = w.mobId;


select * from mob cross join organisation o where mob.organisationId = o.id;
select * from mob natural join organisation ;
select * from mob  join organisation o on mob.organisationId=o.id;


--организация с самым быстрым бегуном

with fastest_runners as (select c.id as organisationId,
                                m.id as mobId,
                                m.name /* создаем вспомогательную таблицу из двух таблиц организация и персонаж */
                         from organisation c
                                  join mob m on m.organisationId = c.id)
select t.speed, fr.organisationId, fr.name
from transport t
         join fastest_runners fr on t.mobid = fr.mobId /* объединяем таблицы вспомогательную и транспорт */
group by t.speed, fr.organisationId, fr.name /* групируем по индексам */
having t.speed >= all (select speed from transport);
/* выбираем самого быстрого */



--16. Indexes


--создаем индекс чтобы быстрее выполнять поиск персонажа по id

create index test_index on mob (id);


--создаем индекс для доступа к организации по её имени

create index name_review on organisation using hash (name)


