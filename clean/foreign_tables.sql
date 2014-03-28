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