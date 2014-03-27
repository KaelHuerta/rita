 insert into results.alfie (
	select uniquecarrier, tailnum, flightdate, origin, dest, 
	first_value(flightdate) over (
			partition by uniquecarrier, tailnum
		order by flightdate
		) as first,
	lag(dest) over (
		partition by uniquecarrier, tailnum
		order by flightdate, deptime
		rows between current row and 
		1 following) as lag,
	deptime, 
	avg( coalesce(arrdelay,0) ) over (
		partition by uniquecarrier, tailnum, extract(month from flightdate)
		) as month_delay,
	avg( coalesce(arrdelay,0) ) over (
		partition by uniquecarrier, tailnum, extract(year from flightdate)
		) as year_delay,
	sum(distance) over (
		partition by uniquecarrier, extract(year from flightdate)
		) as km_carrier,
	ntile(20) over ( partition by extract(year from flightdate) order by distance ) as qdist,
	ntile(20) over ( partition by extract(year from flightdate) order by airtime ) as qtime,
	sum(coalesce(airtime, 0)) over (partition by uniquecarrier, tailnum, extract(year from flightdate)) as flytime,
	sum(1) over ( partition by uniquecarrier, extract(year from flightdate)) as flights,
	sum(case when arrdelay > 0 then 1 else 0 end) over (partition by uniquecarrier, extract(year from flightdate)) as delays
	from clean.rita
	where flightdate >=  DATE (:v1 || '-01-01')
    AND flightdate <= DATE (:v1 ||'-12-31')
	);