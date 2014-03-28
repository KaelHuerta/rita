INSERT INTO ts.time_serie (
    SELECT 
        uniquecarrier
       ,tailnum
       ,origin
       ,dest
       ,(flightdate::text || ' ' || (crsarrtime - mod(crsarrtime, 60)) / 100 || ':' || mod(crsarrtime, 60))::timestamp AS flightdate
       ,dayofweek
       ,((crsarrtime - mod(crsarrtime, 60)) / 100) as hourofday
       ,crsdeptime
       ,crsarrtime
       ,depdelay
       ,arrdelay
       ,carrierdelay
       ,weatherdelay
       ,nasdelay
       ,securitydelay
       ,lateaircraftdelay
       ,sign(arrdelay) AS delay
  FROM clean.rita AS a
  WHERE a.flightdate >=  DATE (:V1 || '-01-01')
    AND a.flightdate <= DATE (:V1 || '-12-31')
    ORDER BY flightdate, uniquecarrier, origin, dest
);