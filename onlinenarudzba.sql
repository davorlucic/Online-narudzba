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
jela_sa_rostilja	varchar(50) not null,
tjestenina			varchar(50) not null,
sandwich			varchar(50) not null
);

create table jelo(
sifra				int not null primary key auto_increment,
vrsta_jela			int not null,
naziv				varchar(50) not null,
cijena				decimal(18,2) not null,
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
napomena			text null,
status				varchar(50) not null
);

create table jelo_narudzba(
jelo 				int not null,
narudzba			int not null,
kolicina			char(20) not null,
iznos				decimal(18,2) not null,
primary key			(jelo,narudzba)
);


alter table jelo add foreign key (vrsta_jela) references vrsta_jela(sifra);

alter table narudzba add foreign key (korisnik) references korisnik(sifra);

alter table jelo_narudzba add foreign key (narudzba) references narudzba(sifra);
alter table jelo_narudzba add foreign key (jelo) references jelo(sifra);


# 1 - 2
insert into korisnik(ime,prezime,longitude,latitude,broj_telefona,email,password)
values 
('Ivan','Đurić','45.5576393','18.6737068','0991234567','ivan.duric@gmail.com','orah1234'),
('Maja','Ivić','45.6079868','18.748115','0911234567','maja.ivic@gmail.com','buba1616');

# 1 - 2
insert into vrsta_jela(jelovnik,pizza,jela_sa_rostilja,tjestenina,sandwich)
values
(1,'capricciosa','ćevapi','bolognese','šunka'),
(2,'slavonska','pljeskavica','milanese','kulen');

# 1 - 2
insert into jelo(vrsta_jela,naziv,cijena,dostava_iznad_10_km,slika,opis,napomena)
values
(1,'capricciosa',36,5,null,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet'),
(2,'šunka',26,5,null,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet');

# 1 - 2
insert into narudzba(korisnik,broj,datum,longitude,latitude,osobno_preuzimanje,predvideno_vrijeme,napomena,status)
values
(1,000000001,'20170413 10:34:09','45.5576393','18.6737068','Ne','20170413 11:00:00','Lorem ipsum dolor sit amet','U pripremi'),
(2,000000002,'20170414 19:16:33','45.603992','18.744242','Ne','20170414 20:05:00','Lorem ipsum dolor sit amet','U dostavi');

# 1 - 2
insert into jelo_narudzba(jelo,narudzba,kolicina,iznos)
values
(1,1,2,82),
(2,2,3,93);









