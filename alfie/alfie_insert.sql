INSERT INTO alfie.alfie (
     SELECT 
       a.uniquecarrier
      ,tailnum
      ,extract(year FROM flightdate) AS year
      ,extract(month FROM flightdate) AS month
      ,first_value(flightdate) over (
            partition by
                 a.uniquecarrier
                ,tailnum
                ,extract(year from flightdate)
          ORDER BY flightdate
      ) AS firsttail
      ,last_value(flightdate) over (
         partition by
             a.uniquecarrier
            ,tailnum
          ORDER BY flightdate
      ) AS lasttail
      ,avg(coalesce(arrdelay, 0)) over (
          partition by
              a.uniquecarrier
             ,tailnum
             ,extract(year from flightdate)
             ,extract(month FROM flightdate)
      ) AS delaymonth
      ,sum(distance) over (
          partition by
              a.uniquecarrier
             ,extract(year FROM flightdate)
      ) AS kmcarrier
      ,sum(coalesce(airtime, 0)) over (
             partition by
                 a.uniquecarrier
                ,extract(year from flightdate)
         ) AS flytimecarrier
      ,sum(1) over (
             partition by
                 a.uniquecarrier
                ,extract(year from flightdate)
             ) AS flightscarrier
      ,avg(arrdelay) over (
             partition by
                 a.uniquecarrier
                ,tailnum
                ,extract(year from flightdate)
                ,extract(month FROM flightdate)
         ) AS avgmonthdelay
      ,b.numdest AS numdest
   FROM clean.rita AS a
       LEFT JOIN alfie.destinations AS b
       ON  extract(year FROM a.flightdate) = b.year
       AND a.uniquecarrier = b.uniquecarrier
   WHERE flightdate >=  DATE (:v1 || '-01-01')
     AND flightdate < DATE ((:v1+1) ||'-01-01')
);