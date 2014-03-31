INSERT INTO alfie.destinations (
    SELECT
        extract(year FROM flightdate)
       ,uniquecarrier
       ,COUNT(DISTINCT dest) as uniqdest
    FROM clean.rita
    WHERE flightdate >=  DATE (:v1 || '-01-01')
      AND flightdate < DATE (:v1+1 ||'-01-01')
      AND uniquecarrier IS NOT NULL
    GROUP BY
        extract(year FROM flightdate)
       ,uniquecarrier
);