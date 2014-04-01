-- Hubs



insert into results.dest (
select
    uniquecarrier
    ,extract(year from flightdate) as year
    ,(select count(dest)
     from (select distinct dt.uniquecarrier
     		,extract(year from dt.flightdate)
     		,dest
            from clean.rita dt
            where dt.uniquecarrier = m.uniquecarrier and extract(year from dt.flightdate) = :v1
            ) as temp) as NumDestinos
from clean.rita m
where extract(year from flightdate) = :v1
group by uniquecarrier, extract(year from flightdate)
);


