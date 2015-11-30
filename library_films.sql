SET NAMES CYRL;

connect 'd:/library_films.fdb'
user 'SYSDBA' password 'masterkey'; 
drop database;
commit;
create database 'd:/library_films.fdb' user 'SYSDBA' password 'masterkey';
connect 'd:/library_films.fdb'
user 'SYSDBA' password 'masterkey'; 
create table film (
    film_id int primary key,
    title varchar(255) not null,
    year0 int not null,
    country varchar(16) not null,
    film_company_id int not null,
    genre_id int not null,
    duration int not null,
    rating int not null,
    price float not null);
 CREATE TABLE Viewer (
    Viewer_id INT NOT NULL PRIMARY KEY,
    Name varchar(16),
    Birthday varchar(16),
    Adress VARCHAR(255),
    Number_telephone VARCHAR(16)
);
CREATE TABLE Genre (
    Genre_id INT NOT NULL PRIMARY KEY,
    Title varchar(32) NOT NULL);
CREATE TABLE Request (
    Request_id INT NOT NULL PRIMARY KEY,
    Viewer_id INT NOT NULL,
    Film_id INT NOT NULL,
    Price float NOT NULL,
    Date_supply_request varchar(16) NOT NULL
);

CREATE TABLE Film_company (
    Film_company_id INT NOT NULL PRIMARY KEY,
    Title varchar(32) NOT NULL,
    Year_establish INT NOT NULL,
    Positioning VARCHAR(255) NOT NULL
);

CREATE TABLE Film_person (
    Id INT NOT NULL PRIMARY KEY,
    Film_id INT NOT NULL,
    Person_id INT NOT NULL
);

CREATE TABLE Person (
    Person_id INT NOT NULL PRIMARY KEY,
    Name varchar(32) NOT NULL,
    birthday varchar(16) NOT NULL,
    Place_birth VARCHAR(255) NOT NULL,
    Hight INT NOT NULL,
    Character_id int NOT NULL
);

CREATE TABLE Charactor (
    Character_id int NOT NULL PRIMARY KEY,
       Actor blob not null,
    Director blob not null,
    soundman blob not null
);
ALTER TABLE Film ADD CONSTRAINT Films_fk0 FOREIGN KEY (Film_company_id) REFERENCES Film_company (Film_company_id);

ALTER TABLE Film ADD CONSTRAINT Films_fk1 FOREIGN KEY (Genre_id) REFERENCES Genre(Genre_id);

ALTER TABLE Request ADD CONSTRAINT Request_fk0 FOREIGN KEY (Viewer_id) REFERENCES Viewer(Viewer_id);

ALTER TABLE Request ADD CONSTRAINT Request_fk1 FOREIGN KEY (Film_id) REFERENCES Film(Film_id);

ALTER TABLE Film_person ADD CONSTRAINT Film_person_fk0 FOREIGN KEY (Film_id) REFERENCES Film(Film_id);

ALTER TABLE Film_person ADD CONSTRAINT Film_person_fk1 FOREIGN KEY (Person_id) REFERENCES Person(Person_id);

ALTER TABLE Person ADD CONSTRAINT Person_fk0 FOREIGN KEY (Character_id) REFERENCES Charactor(Character_id);
