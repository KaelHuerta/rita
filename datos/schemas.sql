--CREATE TABLESPACE rita_space OWNER kaelihno LOCATION '/data/rita';
DROP TABLESPACE IF EXISTS rita_space;
CREATE TABLESPACE rita_space LOCATION '/data/rita';

CREATE SCHEMA dirty;
CREATE SCHEMA clean;
CREATE SCHEMA alfie;
CREATE SCHEMA ts;
CREATE SCHEMA grafo;
--CREATE SCHEMA mis_ext;

CREATE EXTENSION file_fdw;
CREATE SERVER file_server FOREIGN DATA WRAPPER file_fdw;

CREATE EXTENSION fuzzystrmatch;

GRANT usage ON SCHEMA dirty TO public;

ALTER default privileges IN SCHEMA dirty
GRANT select, references ON tables
  TO public;

ALTER default privileges IN SCHEMA dirty
GRANT select, update ON sequences
  TO public;

ALTER default privileges IN SCHEMA dirty
GRANT execute ON functions
  TO public;

ALTER default privileges IN SCHEMA dirty
GRANT usage ON types
  TO public;


CREATE UNLOGGED TABLE dirty.rita (
	Year text,
	Month text,
	DayofMonth text,
	DayOfWeek text,
	DepTime text,
	CRSDepTime text,
	ArrTime text,
	CRSArrTime text,
	UniqueCarrier text,
	FlightNum text,
	TailNum text,
	ActualElapsedTime text,
	CRSElapsedTime text,
	AirTime text,
	ArrDelay text,
	DepDelay text,
	Origin text,
	Dest text,
	Distance text,
	TaxiIn text,
	TaxiOut text,
	Cancelled text,
	CancellationCode text,
	Diverted text,
	CarrierDelay text,
	WeatherDelay text,
	NASDelay text,
	SecurityDelay text,
	LateAircraftDelay text
) TABLESPACE rita_space;


CREATE FOREIGN TABLE clean.airports (
    iata        text
   ,AirportName text
   ,City        text
   ,State       text
   ,Country     text
   ,Latitude    numeric
   ,Longitude   numeric
) SERVER file_server
OPTIONS (
    filename '/home/kaelinho/rita/datos/airports.csv'
   ,format 'csv'
   ,header 'TRUE'
   ,delimiter ','
   ,NULL ''
);

CREATE FOREIGN TABLE clean.carriers (
    UniqueCarrier text
   ,CarrierName          text
) SERVER file_server
OPTIONS (
    filename '/home/kaelinho/rita/datos/carriers.csv'
   ,format 'csv'
   ,header 'TRUE'
   ,delimiter ','
   ,NULL ''
);

-- CREATE FOREIGN TABLE clean.planes (
--     TailNum      text
--    ,Type         text
--    ,Manufacturer text
--    ,IssueDate    text
--    ,Model        text
--    ,Status       text
--    ,AircraftType text
--    ,EngineType   text
--    ,Year         integer
-- ) SERVER file_server
-- OPTIONS (
--     filename '/home/kaelinho/rita/datos/plane-data.csv'
--    ,format 'csv'
--    ,header 'TRUE'
--    ,delimiter ','
--    ,NULL ''
-- );