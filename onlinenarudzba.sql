drop database if exists onlinenarudzba;
create database onlinenarudzba default character set utf8;
use onlinenarudzba;

create table korisnik(
sifra				int not null primary key auto_increment,
ime					varchar(50) not null,
prezime				varchar(50) not null,
longitude			float(10,6) not null,
latitude			float(10,6) not null,
broj_telefona		varchar(50) not null,
email				varchar(50) not null,
password			varchar(50) not null
);

create table vrsta_jela(
sifra				int not null primary key auto_increment,
jelovnik			int not null,
pizza				varchar(50) not null,
jela_s_rostilja		varchar(50) not null,
tjestenina			varchar(50) not null,
sendvic				varchar(50) not null
);

create table jelo(
sifra				int not null primary key auto_increment,
vrsta_jela			int not null,
naziv				varchar(50) not null,
cijena				decimal(18,2) not null,
kolicina			char(20) not null,
dostava_iznad_10_km	char(20) not null,
slika				varchar(50) not null,
opis				longtext null,
napomena			text null
);

create table narudzba(
sifra				int not null primary key auto_increment,
korisnik			int not null,
broj				char(50) not null,
datum				datetime not null,
longitude			float(10,6) not null,
latitude			float(10,6) not null,
osobno_preuzimanje	varchar(10) not null,
predvideno_vrijeme	datetime not null,
iznos				decimal(18,2) not null,
napomena			text null,
status				varchar(50) not null
);

create table jelo_narudzba(
jelo 				int not null,
narudzba			int not null,
primary key			(jelo,narudzba)
);


alter table jelo add foreign key (vrsta_jela) references vrsta_jela(sifra);

alter table narudzba add foreign key (korisnik) references korisnik(sifra);

alter table jelo_narudzba add foreign key (narudzba) references narudzba(sifra);
alter table jelo_narudzba add foreign key (jelo) references jelo(sifra);




