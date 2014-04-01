CREATE SCHEMA IF NOT EXISTS clean;

CREATE TABLE clean.paso (
      uniquecarrier  text   
	 ,tailnum        text
	 ,flightdate     date
	 ,deptime        integer  
     ,origin         text
     ,dest           text
     ,lag            text
     ,qdist          integer
     ,qtime          integer
     ,arrdelay       integer
);

CREATE TABLE clean.paso_1987 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1987-01-01'
AND flightdate < DATE'1988-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1988 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1988-01-01'
AND flightdate < DATE'1989-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1989 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1989-01-01'
AND flightdate < DATE'1990-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1990 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1990-01-01'
AND flightdate < DATE'1991-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1991 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1991-01-01'
AND flightdate < DATE'1992-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1992 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1992-01-01'
AND flightdate < DATE'1993-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1993 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1993-01-01'
AND flightdate < DATE'1994-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1994 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1994-01-01'
AND flightdate < DATE'1995-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1995 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1995-01-01'
AND flightdate < DATE'1996-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1996 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1996-01-01'
AND flightdate < DATE'1997-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1997 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1997-01-01'
AND flightdate < DATE'1998-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1998 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1998-01-01'
AND flightdate < DATE'1999-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_1999 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1999-01-01'
AND flightdate < DATE'2000-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2000 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2000-01-01'
AND flightdate < DATE'2001-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2001 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2001-01-01'
AND flightdate < DATE'2002-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2002 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2002-01-01'
AND flightdate < DATE'2003-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2003 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2003-01-01'
AND flightdate < DATE'2004-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2004 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2004-01-01'
AND flightdate < DATE'2005-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2005 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2005-01-01'
AND flightdate < DATE'2006-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2006 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2006-01-01'
AND flightdate < DATE'2007-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2007 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2007-01-01'
AND flightdate < DATE'2008-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2008 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2008-01-01'
AND flightdate < DATE'2009-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2009 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2009-01-01'
AND flightdate < DATE'2010-01-01')
) INHERITS ( clean.paso );

CREATE TABLE clean.paso_2010 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2010-01-01'
AND flightdate < DATE'2011-01-01')
) INHERITS ( clean.paso );

CREATE FUNCTION paso_insert ()
RETURNS trigger
LANGUAGE plpgsql AS $f$
BEGIN
CASE
WHEN NEW.FlightDate < DATE '1988-01-01'
THEN INSERT INTO clean.paso_1987 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1989-01-01'
THEN INSERT INTO clean.paso_1988 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1990-01-01'
THEN INSERT INTO clean.paso_1989 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1991-01-01'
THEN INSERT INTO clean.paso_1990 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1992-01-01'
THEN INSERT INTO clean.paso_1991 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1993-01-01'
THEN INSERT INTO clean.paso_1992 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1994-01-01'
THEN INSERT INTO clean.paso_1993 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1995-01-01'
THEN INSERT INTO clean.paso_1994 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1996-01-01'
THEN INSERT INTO clean.paso_1995 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1997-01-01'
THEN INSERT INTO clean.paso_1996 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1998-01-01'
THEN INSERT INTO clean.paso_1997 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '1999-01-01'
THEN INSERT INTO clean.paso_1998 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2000-01-01'
THEN INSERT INTO clean.paso_1999 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2001-01-01'
THEN INSERT INTO clean.paso_2000 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2002-01-01'
THEN INSERT INTO clean.paso_2001 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2003-01-01'
THEN INSERT INTO clean.paso_2002 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2004-01-01'
THEN INSERT INTO clean.paso_2003 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2005-01-01'
THEN INSERT INTO clean.paso_2004 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2006-01-01'
THEN INSERT INTO clean.paso_2005 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2007-01-01'
THEN INSERT INTO clean.paso_2006 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2008-01-01'
THEN INSERT INTO clean.paso_2007 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2009-01-01'
THEN INSERT INTO clean.paso_2008 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2010-01-01'
THEN INSERT INTO clean.paso_2009 VALUES (NEW.*);
WHEN NEW.FlightDate < DATE '2011-01-01'
THEN INSERT INTO clean.paso_2010 VALUES (NEW.*);
ELSE
INSERT INTO paso_overflow VALUES (NEW.*);
END CASE;
RETURN NULL;
END;$f$;

CREATE TRIGGER paso_insert BEFORE INSERT ON clean.paso
FOR EACH ROW EXECUTE PROCEDURE paso_insert();