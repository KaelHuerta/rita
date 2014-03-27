--------------- Particiones de la tabla Rita ---------------
--DROP TABLE clean.rita cascade;
--DROP FUNCTION rita_insert();

CREATE TABLE clean.rita (
--	Year integer,
--	Month integer,
--	DayofMonth integer,
	FlightDate date,
	DayOfWeek integer,
	DepTime integer,
	CRSDepTime integer,
	ArrTime integer,
	CRSArrTime integer,
	UniqueCarrier text,
	FlightNum integer,
	TailNum text,
	ActualElapsedTime integer,
	CRSElapsedTime integer,
	AirTime integer,
	ArrDelay integer,
	DepDelay integer,
	Origin text,
	Dest text,
	Distance integer,
	TaxiIn integer,
	TaxiOut integer,
	Cancelled integer,
	CancellationCode text,
	Diverted integer,
	CarrierDelay integer,
	WeatherDelay integer,
	NASDelay integer,
	SecurityDelay integer,
	LateAircraftDelay integer
) TABLESPACE rita_space;

CREATE TABLE clean.rita_1987 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1987-01-01'
AND FlightDate <= DATE '1987-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1988 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1988-01-01'
AND FlightDate <= DATE '1988-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1989 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1989-01-01'
AND FlightDate <= DATE '1989-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1990 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1990-01-01'
AND FlightDate <= DATE '1990-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1991 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1991-01-01'
AND FlightDate <= DATE '1991-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1992 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1992-01-01'
AND FlightDate <= DATE '1992-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1993 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1993-01-01'
AND FlightDate <= DATE '1993-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1994 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1994-01-01'
AND FlightDate <= DATE '1994-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1995 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1995-01-01'
AND FlightDate <= DATE '1995-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1996 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1996-01-01'
AND FlightDate <= DATE '1996-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1997 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1997-01-01'
AND FlightDate <= DATE '1997-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1998 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1998-01-01'
AND FlightDate <= DATE '1998-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_1999 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '1999-01-01'
AND FlightDate <= DATE '1999-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2000 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2000-01-01'
AND FlightDate <= DATE '2000-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2001 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2001-01-01'
AND FlightDate <= DATE '2001-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2002 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2002-01-01'
AND FlightDate <= DATE '2002-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2003 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2003-01-01'
AND FlightDate <= DATE '2003-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2004 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2004-01-01'
AND FlightDate <= DATE '2004-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2005 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2005-01-01'
AND FlightDate <= DATE '2005-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2006 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2006-01-01'
AND FlightDate <= DATE '2006-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2007 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2007-01-01'
AND FlightDate <= DATE '2007-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2008 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2008-01-01'
AND FlightDate <= DATE '2008-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2009 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2009-01-01'
AND FlightDate <= DATE '2009-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE TABLE clean.rita_2010 (
CONSTRAINT partition_date_range
CHECK (FlightDate >= DATE '2010-01-01'
AND FlightDate <= DATE '2010-12-31 23:59:59')
) INHERITS ( clean.rita );

CREATE FUNCTION rita_insert ()
RETURNS trigger
LANGUAGE plpgsql AS $f$
BEGIN
CASE
WHEN NEW.FlightDate < DATE '1988-01-01'
THEN INSERT INTO clean.rita_1987 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1989-01-01'
THEN INSERT INTO clean.rita_1988 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1990-01-01'
THEN INSERT INTO clean.rita_1989 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1991-01-01'
THEN INSERT INTO clean.rita_1990 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1992-01-01'
THEN INSERT INTO clean.rita_1991 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1993-01-01'
THEN INSERT INTO clean.rita_1992 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1994-01-01'
THEN INSERT INTO clean.rita_1993 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1995-01-01'
THEN INSERT INTO clean.rita_1994 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1996-01-01'
THEN INSERT INTO clean.rita_1995 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1997-01-01'
THEN INSERT INTO clean.rita_1996 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1998-01-01'
THEN INSERT INTO clean.rita_1997 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1999-01-01'
THEN INSERT INTO clean.rita_1998 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2000-01-01'
THEN INSERT INTO clean.rita_1999 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2001-01-01'
THEN INSERT INTO clean.rita_2000 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2002-01-01'
THEN INSERT INTO clean.rita_2001 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2003-01-01'
THEN INSERT INTO clean.rita_2002 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2004-01-01'
THEN INSERT INTO clean.rita_2003 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2005-01-01'
THEN INSERT INTO clean.rita_2004 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2006-01-01'
THEN INSERT INTO clean.rita_2005 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2007-01-01'
THEN INSERT INTO clean.rita_2006 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2008-01-01'
THEN INSERT INTO clean.rita_2007 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2009-01-01'
THEN INSERT INTO clean.rita_2008 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2010-01-01'
THEN INSERT INTO clean.rita_2009 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2011-01-01'
THEN INSERT INTO clean.rita_2010 VALUES (NEW.*);
ELSE
INSERT INTO rita_overflow VALUES (NEW.*);
END CASE;
RETURN NULL;
END;$f$;

CREATE TRIGGER rita_insert BEFORE INSERT ON clean.rita
FOR EACH ROW EXECUTE PROCEDURE rita_insert();
