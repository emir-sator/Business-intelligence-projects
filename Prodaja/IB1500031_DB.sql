use prodaja	

select *
from narudzba

alter table narudzba
add god_narudzb as year(dtm_narudzbe) 
