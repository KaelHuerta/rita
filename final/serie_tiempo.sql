---------- Queries Finales ----------

-- Número de retrasos por aerolínea
explain
SELECT
    uniquecarrier
   ,sum(numdelay)
GROUP BY
    uniquecarrier;

-------------------------------------