--- Pruebas Limpieza Rita ---

-- PREPARE usrrptplan (int) AS
--     SELECT * FROM users u, logs l WHERE u.usrid=$1 AND u.usrid=l.usrid
--     AND l.date = $2;
-- EXECUTE usrrptplan(1, current_date);

PREPARE stmt(int) AS SELECT $1;
EXPLAIN EXECUTE stmt(1);

DEALLOCATE insertar;
PREPARE insertar (integer) AS
--    	INSERT INTO clean.rita(
    	SELECT
    	(year || '-' || month || '-' || dayofmonth)::date AS FlightDate,
    	CASE WHEN DayOfWeek = 'NA' THEN NULL ELSE convert_to_integer(DayOfWeek) END AS DayOfWeek,
    	CASE WHEN DepTime = 'NA' THEN NULL ELSE convert_to_integer(DepTime) END AS DepTime,
    	CASE WHEN CRSDepTime = 'NA' THEN NULL ELSE convert_to_integer(CRSDepTime) END AS CRSDepTime,
    	CASE WHEN ArrTime = 'NA' THEN NULL ELSE convert_to_integer(ArrTime) END AS ArrTime,
    	CASE WHEN CRSArrTime = 'NA' THEN NULL ELSE convert_to_integer(CRSArrTime) END AS CRSArrTime,
    	CASE WHEN UniqueCarrier = 'NA' THEN NULL ELSE UniqueCarrier END AS UniqueCarrier,
    	CASE WHEN FlightNum = 'NA' THEN NULL ELSE convert_to_integer(FlightNum) END AS FlightNum,
    	CASE WHEN TailNum = 'NA' THEN NULL ELSE TailNum END AS TailNum,
    	CASE WHEN ActualElapsedTime = 'NA' THEN NULL ELSE convert_to_integer(ActualElapsedTime) END AS ActualElapsedTime,
    	CASE WHEN CRSElapsedTime = 'NA' THEN NULL ELSE convert_to_integer(CRSElapsedTime) END AS CRSElapsedTime,
    	CASE WHEN AirTime = 'NA' THEN NULL ELSE convert_to_integer(AirTime) END AS AirTime,
    	CASE WHEN ArrDelay = 'NA' THEN NULL ELSE convert_to_integer(ArrDelay) END AS ArrDelay,
    	CASE WHEN DepDelay = 'NA' THEN NULL ELSE convert_to_integer(DepDelay) END AS DepDelay,
    	CASE WHEN Origin = 'NA' THEN NULL ELSE Origin END AS Origin,
    	CASE WHEN Dest = 'NA' THEN NULL ELSE Dest END AS Dest,
    	CASE WHEN Distance = 'NA' THEN NULL ELSE convert_to_integer(Distance) END AS Distance,
    	CASE WHEN TaxiIn = 'NA' THEN NULL ELSE convert_to_integer(TaxiIn) END AS TaxiIn,
    	CASE WHEN TaxiOut = 'NA' THEN NULL ELSE convert_to_integer(TaxiOut) END AS TaxiOut,
    	CASE WHEN Cancelled = 'NA' THEN NULL ELSE convert_to_integer(Cancelled) END AS Cancelled,
    	CASE WHEN CancellationCode = 'NA' THEN NULL ELSE CancellationCode END AS CancellationCode,
    	CASE WHEN Diverted = 'NA' THEN NULL ELSE convert_to_integer(Diverted) END AS Diverted,
    	CASE WHEN CarrierDelay = 'NA' THEN NULL ELSE convert_to_integer(CarrierDelay) END AS CarrierDelay,
    	CASE WHEN WeatherDelay = 'NA' THEN NULL ELSE convert_to_integer(WeatherDelay) END AS WeatherDelay,
    	CASE WHEN NASDelay = 'NA' THEN NULL ELSE convert_to_integer(NASDelay) END AS NASDelay,
    	CASE WHEN SecurityDelay = 'NA' THEN NULL ELSE convert_to_integer(SecurityDelay) END AS SecurityDelay,
    	CASE WHEN LateAircraftDelay = 'NA' THEN NULL ELSE convert_to_integer(LateAircraftDelay) END AS LateAircraftDelay
    FROM dirty.rita
    WHERE (year || '-' || month || '-' || dayofmonth)::date >= DATE ($1 || '-01-01')
      AND (year || '-' || month || '-' || dayofmonth)::date <= DATE ($1 || '-12-31')
--    )
;


EXPLAIN EXECUTE insertar(2008);


QUERY PLAN |
Seq Scan on rita  (cost=0.00..12311981.46 rows=631539 width=84)
	Filter: (((((((year || '-'::text) || month) || '-'::text) || dayofmonth))::date >= ('2008-01-01'::cstring)::date) AND ((((((year || '-'::text) || month) || '-'::text) || dayofmonth))::date <= ('2008-12-31'::cstring)::date))

create index ix_rita_date on dirty.rita ((year || '-' || month || '-' || dayofmonth));


QUERY PLAN |
Seq Scan on rita  (cost=0.00..12085583.99 rows=617675 width=84)
   Filter: (((((((year || '-'::text) || month) || '-'::text) || dayofmonth))::date >= ('2008-01-01'::cstring)::date) AND ((((((year || '-'::text) || month) || '-'::text) || dayofmonth))::date <= ('2008-12-31'::cstring)::date))

psql -d rita -c "select * from pg_stats where tablename in ('rita_2003');" > log && cat log
psql -d rita -c "select distinct tablename from pg_stats order by 1;" > log && cat log

-- Para encontrar los índices de una tabla
-- Primero obtén el oid (código) de la tabla
SELECT c.oid,
   n.nspname,
   c.relname
FROM pg_catalog.pg_class c
      LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relname ~ '^(rita_2003)$'
   --AND pg_catalog.pg_table_is_visible(c.oid)
ORDER BY 2, 3;
-- 39682

-- Luego busca por oid los índices asociados
SELECT c2.relname, i.indisprimary, i.indisunique, i.indisclustered,  
i.indisvalid, pg_catalog.pg_get_indexdef(i.indexrelid, 0, true),  
c2.reltablespace
FROM pg_catalog.pg_class c, pg_catalog.pg_class c2,  
pg_catalog.pg_index i
WHERE c.oid = '38317' AND c.oid = i.indrelid AND i.indexrelid = c2.oid
ORDER BY i.indisprimary DESC, i.indisunique DESC, c2.relname; 