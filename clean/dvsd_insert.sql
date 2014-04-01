INSERT INTO clean.dist_vs_delay (
SELECT
    :v1 AS year
   ,qdist
   ,qtime
   ,avg(arrdelay) as avg_delay
FROM clean.paso
WHERE flightdate > DATE (:v1 || '-01-01')
  AND flightdate <= DATE ((:v1+1) || '-01-01')
GROUP BY
    qdist
   ,qtime
ORDER BY qdist, qtime ASC
);