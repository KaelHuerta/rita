explain
select
    uniquecarrier
   ,sum(case when origin = lag then 0 else 1 end) as phantom
from alfie.alfie_2003
group by
	uniquecarrier;

HashAggregate  (cost=205971.45..205971.63 rows=18 width=11)
   ->  Seq Scan on alfie_2003  (cost=0.00..157307.40 rows=6488540 width=11)


explain analyze
select
    qdist
   ,qtime
   ,avg(month_delay)
from alfie.alfie_2003
group by
    qdist
   ,qtime
order by
    qdist asc
   ,qtime asc;

create index ix_qdist_qtime_ord_2003 on alfie.alfie_2003 (qdist asc, qtime asc);
vacuum analyze alfie.alfie_2003;


----- PRUEBAS GRAFO -----
explain analyze
select
    :v1 as year
   ,iata
   ,airportname
   ,city
   ,country
   ,latitude
   ,longitude
   ,b.departures
   ,c.arrivals
from clean.airports as a
left join (
  select
      origin, count(1) as departures
  from clean.rita
  where flightdate >=  date (:v1 || '-01-01')
    and flightdate < date ((:v1+1) ||'-01-01')
  group by origin
) as b
on a.iata = b.origin
left join (
  select
      dest, count(1) as arrivals
  from clean.rita
  where flightdate >=  date (:v1 || '-01-01')
    and flightdate < date ((:v1+1) ||'-01-01')
) as c
on a.iata = c.dest;


explain
SELECT
    year
   ,origin
   ,dest
   ,count(*) AS weight
   ,sum(cancellation) AS cancellations
   ,sum(diverted) AS deviations
   ,sum(CASE WHEN arrdelay > 0 THEN 1 ELSE 0) AS numdelay
   ,sum(CASE WHEN arrdelay < 0 THEN 1 ELSE 0) AS numearly
   ,avg(depdelay) AS avgdepdelay
   ,avg(arrdelay) AS avgarrdelay
   ,avg(distance) AS distance
   ,avg(airtime) AS airtime
   ,avg(carrierdelay) AS avgcarrierdelay
   ,avg(weatherdelay) AS avgweatherdelay
   ,avg(nasdelay) AS avgnasdelay
   ,avg(securitydelay) AS avgsecuritydelay
   ,avg(lateaircraftdelay) AS avglateplanelay
FROM clean.rita
WHERE flightdate >=  DATE (:v1 || '-01-01')
  AND flightdate < DATE ((:v1+1) ||'-01-01')
GROUP BY
    year
   ,origin
   ,dest
;

explain
SELECT
    year
   ,origin
   ,dest
   ,count(*) AS weight
   ,sum(cancellation) AS cancellations
   ,sum(diverted) AS deviations
   ,sum(CASE WHEN arrdelay > 0 THEN 1 ELSE 0) AS numdelay
   ,sum(CASE WHEN arrdelay = 0 THEN 1 ELSE 0) AS numontime
   ,sum(CASE WHEN arrdelay < 0 THEN 1 ELSE 0) AS numearly
   ,avg(depdelay) AS avgdepdelay
   ,avg(arrdelay) AS avgarrdelay
   ,avg(distance) AS distance
   ,avg(airtime) AS airtime
   ,avg(carrierdelay) AS avgcarrierdelay
   ,avg(weatherdelay) AS avgweatherdelay
   ,avg(nasdelay) AS avgnasdelay
   ,avg(securitydelay) AS avgsecuritydelay
   ,avg(lateaircraftdelay) AS avglateplanelay
FROM clean.rita
WHERE flightdate >=  DATE (:2003 || '-01-01')
  AND flightdate < DATE ((:2003+1) ||'-01-01')
GROUP BY
    year
   ,origin
   ,dest
;

