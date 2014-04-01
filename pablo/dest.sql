-- Destinos

insert into results.hub (
select dest
	,extract(year from flightdate)
	,(select count(origin)
		from ( select distinct dest
			,extract(year from flightdate)
			,origin
			from playground.test2 dt
			where dt.dest = m.dest 
			and extract(year from dt.flightdate) = :v1
			) as temp) as Grado
from playground.test2 m
where extract(year from flightdate) = :v1
group by dest, extract(year from flightdate)
order by grado desc
);