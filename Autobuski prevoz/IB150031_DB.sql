
USE autobuski_prevoz

create table god_voznje(
voznja_ID int not null primary key(voznja_ID),
godina_voznje int null
constraint fk_voznja foreign key(voznja_ID) references voznja(voznja_ID)
);

insert into god_voznje(voznja_ID,godina_voznje)
select voznja.voznja_ID,year(voznja.dtm_voznje)
from voznja


--upiti sa uslovima za import kroz ssdt (copy-paste u vs)
SELECT r.radnik_ID, rk.radnik_kval_opis
FROM radnik as r inner join radnik_kval as rk 
on rk.radnik_kval_ID=r.radnik_kva_ID

select l.linija_ID,l.vrijeme_polaska,l.vrijeme_dolaska,l.duzina_putovanja, tl.linija_tip_naziv
from linija as l inner join tip_linije as tl
on l.linija_tip_ID=tl.linija_tip_ID
where tl.linija_tip_naziv not like 'državna'

select v.vozilo_ID,v.vozilo_reg_oznaka,vp.vozilo_tip_naziv, vp.vozilo_max_br_sjed
from vozilo as v inner join vozilo_tip as vp
on vp.vozilo_tip_ID=v.vozilo_tip_ID
where vp.vozilo_tip_naziv not like 'autobus na sprat'

--upit za report 
select r.radnik_ID, o.dtm_odrzavanja, round(o.odrzavanje_trosak,2) as 'Troškovi održavanja', vp.vozilo_tip_naziv
from radnik as r inner join odrzavanje as o
on o.radnik_ID=r.radnik_ID inner join vozilo as v
on v.vozilo_ID=o.vozilo_ID inner join vozilo_tip as vp
on vp.vozilo_tip_ID=v.vozilo_tip_ID
where vp.vozilo_tip_naziv IN ('minibus', 'kombibus')
