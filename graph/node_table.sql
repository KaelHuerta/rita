CREATE SCHEMA graph;

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

);