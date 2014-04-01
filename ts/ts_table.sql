-- drop table ts.time_serie cascade;

CREATE SCHEMA IF NOT EXISTS ts;

CREATE TABLE ts.time_serie (
    flightdate        timestamp
   ,uniquecarrier     text
   ,tailnum           text
   ,dayofweek         integer
   ,hourofday		    integer
   ,crsarrtime        integer
   ,depdelay          integer
   ,arrdelay          integer
   ,carrierdelay      integer
   ,weatherdelay      integer
   ,nasdelay          integer
   ,securitydelay     integer
   ,lateaircraftdelay integer
   ,numdelay          integer
   ,numontime         integer
   ,numearly          integer
);

CREATE TABLE ts.time_serie_1987 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1987-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1988-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1988 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1988-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1989-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1989 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1989-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1990-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1990 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1990-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1991-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1991 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1991-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1992-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1992 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1992-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1993-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1993 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1993-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1994-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1994 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1994-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1995-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1995 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1995-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1996-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1996 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1996-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1997-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1997 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1997-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1998-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1998 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1998-01-01 00:00:00'
AND flightdate <= TIMESTAMP '1999-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_1999 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '1999-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2000-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2000 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2000-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2001-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2001 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2001-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2002-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2002 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2002-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2003-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2003 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2003-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2004-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2004 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2004-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2005-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2005 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2005-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2006-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2006 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2006-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2007-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2007 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2007-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2008-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2008 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2008-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2009-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2009 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2009-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2010-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE TABLE ts.time_serie_2010 (
CONSTRAINT partition_date_range
CHECK (flightdate > TIMESTAMP '2010-01-01 00:00:00'
AND flightdate <= TIMESTAMP '2010-01-01 00:00:00')
) INHERITS ( ts.time_serie );

CREATE or replace FUNCTION serie_insert ()
RETURNS trigger
LANGUAGE plpgsql AS $f$
BEGIN
CASE
WHEN new.flightdate <= TIMESTAMP '1988-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1987 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1989-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1988 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1990-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1989 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1991-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1990 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1992-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1991 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1993-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1992 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1994-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1993 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1995-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1994 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1996-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1995 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1997-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1996 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1998-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1997 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '1999-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1998 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2000-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_1999 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2001-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2000 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2002-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2001 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2003-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2002 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2004-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2003 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2005-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2004 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2006-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2005 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2007-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2006 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2008-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2007 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2009-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2008 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2010-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2009 VALUES (NEW.*);
WHEN new.flightdate <= TIMESTAMP '2011-01-01 00:00:00'
THEN INSERT INTO ts.time_serie_2010 VALUES (NEW.*);
ELSE
INSERT INTO dirty.rita_overflow VALUES (NEW.*);
END CASE;
RETURN NULL;
END;$f$;

CREATE TRIGGER serie_insert BEFORE INSERT ON ts.time_serie
FOR EACH ROW EXECUTE PROCEDURE serie_insert();
