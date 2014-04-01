library(dplyr)

rita <- src_postgres(dbname = 'rita')
query1 <- tbl(rita, sql('SELECT uniquecarrier, min(firsttail) FROM alfie.alfie GROUP BY uniquecarrier'))
query2 <- tbl(rita, sql('SELECT tailnum, min(firsttail) FROM alfie.alfie GROUP BY tailnum'))
query3 <- tbl(rita, sql('SELECT uniquecarrier, sum(kmcarrier) FROM alfie.alfie GROUP BY uniquecarrier ORDER BY sum(kmcarrier) DESC LIMIT 10'))
query4 <- tbl(rita, sql('SELECT uniquecarrier, sum(flightscarrier) FROM alfie.alfie GROUP BY uniquecarrier ORDER BY sum(flightscarrier) DESC LIMIT 10'))
query5 <- tbl(rita, sql('SELECT uniquecarrier, sum(flytimecarrier) FROM alfie.alfie GROUP BY uniquecarrier'))

system.time(collect(query1))
#  user  system elapsed 
#  0.012   0.000 217.735

system.time(collect(query2))
system.time(collect(query3))
system.time(collect(query4))
system.time(collect(query5))


#   user   system  elapsed 
#   0.154    0.020 4446.800 

#   user  system elapsed 
#  0.009   0.000 212.138 

#   user  system elapsed 
#  0.005   0.004 213.506 

#   user  system elapsed 
#   0.01    0.00  281.42 