
connect 'd:/library_films.fdb' user 'SYSDBA' password 'masterkey';

drop table bilet;
drop table CINEMA1;

create table cinema1(
    cinema_id int not null primary key,
    title varchar(16),
    address varchar(255)
);

create table bilet(
    bilet_id int not null primary key,
    film_id int not null,
    cinema_id int not null,
    price float not null, 
    date_reply varchar(10) NOT NULL
);
alter table bilet add constraint bilet_fk0 foreign key (film_id) references film(film_id);
alter table bilet add constraint bilet_fk1 foreign key (cinema_id) references cinema1(cinema_id);








