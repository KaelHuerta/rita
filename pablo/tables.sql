drop table dirty.airports cascade;
create table dirty.airports(iata text, airport text, city text, state text, country text, lat real, long real);

drop table dirty.carriers cascade;
create table dirty.carriers(Code text, description text);

drop table results.hub cascade;
create table results.hub (dest text, year integer, grado integer);

drop table results.dest cascade;
create table results.dest (uniquecarrier text, year integer, numdest integer);


\copy dirty.airports from /Users/pablobosch/Desktop/Rita/airports.csv with csv
\copy dirty.carriers from /Users/pablobosch/Desktop/Rita/carriers.csv with csv