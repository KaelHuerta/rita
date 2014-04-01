#!/bin/bash

 
#psql -f tables.sql -d rita

parallel -j +0 --eta 'psql -f hubs.sql -d rita -v v1={}' ::: $(seq 1987 2009) && parallel -j +0 --eta 'psql -f dest.sql -d rita -v v1={}' ::: $(seq 1987 2009) 

# psql -d rita -c "select * from results.hub H left join dirty.airports A on A.iata = H.dest" 
# psql -d rita -c "select * from results.dest D left join dirty.carriers C on C.code = D.dest"