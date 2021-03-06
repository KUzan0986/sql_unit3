create table if not exists Genre(
ID serial primary key,
Name_genre varchar(50) not null unique);

create table if not exists Singer(
ID serial primary key,
Name_singer varchar(50) not null unique);

create table if not exists Singer_genre(
ID serial primary key,
ID_singer integer references Singer(ID),
ID_genre integer references Genre(ID),
constraint un unique (ID_singer, ID_genre));

create table if not exists Albom(
ID serial primary key,
Name_albom varchar(50) not null unique,
Realised date not null);

create table if not exists Albom_Singer(
ID serial primary key,
ID_singer integer references Singer(ID),
ID_albom integer references Albom(ID),
constraint un1 unique (ID_singer, ID_albom));

create table if not exists Song(
ID serial primary key,
ID_albom integer references Albom(ID),
Song_name varchar(50) not null,
lastig_sec integer not null check (lastig_sec > 0));


create table if not exists Collection(
ID serial primary key,
Name_collection varchar(50) not null unique,
Realised date not null);

create table if not exists Songs_Collection(
ID serial primary key,
ID_songs integer references Song(ID),
ID_collections integer references Collection(ID),
constraint un3 unique (ID_songs, ID_collections));

create table if not exists Function_f(
ID serial primary key,
Name_function varchar(50) not null unique);

create table if not exists Division(
ID serial primary key,
Name_division varchar(50));

create table if not exists Worker(
ID serial primary key,
Name_worker varchar(50) not null,
ID_division integer references Division(ID),
ID_function integer references Function_f(ID),
constraint un4 unique (ID_division, ID_function));

create table if not exists Head_division(
ID serial primary key,
ID_division integer references Division(ID),
ID_head integer references Worker(ID),
constraint un5 unique (ID_division, ID_head));

