INSERT INTO graph.edges (
  SELECT
      :v1 as year
     ,origin
     ,dest
     ,count(*) AS weight
     ,sum(cancelled) AS cancellations
     ,sum(diverted) AS deviations
     ,sum(CASE WHEN arrdelay > 0 THEN 1 ELSE 0 END) AS numdelay
     ,sum(CASE WHEN arrdelay = 0 THEN 1 ELSE 0 END) AS numontime
     ,sum(CASE WHEN arrdelay < 0 THEN 1 ELSE 0 END) AS numearly
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
);
