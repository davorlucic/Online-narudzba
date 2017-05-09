drop database if exists onlinenarudzba;
create database onlinenarudzba default character set utf8;
use onlinenarudzba;

create table korisnik(
sifra				int not null primary key auto_increment,
ime					varchar(50) not null,
prezime				varchar(50) not null,
adresa				varchar(50) not null,
mjesto				varchar(50) not null,
broj_telefona		varchar(50) not null
);

create table dostava(
sifra				int not null primary key auto_increment,
longitude			float(10,6) not null,
latitude			float(10,6) not null,
cijena				decimal(18,2) not null,
predvideno_vrijeme	datetime not null,
osobno_preuzimanje	varchar(10) not null
);

create table narudzba(
sifra				int not null primary key auto_increment,
korisnik			int not null,
dostava				int not null,
broj				char(50) not null,
datum				datetime not null,
ukupni_iznos		decimal(18,2) not null
);

create table jelovnik(
sifra				int not null primary key auto_increment,
narudzba			int not null,
naziv				varchar(50) not null,
cijena				decimal(18,2) not null,
kolicina			char(20) not null,
slika				longtext not null,
opis				longtext null
);

create table grupa_jela(
sifra				int not null primary key auto_increment,
jelovnik			int not null,
pizza				varchar(50) not null,
jela_s_rostilja		varchar(50) not null,
tjestenina			varchar(50) not null,
sendvic				varchar(50) not null
);

alter table narudzba add foreign key (korisnik) references korisnik(sifra);
alter table narudzba add foreign key (dostava) references dostava(sifra);

alter table jelovnik add foreign key (narudzba) references narudzba(sifra);

alter table grupa_jela add foreign key (jelovnik) references jelovnik(sifra);




