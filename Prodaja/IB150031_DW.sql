CREATE DATABASE prodaja_DW

use prodaja_DW

create table dim_narudzba 
(
narudzbaKey int not null constraint PK_NarudzbaKey PRIMARY KEY IDENTITY(1,1),
narudzbaID int not null,
kupac_naziv nvarchar(40) not null,
kupac_grad nvarchar(15) null,
kupac_drzava nvarchar(15) null,
god_narudzb int null,
ispor_naziv nvarchar(40) not null,
cijena_dostave money null,

)

create table dim_popust 
(
popustKey int not null constraint PK_PopustKey primary key identity (1,1),
popustID int not null,
vr_popusta real null
)

create table dim_proizvod
(
proizvodKey int not null constraint PK_ProizvodKey PRIMARY KEY IDENTITY(1,1),
proizvodID int not null,
kateg_naziv nvarchar(15) not null,
proiz_naziv nvarchar(40) not null,
dobav_naziv nvarchar(40) not null,
dobar_grad nvarchar(15) null,
dobav_drzava nvarchar(15) null

)

create table fact_nar_pr
(
narudzbaKey int constraint FK_NarudzbaKey foreign key (narudzbaKey) references dim_narudzba(narudzbaKey),
popustKey int constraint FK_PopustKey foreign key (popustKey) references dim_popust(popustKey),
proizvodKey int constraint FK_ProzivodKey foreign key (proizvodKey) references dim_proizvod(proizvodKey),
proiz_cijena money not null,
kolicina smallint not null
)

