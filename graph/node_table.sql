CREATE SCHEMA IF NOT EXISTS graph;

CREATE TABLE graph.nodes (
    year        integer
   ,code        text
   ,airportname text
   ,city        text
   ,country     text
   ,latitude    numeric
   ,longitude   numeric
   ,departures  integer
   ,arrivals    integer
);

CREATE TABLE graph.edges (
    year            integer
   ,origin          text
   ,dest            text
   ,weight          integer
   ,cancellations   integer
   ,deviations      integer
   ,numdelay        integer
   ,numontime       integer
   ,numearly        integer
   ,avgdepdelay     numeric
   ,avgarrdelay     numeric
   ,distance        numeric
   ,airtime         numeric
   ,avgcarrierdelay numeric
   ,avgweatherdelay numeric
   ,avgnasdelay     numeric
   ,avgsecurdelay   numeric
   ,avgplanedelay   numeric
);