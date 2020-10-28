CREATE DATABASE AutobuskiPrevozDW

USE AutobuskiPrevozDW



CREATE TABLE dim_godina(
godina_key int identity(1,1) constraint godina primary key(godina_key),
voznja_ID int not null,
godina_voznje int null
);

CREATE TABLE dim_linija
(
linija_key int identity(1,1) constraint linija primary key(linija_key),
linija_ID int not null,
vrijeme_polaska datetime null,
vrijeme_dolaska datetime null,
duzina_putovanja datetime null,
linija_tip_naziv nvarchar(30) null
);

CREATE TABLE dim_radnik(
radnik_key int identity(1,1) constraint radnik primary key(radnik_key),
radnik_ID NVARCHAR(5) not null,
radnik_kval_opis nvarchar(20) null
);

CREATE TABLE dim_vozilo(
vozilo_key int identity(1,1) constraint vozilo primary key(vozilo_key),
vozilo_ID int not null,
vozilo_reg_oznaka nvarchar(10) null,
vozilo_tip_naziv nvarchar(30) null,
vozilo_max_br_sjed int null
);

CREATE TABLE fact_voznja(
voznja_key int identity(1,1) constraint pk_voznja primary key(voznja_key),
godina_key int null foreign key(godina_key) references dim_godina(godina_key),
linija_key int null foreign key(linija_key) references dim_linija(linija_key),
radnik_key int null foreign key(radnik_key) references dim_radnik(radnik_key),
vozilo_key int null foreign key(vozilo_key) references dim_vozilo(vozilo_key),
voznja_prihod float null,
zarada float null
);

