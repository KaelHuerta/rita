WITH uniqdests(y) AS (
  SELECT uniquecarrier, COUNT(DISTINCT dest) AS uniqdest
  FROM clean.rita
    WHERE flightdate >=  DATE (y::text || '-01-01')
      AND flightdate < DATE ((y+1)::text ||'-01-01')
      AND uniquecarrier IS NOT NULL
  GROUP BY uniquecarrier
)
select * from uniqdests(2003) limit 10;

explain analyze
--INSERT INTO alfie.alfie (
   SELECT 
       uniquecarrier
      ,tailnum
      ,extract(year FROM flightdate) AS year
      ,extract(month FROM flightdate) AS month
      ,first_value(flightdate) over (
            partition by
                 uniquecarrier
                ,tailnum
                ,extract(year from flightdate)
          ORDER BY flightdate
      ) AS firsttail
      ,last_value(flightdate) over (
         partition by
             uniquecarrier
            ,tailnum
          ORDER BY flightdate
      ) AS lasttail
      ,avg(coalesce(arrdelay, 0)) over (
          partition by
              uniquecarrier
             ,tailnum
             ,extract(year from flightdate)
             ,extract(month FROM flightdate)
      ) AS delaymonth
      ,sum(distance) over (
          partition by
              uniquecarrier
             ,extract(year FROM flightdate)
      ) AS kmcarrier
      ,sum(coalesce(airtime, 0)) over (
             partition by
                 uniquecarrier
                ,extract(year from flightdate)
         ) AS flytimecarrier
      ,sum(1) over (
             partition by
                 uniquecarrier
                ,extract(year from flightdate)
             ) AS flightscarrier
      ,avg(arrdelay) over (
             partition by
                 uniquecarrier
                ,tailnum
                ,extract(year from flightdate)
                ,extract(month FROM flightdate)
         ) as avgmonthdelay
      ,uniqdest AS numdest
   FROM clean.rita
   NATURAL JOIN (
       SELECT uniquecarrier, COUNT(DISTINCT dest) AS uniqdest
       FROM clean.rita
       WHERE flightdate >=  DATE (2003 || '-01-01')
         AND flightdate < DATE (2003 ||'-01-01')
         AND uniquecarrier IS NOT NULL
       GROUP BY uniquecarrier) AS tmp
   WHERE flightdate >=  DATE (2003 || '-01-01')
      AND flightdate < DATE ((2003+1) ||'-01-01')
--);
;

explain select min(flightdate) from clean.rita where flightdate >= date '2003-01-01' and flightdate < date '2004-01-01';
create index ix_carrier_tail_date_2003 on clean.rita_2003(uniquecarrier, tailnum, flightdate);
vacuum analyze clean.rita_2003;