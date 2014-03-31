INSERT INTO alfie.destinations (
    SELECT
        extract(year FROM flightdate)
        uniquecarrier
        COUNT(DISTINCT dest) as uniqdest
    FROM clean.rita
    WHERE flightdate >=  DATE (:v1 || '-01-01')
      AND flightdate < DATE (:v1+1 ||'-01-01')
      AND uniquecarrier IS NOT NULL
    GROUP BY
        extract(year FROM flightdate)
       ,uniquecarrier
);

-- Usa todos los índices ix_clean_date

-- explain analyze
-- SELECT
--     extract(year FROM flightdate)
--    ,uniquecarrier
--    ,COUNT(DISTINCT dest) as uniqdest
-- FROM clean.rita
-- WHERE flightdate >=  DATE (2013 || '-01-01')
--   AND flightdate < DATE (2013+1 ||'-01-01')
-- --  AND uniquecarrier IS NOT NULL
-- GROUP BY
--     extract(year FROM flightdate)
--    ,uniquecarrier;


-- explain analyze
-- SELECT DISTINCT dest
-- FROM clean.rita
-- WHERE flightdate >=  DATE (2013 || '-01-01')
--   AND flightdate < DATE (2013+1 ||'-01-01')
--   AND uniquecarrier IS NOT NULL
-- ;