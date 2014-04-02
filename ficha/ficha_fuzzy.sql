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
WHERE uniquecarrier IN (
  SELECT uniquecarrier
  FROM clean.carriers
  WHERE levenshtein(lower(carriername), lower(:v1::text)) <= 5
    AND year = :v2
  )
GROUP BY
    uniquecarrier
   ,year
   ,numdest
   ,flightscarrier
   ,flytimecarrier
   ,kmcarrier
);

-- select uniquecarrier
-- from clean.carriers
-- where levenshtein(lower(carriername), lower('American Airlines')) <= 5;