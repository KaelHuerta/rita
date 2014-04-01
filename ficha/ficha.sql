DROP TABLE IF EXISTS ficha;

CREATE TABLE ficha (
    carrier      text
   ,year         integer
   ,firsttail    date
   ,lasttail     date
   ,destinations integer
   ,numflights   integer
   ,flytime      integer
   ,avgyeardelay numeric
   ,kmcarrier    integer
--   ,phantom      integer
);

--explain analyze
--SELECT
--    uniquecarrier
--   ,year
--   ,numdest
--   ,kmcarrier
--   ,min(firsttail) AS firstflight
--   ,avg(delaymonth) AS avgdelay
--   ,flightscarrier
--   ,flytimecarrier
--FROM alfie.alfie_2003
--WHERE uniquecarrier = 'AA'
--GROUP BY
--    uniquecarrier
--   ,year
--   ,numdest
--   ,kmcarrier
--   ,flightscarrier
--   ,flytimecarrier
--;
---- 14.288 s
--
--explain analyze
--SELECT
--    year
--   ,uniquecarrier
--   ,numdest
--   ,kmcarrier
--   ,flightscarrier
--   ,flytimecarrier
--   ,min(firsttail) AS firstflight
--   ,avg(delaymonth) AS avgdelay
--FROM alfie.alfie
--WHERE year = 2003
--  AND uniquecarrier = 'AA'
--GROUP BY
--    year
--   ,uniquecarrier
--   ,numdest
--   ,kmcarrier
--   ,flightscarrier
--   ,flytimecarrier
--;
--
--CREATE INDEX al_ficha_2003 ON alfie.alfie_2003 (year, uniquecarrier, numdest, kmcarrier, flightscarrier, flytimecarrier)
--DROP INDEX al_ficha_2003;
--CREATE INDEX al_ficha_2003 ON alfie.alfie_2003 (uniquecarrier, year, numdest, kmcarrier, flightscarrier, flytimecarrier, firsttail ASC);
--VACUUM ANALYZE alfie.alfie_2003;