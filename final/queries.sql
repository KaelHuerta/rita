---------- Queries Finales ----------

-- Primer vuelo de cada aerolínea
explain analyze
SELECT
    uniquecarrier
   ,min(firsttail)
FROM alfie.alfie
GROUP BY
    uniquecarrier;
-- 255254.894 ms (4.25 m)



-------------------------------------
-- Primer vuelo de cada avión
explain analyze
SELECT
    tailnum
   ,min(firsttail)
FROM alfie.alfie
GROUP BY
    tailnum;
-- 248767.244 ms (4.14 m)



-------------------------------------
-- 10 Aerolíneas con más kilómetros
explain analyze
SELECT
    uniquecarrier
   ,sum(kmcarrier)
FROM alfie.alfie
GROUP BY
    uniquecarrier
ORDER BY
    sum(kmcarrier) DESC
LIMIT 10;
-- 272099.378 ms (4.53 m)



-------------------------------------
-- 10 Aerolíneas con más vuelos
explain analyze
SELECT
    uniquecarrier
   ,sum(flightscarrier)
FROM alfie.alfie
GROUP BY
    uniquecarrier
ORDER BY
    sum(flightscarrier) DESC
LIMIT 10;
-- 260151.304 ms (4.33 m)



-------------------------------------
-- 10 Aerolíneas con más destinos
explain analyze
SELECT
    uniquecarrier
   ,max(numdest)
FROM alfie.alfie
GROUP BY
    uniquecarrier
ORDER BY
    max(numdest) DESC
LIMIT 10;
-- 371041.932 ms (6.18 m)



-------------------------------------
-- Tiempo de vuelo por aerolínea
explain analyze
SELECT
    uniquecarrier
   ,sum(flytimecarrier)
FROM alfie.alfie
GROUP BY
    uniquecarrier;
-- 430334.203 ms (7.17 m)



-------------------------------------
-- Promedio de retraso por avión por mes por año
explain analyze
SELECT
    year
   ,month
   ,tailnum
   ,avg(delaymonth)
FROM alfie.alfie
GROUP BY
    year
   ,month
   ,tailnum;