-- drop table alfie.alfie cascade;
-- drop schema alfie;

CREATE SCHEMA alfie;

CREATE TABLE alfie.alfie (
	uniquecarrier text   
	 ,tailnum       text   
	 ,flightdate    date   
	 ,origin        text   
	 ,dest          text   
	 ,first         date  
	 ,last          date 
	 ,lag           text   
	 ,deptime       integer
	 ,month_delay   numeric
	 ,year_delay    numeric
	 ,km_carrier    real
	 ,qdist 		integer
	 ,qtime			integer
	 ,flytime		real
	 ,flights		integer
	 ,delays 		real   
);

CREATE TABLE alfie.alfie_1987 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1987-01-01'
AND flightdate <= DATE'1987-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1988 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1988-01-01'
AND flightdate <= DATE'1988-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1989 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1989-01-01'
AND flightdate <= DATE'1989-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1990 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1990-01-01'
AND flightdate <= DATE'1990-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1991 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1991-01-01'
AND flightdate <= DATE'1991-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1992 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1992-01-01'
AND flightdate <= DATE'1992-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1993 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1993-01-01'
AND flightdate <= DATE'1993-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1994 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1994-01-01'
AND flightdate <= DATE'1994-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1995 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1995-01-01'
AND flightdate <= DATE'1995-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1996 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1996-01-01'
AND flightdate <= DATE'1996-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1997 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1997-01-01'
AND flightdate <= DATE'1997-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1998 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1998-01-01'
AND flightdate <= DATE'1998-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1999 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '1999-01-01'
AND flightdate <= DATE'1999-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2000 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2000-01-01'
AND flightdate <= DATE'2000-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2001 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2001-01-01'
AND flightdate <= DATE'2001-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2002 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2002-01-01'
AND flightdate <= DATE'2002-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2003 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2003-01-01'
AND flightdate <= DATE'2003-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2004 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2004-01-01'
AND flightdate <= DATE'2004-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2005 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2005-01-01'
AND flightdate <= DATE'2005-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2006 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2006-01-01'
AND flightdate <= DATE'2006-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2007 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2007-01-01'
AND flightdate <= DATE'2007-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2008 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2008-01-01'
AND flightdate <= DATE'2008-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2009 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2009-01-01'
AND flightdate <= DATE'2009-12-31')
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2010 (
CONSTRAINT partition_date_range
CHECK (flightdate >=  DATE '2010-01-01'
AND flightdate <= DATE'2010-12-31')
) INHERITS ( alfie.alfie );

CREATE or replace FUNCTION alfie_insert ()
RETURNS trigger
LANGUAGE plpgsql AS $f$
BEGIN
CASE
WHEN new.flightdate < DATE '1988-01-01'
THEN INSERT INTO alfie.alfie_1987 VALUES (NEW.*);
WHEN new.flightdate < DATE '1989-01-01'
THEN INSERT INTO alfie.alfie_1988 VALUES (NEW.*);
WHEN new.flightdate < DATE '1990-01-01'
THEN INSERT INTO alfie.alfie_1989 VALUES (NEW.*);
WHEN new.flightdate < DATE '1991-01-01'
THEN INSERT INTO alfie.alfie_1990 VALUES (NEW.*);
WHEN new.flightdate < DATE '1992-01-01'
THEN INSERT INTO alfie.alfie_1991 VALUES (NEW.*);
WHEN new.flightdate < DATE '1993-01-01'
THEN INSERT INTO alfie.alfie_1992 VALUES (NEW.*);
WHEN new.flightdate < DATE '1994-01-01'
THEN INSERT INTO alfie.alfie_1993 VALUES (NEW.*);
WHEN new.flightdate < DATE '1995-01-01'
THEN INSERT INTO alfie.alfie_1994 VALUES (NEW.*);
WHEN new.flightdate < DATE '1996-01-01'
THEN INSERT INTO alfie.alfie_1995 VALUES (NEW.*);
WHEN new.flightdate < DATE '1997-01-01'
THEN INSERT INTO alfie.alfie_1996 VALUES (NEW.*);
WHEN new.flightdate < DATE '1998-01-01'
THEN INSERT INTO alfie.alfie_1997 VALUES (NEW.*);
WHEN new.flightdate < DATE '1999-01-01'
THEN INSERT INTO alfie.alfie_1998 VALUES (NEW.*);
WHEN new.flightdate < DATE '2000-01-01'
THEN INSERT INTO alfie.alfie_1999 VALUES (NEW.*);
WHEN new.flightdate < DATE '2001-01-01'
THEN INSERT INTO alfie.alfie_2000 VALUES (NEW.*);
WHEN new.flightdate < DATE '2002-01-01'
THEN INSERT INTO alfie.alfie_2001 VALUES (NEW.*);
WHEN new.flightdate < DATE '2003-01-01'
THEN INSERT INTO alfie.alfie_2002 VALUES (NEW.*);
WHEN new.flightdate < DATE '2004-01-01'
THEN INSERT INTO alfie.alfie_2003 VALUES (NEW.*);
WHEN new.flightdate < DATE '2005-01-01'
THEN INSERT INTO alfie.alfie_2004 VALUES (NEW.*);
WHEN new.flightdate < DATE '2006-01-01'
THEN INSERT INTO alfie.alfie_2005 VALUES (NEW.*);
WHEN new.flightdate < DATE '2007-01-01'
THEN INSERT INTO alfie.alfie_2006 VALUES (NEW.*);
WHEN new.flightdate < DATE '2008-01-01'
THEN INSERT INTO alfie.alfie_2007 VALUES (NEW.*);
WHEN new.flightdate < DATE '2009-01-01'
THEN INSERT INTO alfie.alfie_2008 VALUES (NEW.*);
WHEN new.flightdate < DATE '2010-01-01'
THEN INSERT INTO alfie.alfie_2009 VALUES (NEW.*);
WHEN new.flightdate < DATE '2011-01-01'
THEN INSERT INTO alfie.alfie_2010 VALUES (NEW.*);
ELSE
INSERT INTO alfie.alfie VALUES (NEW.*);
END CASE;
RETURN NULL;
END;$f$;

CREATE TRIGGER alfie_insert BEFORE INSERT ON alfie.alfie
FOR EACH ROW EXECUTE PROCEDURE alfie_insert();
