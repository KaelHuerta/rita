explain select * from clean.rita_2003 limit 1;

explain
select
    uniquecarrier
   ,min(first)
from alfie.alfie_2003
group by uniquecarrier;

create ix_alf_carrier_first on 