#!/bin/bash

date
# Para revisar si un archivo existe o no
[ -f ./datos/rita.urls ] && rm ./datos/rita.urls

# Generamos archivo sobre el cual iterar en paralelo
for year in {1987..2008}
do
echo "http://stat-computing.org/dataexpo/2009/$year.csv.bz2" >> ./datos/rita.urls
done

echo "$(tput setaf 1)Descargando los catálogos...$(tput sgr0)"
echo "http://stat-computing.org/dataexpo/2009/airports.csv" >> ./datos/rita.urls
echo "http://stat-computing.org/dataexpo/2009/plane-data.csv" >> ./datos/rita.urls
echo "http://stat-computing.org/dataexpo/2009/carriers.csv" >> ./datos/rita.urls

# Descargamos en paralelo
cat ./datos/rita.urls | parallel curl -O

rm ./datos/rita.urls

date

mailx -s "Rita descargada." < /dev/null "kaelhuerta@gmail.com"