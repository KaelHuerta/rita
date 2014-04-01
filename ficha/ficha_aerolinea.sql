
-- CREATE TEMPORARY TABLE ficha_aerolinea

-- SELECT uniquecarrier, 

-- create table dirty.alfie as (
-- select uniquecarrier, tailnum, flightdate, origin, dest, 
-- 	first_value(flightdate) over (
-- 			partition by uniquecarrier, tailnum
-- 		order by flightdate
-- 		) as first,
-- 	lag(dest) over (
-- 		partition by uniquecarrier, tailnum
-- 		order by flightdate, deptime
-- 		rows between current row and 
-- 		1 following) as lag,
-- 	deptime, 
-- 	avg( coalesce(arrdelay,0) ) over (
-- 		partition by uniquecarrier, tailnum, extract(month from flightdate)
-- 		) as month_delay,
-- 	avg( coalesce(arrdelay,0) ) over (
-- 		partition by uniquecarrier, tailnum, extract(year from flightdate)
-- 		) as year_delay,
-- 	sum(distance) over (
-- 		partition by uniquecarrier, extract(year from flightdate)
-- 		) as km_carrier,
-- 	ntile(20) over ( partition by extract(year from flightdate) order by distance ) as qdist,
-- 	ntile(20) over ( partition by extract(year from flightdate) order by airtime ) as qtime,
-- 	sum(coalesce(airtime, 0)) over (partition by uniquecarrier, tailnum, extract(year from flightdate)) as flytime,
-- 	sum(1) over ( partition by uniquecarrier, extract(year from flightdate)) as flights,
-- 	sum(case when arrdelay > 0 then 1 else 0 end) over (partition by uniquecarrier, extract(year from flightdate)) as delays
-- 	from dirty.tests);



-- SELECT
--     uniquecarrier as carrier
--    ,extract('year' from min(first)) as year
--    ,min(first) as first_flight
--    ,count(distinct(dest)) as num_of_destinations
--    ,delays
--    ,flights
--    ,sum(CASE origin WHEN lag THEN 0 ELSE 1 END) as phantom
-- FROM results.alfie
-- WHERE uniquecarrier IN (
--   SELECT uniquecarrier
--   FROM clean.carriers
--   WHERE carriername LIKE (SELECT unnest(string_to_array(:v1::text, ',')::text[]))
--   )
-- GROUP BY
--     uniquecarrier
--    ,delays
--    ,flights
-- ORDER BY 1, 2 ASC
-- ;
--SELECT
--    uniquecarrier
--   ,first
--   ,sum(CASE origin WHEN lag THEN 0 ELSE 1 END) as phantom
--   ,count(distinct(dest)) as destinations
--   ,delays
--   ,flights
--FROM dirty.alfie
--WHERE uniquecarrier = ANY(SELECT unnest(string_to_array(:v1::text, ',')::text[]));
--GROUP BY
--    uniquecarrier
--   ,first
--   ,delays
--   ,flights
--;



-- SELECT DISTINCT uniquecarrier
-- FROM dirty.alfie
-- WHERE uniquecarrier = ANY(SELECT unnest(string_to_array('AS,SO,PS', ',')::text[]));


-- SELECT
--     uniquecarrier as carrier
--    ,extract('year' from min(first)) as year
--    ,min(first) as first_flight
--    ,count(distinct(dest)) as destinations
--    ,delays
--    ,flights
--    ,avg(flytime) as flytime_avg
--    ,avg(year_delay) as year_delay_avg
--    ,km_carrier
--    ,sum(CASE origin WHEN lag THEN 0 ELSE 1 END) as phantom
-- FROM results.alfie
-- WHERE uniquecarrier = 'AS'
-- --WHERE uniquecarrier = ANY(SELECT unnest(string_to_array(:v1::text, ',')::text[]))
-- GROUP BY
--     uniquecarrier
--    ,delays
--    ,flights
--    ,km_carrier
-- ORDER BY 1, 2 ASC
-- ;


--select :v1::text, :v2::text v2;
--SELECT unnest(string_to_array(:v1::text, ',')::text[]) as v1, :v2 as v2;


-- INSERT INTO ficha (
-- SELECT
--     uniquecarrier as carrier
--    ,extract('year' from min(first)) as year
--    ,min(first) as first_flight
--    ,count(distinct(dest)) as destinations
--    ,delays
--    ,flights
--    ,flytime
--    ,avg(month_delay) as avg_delay
--    ,year_delay
--    ,km_carrier
--    ,sum(CASE origin WHEN lag THEN 0 ELSE 1 END) as phantom
-- FROM results.alfie
-- WHERE uniquecarrier = ANY(SELECT unnest(string_to_array(:v1::text, ',')::text[]))
--   AND flightdate >= DATE (:v2 || '01-01')
--   AND flightdate <= DATE (:v2 || '12-31')
-- GROUP BY
--     uniquecarrier
--    ,delays
--    ,flights
--    ,flytime
-- ORDER BY 1, 2 ASC
-- ); 


INSERT INTO ficha (
SELECT
    uniquecarrier as carrier
   ,year
   ,min(firsttail) as first_flight
   ,max(lasttail) as last_flight
   ,numdest
   ,flightscarrier as numflights
   ,flytimecarrier as flytime
   ,avg(delaymonth) as year_delay_avg
   ,kmcarrier
FROM alfie.alfie
WHERE uniquecarrier = ANY(SELECT unnest(string_to_array(:v1::text, ',')::text[]))
  AND year = :v2
GROUP BY
    uniquecarrier
   ,year
   ,numdest
   ,flightscarrier
   ,flytimecarrier
   ,kmcarrier
--ORDER BY uniquecarrier, year ASC
);
--
--explain
--SELECT
--    uniquecarrier as carrier
--   ,year
--   ,min(firsttail) as first_flight
--   ,max(lasttail) as last_flight
--   ,numdest
--   ,flightscarrier as numflights
--   ,flytimecarrier as flytime
--   ,avg(delaymonth) as year_delay_avg
--   ,kmcarrier
--FROM alfie.alfie
--WHERE uniquecarrier = ANY(SELECT unnest(string_to_array('AA', 'AM'::text, ',')::text[]))
--  AND year = 2003
--GROUP BY
--    uniquecarrier
--   ,year
--   ,numdest
--   ,flightscarrier
--   ,flytimecarrier
--   ,kmcarrier;