INSERT INTO graph.nodes (
  SELECT
      :v1 AS year
     ,iata
     ,airportname
     ,city
     ,country
     ,latitude
     ,longitude
     ,b.departures AS departures
     ,c.arrivals AS arrivals
  FROM clean.airports AS a
  LEFT JOIN (
    SELECT
        origin
       ,count(*) AS departures
    FROM clean.rita
    WHERE flightdate >=  DATE (:v1 || '-01-01')
      AND flightdate < DATE ((:v1+1) ||'-01-01')
    GROUP BY origin
  ) AS b
  ON a.iata = b.origin
  LEFT JOIN (
    SELECT
        dest
       ,count(*) AS arrivals
    FROM clean.rita
    WHERE flightdate >=  DATE (:v1 || '-01-01')
      AND flightdate < DATE ((:v1+1) ||'-01-01')
    GROUP BY dest
  ) AS c
  ON a.iata = c.dest
);

--
--
--explain
--  SELECT
--      2013 AS year
--     ,iata
--     ,airportname
--     ,city
--     ,country
--     ,latitude
--     ,longitude
--     ,b.departures AS departures
--     ,c.arrivals AS arrivals
--  FROM clean.airports AS a
--  LEFT JOIN (
--    SELECT
--        origin
--       ,count(*) AS departures
--    FROM clean.rita
--    WHERE flightdate >=  DATE (2013 || '-01-01')
--      AND flightdate < DATE ((2013+1) ||'-01-01')
--    GROUP BY origin
--  ) AS b
--  ON a.iata = b.origin
--  LEFT JOIN (
--    SELECT
--        dest
--       ,count(*) AS arrivals
--    FROM clean.rita
--    WHERE flightdate >=  DATE (2013 || '-01-01')
--      AND flightdate < DATE ((2013+1) ||'-01-01')
--    GROUP BY dest
--  ) AS c
--  ON a.iata = c.dest;