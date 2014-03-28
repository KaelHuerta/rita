INSERT INTO ts.time_serie (
    SELECT 
        (flightdate::text || ' ' || (crsdeptime - mod(crsdeptime, 60)) / 100 || ':' || mod(crsdeptime, 60))::timestamp AS flightdate
       ,uniquecarrier
       ,tailnum
       ,dayofweek
       ,((crsdeptime - mod(crsdeptime, 60)) / 100) AS hourofday
       ,crsarrtime
       ,depdelay
       ,arrdelay
       ,carrierdelay
       ,weatherdelay
       ,nasdelay
       ,securitydelay
       ,lateaircraftdelay
       ,CASE WHEN arrdelay > 0 THEN 1 ELSE 0 END AS numdelay
       ,CASE WHEN arrdelay = 0 THEN 1 ELSE 0 END AS numontime
       ,CASE WHEN arrdelay < 0 THEN 1 ELSE 0 END AS numearly
  FROM clean.rita AS a
  WHERE a.flightdate >=  DATE (:v1 || '-01-01')
    AND a.flightdate <= DATE (:v1 || '-12-31')
    ORDER BY flightdate ASC
);