SELECT
    year
   ,origin
   ,dest
   ,count(*) AS weight
   ,sum(cancellation) AS cancellations
   ,sum(diverted) AS deviations
   ,sum(CASE WHEN arrdelay > 0 THEN 1 ELSE 0) AS numdelay
   ,sum(CASE WHEN arrdelay = 0 THEN 1 ELSE 0) AS numontime
   ,sum(CASE WHEN arrdelay < 0 THEN 1 ELSE 0) AS numearly
   ,avg(depdelay) AS avgdepdelay
   ,avg(arrdelay) AS avgarrdelay
   ,avg(distance) AS distance
   ,avg(airtime) AS airtime
   ,avg(carrierdelay) AS avgcarrierdelay
   ,avg(weatherdelay) AS avgweatherdelay
   ,avg(nasdelay) AS avgnasdelay
   ,avg(securitydelay) AS avgsecuritydelay
   ,avg(lateaircraftdelay) AS avglateplanelay
FROM clean.rita
WHERE flightdate >=  DATE (:v1 || '-01-01')
  AND flightdate < DATE ((:v1+1) ||'-01-01')
GROUP BY
    year
   ,origin
   ,dest
;