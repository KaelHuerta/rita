-- drop table alfie.alfie cascade;
-- drop schema alfie;

CREATE SCHEMA IF NOT EXISTS alfie;

CREATE TABLE alfie.alfie (
      uniquecarrier  text   
	 ,tailnum        text   
     ,year           integer
     ,month          integer 
	 ,firsttail      date  
	 ,lasttail       date 
	 ,delaymonth     numeric
	 ,kmcarrier      integer
	 ,flytimecarrier numeric
	 ,flightscarrier integer
	 ,avgmonthdelay  numeric
	 ,numdest        integer
);

CREATE TABLE alfie.alfie_1987 (
CONSTRAINT partition_date_range
CHECK (year = 1987)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1988 (
CONSTRAINT partition_date_range
CHECK (year = 1988)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1989 (
CONSTRAINT partition_date_range
CHECK (year = 1989)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1990 (
CONSTRAINT partition_date_range
CHECK (year = 1990)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1991 (
CONSTRAINT partition_date_range
CHECK (year = 1991)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1992 (
CONSTRAINT partition_date_range
CHECK (year = 1992)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1993 (
CONSTRAINT partition_date_range
CHECK (year = 1993)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1994 (
CONSTRAINT partition_date_range
CHECK (year = 1994)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1995 (
CONSTRAINT partition_date_range
CHECK (year = 1995)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1996 (
CONSTRAINT partition_date_range
CHECK (year = 1996)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1997 (
CONSTRAINT partition_date_range
CHECK (year = 1997)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1998 (
CONSTRAINT partition_date_range
CHECK (year = 1998)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_1999 (
CONSTRAINT partition_date_range
CHECK (year = 1999)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2000 (
CONSTRAINT partition_date_range
CHECK (year = 2000)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2001 (
CONSTRAINT partition_date_range
CHECK (year = 2001)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2002 (
CONSTRAINT partition_date_range
CHECK (year = 2002)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2003 (
CONSTRAINT partition_date_range
CHECK (year = 2003)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2004 (
CONSTRAINT partition_date_range
CHECK (year = 2004)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2005 (
CONSTRAINT partition_date_range
CHECK (year = 2005)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2006 (
CONSTRAINT partition_date_range
CHECK (year = 2006)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2007 (
CONSTRAINT partition_date_range
CHECK (year = 2007)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2008 (
CONSTRAINT partition_date_range
CHECK (year = 2008)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2009 (
CONSTRAINT partition_date_range
CHECK (year = 2009)
) INHERITS ( alfie.alfie );

CREATE TABLE alfie.alfie_2010 (
CONSTRAINT partition_date_range
CHECK (year = 2010)
) INHERITS ( alfie.alfie );

CREATE or replace FUNCTION alfie_insert ()
RETURNS trigger
LANGUAGE plpgsql AS $f$
BEGIN
CASE
WHEN new.year = 1987
THEN INSERT INTO alfie.alfie_1987 VALUES (NEW.*);
WHEN new.year = 1988
THEN INSERT INTO alfie.alfie_1988 VALUES (NEW.*);
WHEN new.year = 1989
THEN INSERT INTO alfie.alfie_1989 VALUES (NEW.*);
WHEN new.year = 1990
THEN INSERT INTO alfie.alfie_1990 VALUES (NEW.*);
WHEN new.year = 1991
THEN INSERT INTO alfie.alfie_1991 VALUES (NEW.*);
WHEN new.year = 1992
THEN INSERT INTO alfie.alfie_1992 VALUES (NEW.*);
WHEN new.year = 1993
THEN INSERT INTO alfie.alfie_1993 VALUES (NEW.*);
WHEN new.year = 1994
THEN INSERT INTO alfie.alfie_1994 VALUES (NEW.*);
WHEN new.year = 1995
THEN INSERT INTO alfie.alfie_1995 VALUES (NEW.*);
WHEN new.year = 1996
THEN INSERT INTO alfie.alfie_1996 VALUES (NEW.*);
WHEN new.year = 1997
THEN INSERT INTO alfie.alfie_1997 VALUES (NEW.*);
WHEN new.year = 1998
THEN INSERT INTO alfie.alfie_1998 VALUES (NEW.*);
WHEN new.year = 1999
THEN INSERT INTO alfie.alfie_1999 VALUES (NEW.*);
WHEN new.year = 2000
THEN INSERT INTO alfie.alfie_2000 VALUES (NEW.*);
WHEN new.year = 2001
THEN INSERT INTO alfie.alfie_2001 VALUES (NEW.*);
WHEN new.year = 2002
THEN INSERT INTO alfie.alfie_2002 VALUES (NEW.*);
WHEN new.year = 2003
THEN INSERT INTO alfie.alfie_2003 VALUES (NEW.*);
WHEN new.year = 2004
THEN INSERT INTO alfie.alfie_2004 VALUES (NEW.*);
WHEN new.year = 2005
THEN INSERT INTO alfie.alfie_2005 VALUES (NEW.*);
WHEN new.year = 2006
THEN INSERT INTO alfie.alfie_2006 VALUES (NEW.*);
WHEN new.year = 2007
THEN INSERT INTO alfie.alfie_2007 VALUES (NEW.*);
WHEN new.year = 2008
THEN INSERT INTO alfie.alfie_2008 VALUES (NEW.*);
WHEN new.year = 2009
THEN INSERT INTO alfie.alfie_2009 VALUES (NEW.*);
WHEN new.year = 2010
THEN INSERT INTO alfie.alfie_2010 VALUES (NEW.*);
ELSE
INSERT INTO alfie.alfie VALUES (NEW.*);
END CASE;
RETURN NULL;
END;$f$;

CREATE TRIGGER alfie_insert BEFORE INSERT ON alfie.alfie
FOR EACH ROW EXECUTE PROCEDURE alfie_insert();
