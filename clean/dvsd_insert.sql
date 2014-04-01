INSERT INTO dist_vs_delay (
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


-- INSERT INTO dist_vs_delay (
-- SELECT
--     extract('year' from min(first)) as year
--    ,qdist
--    ,qtime
--    ,avg(year_delay) as avg_delay
-- FROM results.alfie
-- WHERE flightdate >= DATE ('2003-01-01')
--   AND flightdate <= DATE ('2003-12-31')
-- GROUP BY
--     qdist
--    ,qtime
-- ORDER BY 2, 3 ASC
-- );