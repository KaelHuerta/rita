---------- Queries Finales ----------

-- Número de retrasos por aerolínea
explain analyze
SELECT
    uniquecarrier
   ,sum(numdelay)
FROM ts.time_serie
GROUP BY
    uniquecarrier;
-- 3376.879 ms (.052)

-------------------------------------
-- Serie de tiempo por aerolínea
explain analyze
SELECT
    uniquecarrier
   ,flightdate
   ,nasdelay
FROM ts.time_serie
WHERE uniquecarrier = 'AA'
ORDER BY flightdate ASC;
-- 27382.371 ms (.45 m)

-------------------------------------
-- Atrasos por día de la semana
explain analyze
SELECT
    dayofweek
   ,sum(numdelay)
   ,sum(numontime)
   ,sum(numearly)
FROM ts.time_serie
GROUP BY
    dayofweek
ORDER BY
    dayofweek;
-- 107811.094 ms (1.79 m)

 dayofweek |   sum   |  sum   |   sum   
-----------+---------+--------+---------
         1 | 8713713 | 823067 | 8933501
         2 | 8527580 | 824798 | 9002497
         3 | 8931313 | 819684 | 8658376
         4 | 9531064 | 794783 | 8077060
         5 | 9711740 | 780797 | 7943935
         6 | 6962739 | 686822 | 8624177
         7 | 8184144 | 739681 | 8608118

-------------------------------------
-- Atrasos por hora del día
explain analyze
SELECT
    hourofday
   ,sum(numdelay)
   ,sum(numontime)
   ,sum(numearly)
FROM ts.time_serie
GROUP BY
    hourofday
ORDER BY
    hourofday;
-- 107441.537 ms (1.8 m)

 hourofday |   sum   |  sum   |   sum   
-----------+---------+--------+---------
         0 |  473065 |  31625 |  502312
         1 |   74996 |   6573 |   84584
         2 |    2795 |    316 |    4801
         3 |    5357 |    677 |    9010
         4 |   75883 |  12508 |  157960
         5 |  107896 |  14351 |  173981
         6 | 4468676 | 560535 | 6381346
         7 | 4656247 | 511894 | 5859856
         8 | 1263330 | 122101 | 1419971
         9 | 4937729 | 492016 | 5579122
        10 | 4577349 | 461223 | 4997138
        11 | 1208956 | 113827 | 1186195
        12 | 5278032 | 485332 | 5355023
        13 | 5091718 | 447226 | 4779740
        14 | 1219376 | 102875 | 1107066
        15 | 5480876 | 443226 | 4610811
        16 | 5831850 | 438650 | 4695864
        17 | 1399275 | 101243 | 1090154
        18 | 5651948 | 411650 | 4515751
        19 | 4415774 | 348187 | 3553957
        20 |  986241 |  78762 |  782861
        21 | 2448722 | 212215 | 2114011
        22 |  752303 |  60334 |  738001
        23 |  153785 |  12249 |  148080
        24 |     114 |     37 |      69

-------------------------------------
-- Número de la mala suerte
explain analyze
SELECT caracter, sum(delay) AS delay, sum(early) + sum(ontime) AS ontime
FROM(
  SELECT
      distinct unnest(regexp_split_to_array(uniquecarrier || tailnum, '')) AS caracter
     ,numdelay AS delay
     ,numontime AS ontime
     ,numearly AS early
  FROM ts.time_serie_2008) AS tmp
GROUP BY caracter;
-- 111285.046 ms (1.85 m)

caracter |  delay  | ontime  
----------+---------+---------
 k        |       0 |       0
 w        |       0 |       0
 n        |       0 |       0
 o        |       0 |       0
 c        |     240 |     193
 Z        |    1901 |    2727
 P        |    9275 |   10792
 G        |   11014 |   13390
 K        |   62897 |   75113
 R        |   93930 |  103846
 J        |  130738 |  164116
 T        |  131777 |  155995
 Y        |  143703 |  179046
 H        |  151037 |  201170
 X        |  182820 |  222445
 F        |  245917 |  276932
 B        |  246129 |  311140
 Q        |  251329 |  336895
 M        |  282680 |  364636
 C        |  311735 |  329272
 V        |  323589 |  409693
 D        |  408284 |  453583
 L        |  485144 |  554730
 0        |  643591 |  843305
 O        |  676600 |  914885
 E        |  707641 |  975956
 U        |  715394 |  971416
 8        |  843958 | 1179117
 S        |  886137 | 1288605
 2        |  933729 | 1245312
 7        |  958188 | 1273203
 4        |  979746 | 1336757
 1        | 1001402 | 1262005
 5        | 1014795 | 1269893
 3        | 1072620 | 1345154
 6        | 1096451 | 1392060
 9        | 1295515 | 1763469
 W        | 1382276 | 2046358
 A        | 2308894 | 2623231
 N        | 3831418 | 5089178


explain analyze
SELECT
    uniquecarrier
   ,count(*)
FROM clean.paso
WHERE origin != lag
GROUP BY
    uniquecarrier;
-- 106639.160 ms (1.7 m)

explain analyze
select
    uniquecarrier
   ,sum(case when origin = lag then 0 else 1 end) as phantom
FROM clean.paso
group by
	uniquecarrier;
--  112144.083 ms (1.8 m)


explain
SELECT
    airportname
   ,departures
   ,arrivals
FROM graph.nodes
ORDER BY
    departures;